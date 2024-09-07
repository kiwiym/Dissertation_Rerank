import os
import argparse
import numpy as np
import pandas as pd
from tqdm import tqdm

from utils import load_retrieval_result, load_esg_gold, is_in_gold, load_jsonl

def calc_mrr(df, num_gold_chunks=None):
    num_gold_chunks = len(df.gold_chunks.iloc[0]) if num_gold_chunks is None else num_gold_chunks
    return np.sum(1 / df[df.gold > 0]["rank"].values) / num_gold_chunks

def calc_mhits(df, at=10, num_gold_chunks=None):
    num_gold_chunks = len(df.gold_chunks.iloc[0]) if num_gold_chunks is None else num_gold_chunks
    return np.sum(df.iloc[:at].gold > 0) / num_gold_chunks

def calc_scores(df, at=10, calc_gold=False):
    res_data = []
    for qid, grp in df.groupby(by="qid"):
        num_gold_chunks = None if not calc_gold else grp.num_gold_chunks.iloc[0]
        mrr = calc_mrr(grp, num_gold_chunks=num_gold_chunks)
        mhits = calc_mhits(grp, at=at, num_gold_chunks=num_gold_chunks)
        res_data.append([qid, mrr, mhits])
    return pd.DataFrame(data=res_data, columns=["qid", "MRR", "MHits"])

def esg_scoring(retrieval_result_dir, esg_gold_dir):
    report_ids = [f.split(".")[0][4:] for f in os.listdir(retrieval_result_dir) if f.startswith("dev_")]
    score_data = []
    for report_id in tqdm(report_ids, total=len(report_ids)):
        retrieval_result = load_retrieval_result(report_id, dir=retrieval_result_dir)
        esg_gold_df = load_esg_gold(report_id, dir=esg_gold_dir)
        assert len(retrieval_result) == len(esg_gold_df)

        res_data = []

        for ret_res, (_, gold) in zip(retrieval_result, esg_gold_df.iterrows()):
            if 'passages' in ret_res:
                key = 'passages'
            elif 'scored_pids' in ret_res:
                key = 'scored_pids'
            qid, question = ret_res['id'], ret_res['input']
            gold_chunks = set([int(v.strip()) for v in gold.chunk_id.strip()[1:-1].split(",")])
            for i, passage in enumerate(ret_res[key]):
                if type(passage) == dict:
                    res_data.append([qid, question, gold_chunks, i + 1, passage['pid'], is_in_gold(passage['pid'], gold_chunks)])
                elif type(passage) == list:
                    res_data.append([qid, question, gold_chunks, i + 1, passage[0], is_in_gold(passage[0], gold_chunks)])
                else:
                    raise NotImplementedError

        res_df = pd.DataFrame(data=res_data, 
                            columns=["qid", "question", "gold_chunks", "rank", "pid", "gold"])
        score_df = calc_scores(res_df)
        score_data.append([report_id, np.mean(score_df.MRR), np.std(score_df.MRR)])
    return pd.DataFrame(data=score_data, columns=["report_id", "MRR", "MHits"])

def nq_scoring(retrieval_result_fp, gold_fp):
    retrieval_result = load_jsonl(retrieval_result_fp)
    golds = load_jsonl(gold_fp)
    assert len(retrieval_result) == len(golds)

    res_data = []

    for ret_res, gold in tqdm(zip(retrieval_result, golds), total=len(retrieval_result), desc="Scoring"):
        if 'passages' in ret_res:
            key = 'passages'
        elif 'scored_pids' in ret_res:
            key = 'scored_pids'
        question = ret_res['input']
        qid = ret_res['id'] if 'id' in ret_res else ret_res['qid']
        qtype = ret_res['qtype'] if 'qtype' in ret_res else None
        gold_chunks = {}
        for chunk_range in gold['positive_pids']:
            chunk_pid = chunk_range.split("::")[0]
            chunks = [int(v) for v in chunk_range.split("::")[1].strip()[1:-1].split(",")]
            chunks[1] = (chunks[1] + 1) if chunk_pid[-1] == ']' or chunks[0] == chunks[1] else chunks[1]
            if chunk_pid in gold_chunks:
                gold_chunks[chunk_pid] = gold_chunks[chunk_pid] | set(list(range(chunks[0], chunks[1])))
            else:
                gold_chunks[chunk_pid] = set(list(range(chunks[0], chunks[1])))
        gold_chunks_text = ";".join([f"{k}::{' '.join(list([str(vv) for vv in v]))}" for k, v in gold_chunks.items()])
        # num_gold_chunks = sum([len(v) for k, v in gold_chunks.items()])
        num_gold_chunks = len(gold['positive_pids'])
        for i, passage in enumerate(ret_res[key]):
            if type(passage) == dict:
                res_data.append([qid, question, gold_chunks_text, num_gold_chunks, qtype, i + 1, passage['pid'], is_in_gold(passage['pid'], gold_chunks)])
            elif type(passage) == list:
                res_data.append([qid, question, gold_chunks_text, num_gold_chunks, qtype, i + 1, passage[0], is_in_gold(passage[0], gold_chunks)])
            else:
                raise NotImplementedError

    res_df = pd.DataFrame(data=res_data, 
                        columns=["qid", "question", "gold_chunks", "num_gold_chunks", "qtype", "rank", "pid", "gold"])
    score_df = calc_scores(res_df, calc_gold=True)
    return np.mean(score_df.MRR), np.mean(score_df.MHits)

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Scoring')
    parser.add_argument('dataset', type=str, help='')
    parser.add_argument('-r', type=str, help='')
    parser.add_argument('-g', type=str, help='')
    args = parser.parse_args()

    if args.dataset.lower().strip() == 'nq':
        mrr, mhits = nq_scoring(args.r, args.g)
        print(f"{args.dataset} - {args.r.split('/')[-1]}")
        print("MRR:%.4f" % mrr)
        print("MHits:%.4f" % mhits)
    elif args.dataset.lower().strip() == 'esg':
        res_df = esg_scoring(args.r, args.g)
        print(f"{args.dataset} - {len(res_df)} Passages - {args.r.split('/')[-1]}")
        print("MRR:\t%.4f±%.4f" % (res_df.MRR.mean(), res_df.MRR.std()))
        print("MHits:\t%.4f±%.4f" % (res_df.MHits.mean(), res_df.MHits.std()))
    else:
        raise NotImplementedError
