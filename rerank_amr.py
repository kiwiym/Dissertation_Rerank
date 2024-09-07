import os
import json
import argparse
import numpy as np
from tqdm import tqdm
from collections import Counter
from utils import load_retrieval_result, load_pickle, dump_jsonl, load_jsonl

def load_scoring(s_dir, scoring_type):
    with open(s_dir, "r") as f:
        scoring_dict = json.load(f)
    if scoring_type == 'S1' or scoring_type == 'S-TFIDF':
        for qtype, scores in scoring_dict.items():
            total = sum(scores.values())
            scoring_dict[qtype] = {k : v / total for k, v in scores.items()}
        return scoring_dict
    elif scoring_type == 'S2':
        for qtype, scores in scoring_dict.items():
            total = np.sum(np.exp(list(scores.values())))
            scoring_dict[qtype] = {k : np.exp(v) / total for k, v in scores.items()}
        return scoring_dict
    elif scoring_type == 'S-EXT':
        for qtype, scores in scoring_dict.items():
            total = sum(scores.values())
            scoring_dict[qtype] = set(scores.keys())
        return scoring_dict
    else:
        raise NotImplementedError

def rerank_esg(retrieval_result_dir, amr_by_report, scoring_dict, output_dir):
    report_ids = [f.split(".")[0][4:] for f in os.listdir(retrieval_result_dir) if f.startswith("dev_")]
    for report_id in tqdm(report_ids, desc="Reranking"):
        ret_res = load_retrieval_result(report_id, retrieval_result_dir)

        rerank_res = []

        for ret in ret_res:
            rerank_res.append({'id': ret['id'], 'input': ret['input'], 'passages': []})
            if ret['input'].startswith("Is"):
                qtype = 'Qualitative'
                rerank_res[-1]['passages'] = [{'pid': passage['pid'], 
                                            'score': 0.0} for passage in ret['passages']]
            else:
                qtype = 'Quantitaive'
                tmp_scores = []
                for i, passage in enumerate(ret['passages']):
                    pid = passage['pid']
                    if len(pid.strip().split("::")) == 2:
                        pred_chunks = [int(v.strip()) for v in pid.strip().split("::")[1][1:-1].split(",")]
                        chunk_counter = Counter()
                        for chunk in range(pred_chunks[0], pred_chunks[1] + (0 if pid.endswith(")") else 1)):
                            if str(chunk) not in amr_by_report[report_id]:
                                continue
                            chunk_counter = chunk_counter + amr_by_report[report_id][str(chunk)]['counter']
                        score = 0.0
                        total = sum(chunk_counter.values())
                        for f, v in chunk_counter.items():
                            if f in scoring_dict[qtype]:
                                if type(scoring_dict[qtype]) == dict:
                                    score += v * scoring_dict[qtype][f] / total
                                elif type(scoring_dict[qtype]) == set:
                                    score =  1.0
                                    break
                                else:
                                    raise NotImplementedError
                    else:
                        score = 0.0
                    tmp_scores.append({"pid": pid, "score": score, "before": i + 1})
                rerank_res[-1]['passages'] = sorted(tmp_scores, key=lambda x: x['score'])[::-1]
        
        dump_jsonl(os.path.join(output_dir, f"dev_{report_id}.jsonl"), rerank_res)

def load_nq_amr_dict(amr_dict_dir):
    amr_dict = {}
    for pid_file in tqdm(os.listdir(amr_dict_dir), desc="Loading AMR Graphs"):
        pid = pid_file[:-4]
        amr_dict[pid] = load_pickle(os.path.join(amr_dict_dir, pid_file))
    return amr_dict

def rerank_nq(retrieval_result, amr_dict, scoring_dict, output_dir):
    from amr_graph import AMRExtractor
    amr_extractor = AMRExtractor(load=False)
    ret_res = load_jsonl(retrieval_result)
    rerank_res = []

    for ret in tqdm(ret_res, total=len(ret_res), desc="Reranking"):
        rerank_res.append({'id': ret['qid'], 'input': ret['input'], 'qtype': ret['qtype'], 'passages': []})
        qtype = ret['qtype']

        tmp_scores = []
        for i, passage in enumerate(ret['passages']):
            pid_full = passage['pid']
            if len(pid_full.split("::")) != 2:
                tmp_scores.append({"pid": pid_full, "score": 0.0, "before": i + 1})
                continue
            pid = pid_full.split("::")[0]
            if pid not in amr_dict or pid_full not in amr_dict[pid]:
                print(f"Missing {pid_full}")
                tmp_scores.append({"pid": pid_full, "score": 0.0, "before": i + 1})
                continue
            amr_graph = amr_dict[pid][pid_full]
            features = Counter(amr_extractor.extract_features(amr_graph))  
            score = 0.0
            total = sum(features.values())
            for f, v in features.items():
                if f in scoring_dict[qtype]:
                    if type(scoring_dict[qtype]) == dict:
                        score += v * scoring_dict[qtype][f] / total
                    elif type(scoring_dict[qtype]) == set:
                        score =  1.0
                        break
                    else:
                        raise NotImplementedError
            tmp_scores.append({"pid": pid_full, "score": score, "before": i + 1})
        rerank_res[-1]['passages'] = sorted(tmp_scores, key=lambda x: -x['score'])
    
    dump_jsonl(os.path.join(output_dir, retrieval_result.split("/")[-1].replace("_wqtype", "")), rerank_res)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Process QA')
    parser.add_argument('dataset', type=str, help='')
    parser.add_argument('scoring', type=str, help='')
    parser.add_argument('-r', type=str, help='')
    parser.add_argument('-a', type=str, help='')
    parser.add_argument('-s', type=str, help='')
    parser.add_argument('-o', type=str, help='')
    args = parser.parse_args()

    scoring_dict = load_scoring(args.s, args.scoring)

    if args.dataset.lower().strip() == 'nq':
        amr_dict = load_nq_amr_dict(args.a)
        output_dir = os.path.join(args.o, args.scoring)
        os.makedirs(output_dir, exist_ok=True)
        rerank_res = rerank_nq(args.r, amr_dict, scoring_dict, output_dir)
    elif args.dataset.lower().strip() == 'esg':
        amr_by_report = {pid: {amr_file.split("_")[0]: load_pickle(os.path.join(args.a, pid, amr_file))
                                for amr_file in os.listdir(os.path.join(args.a, pid)) if amr_file.endswith(".pkl")
                                } for pid in os.listdir(args.a) if not pid.startswith(".")}
        output_dir = os.path.join(args.o, args.scoring)
        os.makedirs(output_dir, exist_ok=True)
        rerank_res = rerank_esg(args.r, amr_by_report, scoring_dict, output_dir)
    else:
        raise NotImplementedError