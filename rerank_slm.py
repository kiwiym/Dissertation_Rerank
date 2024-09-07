import os
import argparse
from tqdm import tqdm
from utils import load_pickle

from utils import load_retrieval_result, dump_jsonl, load_jsonl

def rerank_esg(retrieval_result_dir, slm_result, output_dir):
    report_ids = [f.split(".")[0][4:] for f in os.listdir(retrieval_result_dir) if f.startswith("dev_")]
    count = 0
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
                    if type(slm_result) == dict:
                        if pid in slm_result:
                            slm_res = slm_result[pid]
                            if slm_res > 0:
                                score = 1.0
                            else:
                                score = 0.0
                        else:
                            score = 0.0
                    elif type(slm_result) == list:
                        assert pid == slm_result[count][0]
                        score = 1.0 if slm_result[count][-1] > 0 else 0.0
                        count += 1
                    else:
                        raise NotImplementedError
                    tmp_scores.append({"pid": pid, "score": score, "before": i + 1})
                rerank_res[-1]['passages'] = sorted(tmp_scores, key=lambda x: -x['score'])
        
        dump_jsonl(os.path.join(output_dir, f"dev_{report_id}.jsonl"), rerank_res)

def rerank_nq(slm_result, output_dir):
    rerank_res = []
    qtypes = ['who', 'when', 'where', 'why', 'which', 'how', 'what']

    for ret in tqdm(slm_result, total=len(slm_result), desc="Reranking"):
        # rerank_res.append({'id': ret['qid'], 'input': ret['input'], 'qtype': ret['qtype'], 'passages': []})
        rerank_res.append({'id': ret['qid'], 'input': ret['input'], 'passages': []})
        tmp_scores = []
        for i, passage in enumerate(ret['passages']):
        # for i, passage in enumerate(ret['scored_pids']):
            pid = passage['pid']
            # if ret['qtype'].lower() not in qtypes:
            #     tmp_scores.append({"pid": pid, "score": 0.0, "before": i + 1})
            #     rerank_res[-1]['passages'] = tmp_scores
            # else:
            if passage['filter_res'] > 0.1:
                score = 1.0
            else:
                score = 0.0
            tmp_scores.append({"pid": pid, "score": score, "before": i + 1})
            rerank_res[-1]['passages'] = sorted(tmp_scores, key=lambda x: -x['score'])

    dump_jsonl(output_dir, rerank_res)

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Process QA')
    parser.add_argument('dataset', type=str, help='')
    parser.add_argument('-s', type=str, help='')
    parser.add_argument('-r', type=str, help='', required=False)
    parser.add_argument('-m', type=str, help='', required=False)
    parser.add_argument('-p', type=str, help='', required=False)
    parser.add_argument('-o', type=str, help='', required=False)
    args = parser.parse_args()

    if args.dataset.lower().strip() == 'nq':
        slm_result = load_jsonl(args.s)
        output_dir = args.s.replace("_filtered.jsonl", "_rerank.jsonl")
        rerank_res = rerank_nq(slm_result, output_dir)
    elif args.dataset.lower().strip() == 'esg':
        # slm_result = load_pickle(args.s)[f"{args.m}-prompt-{args.p}"]
        slm_result = load_pickle(args.s)
        output_dir = os.path.join(args.o, args.m, f"prompt-{args.p}", args.r.split("/")[-2])
        os.makedirs(output_dir, exist_ok=True)
        rerank_res = rerank_esg(args.r, slm_result, output_dir)
    else:
        raise NotImplementedError