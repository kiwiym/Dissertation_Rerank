import os
import json
import pickle
import pandas as pd

def load_cp_model():
    import hanlp
    tok = hanlp.load(hanlp.pretrained.tok.UD_TOK_MMINILMV2L12)
    cp = hanlp.load(hanlp.pretrained.constituency.CTB9_CON_FULL_TAG_ERNIE_GRAM)
    return lambda x: cp(tok(x))

def extract_qtype(question, cp):
    tree = cp(question)
    for s in tree.subtrees(lambda t: t.height() == 3):
        if s.label().startswith("WH") or s.label().endswith("WH"):
            return s.leaves()[0]
    return "unknown"

def load_jsonl(filepath):
    with open(filepath, "r") as f:
        results = [json.loads(line) for line in f.read().split("\n") if len(line.strip()) > 0]
    return results

def dump_jsonl(filepath, obj):
    with open(filepath, "w") as f:
        for entry in obj:
            json.dump(entry, f, ensure_ascii=False)
            f.write('\n')

def load_pickle(filepath):
    with open(filepath, "rb") as f:
        obj = pickle.load(f)
    return obj

def dump_pickle(filepath, obj):
    with open(filepath, "wb") as f:
        pickle.dump(obj, f)

def load_esg_gold(report_id, dir):
    return pd.read_csv(os.path.join(dir, str(report_id), "esg_df_v0.3.csv")).drop(columns=["Unnamed: 0"])

def load_retrieval_result(report_id, dir):
    return load_jsonl(os.path.join(dir, f"dev_{report_id}.jsonl"))

def is_in_gold(pid, gold_chunks):
    if len(pid.strip().split("::")) != 2:
        return False
    passage_id = pid.strip().split("::")[0]
    pred_chunks = [int(v.strip()) for v in pid.strip().split("::")[1][1:-1].split(",")]
    pred_chunks = set(range(pred_chunks[0], pred_chunks[1] + (0 if pid.endswith(")") and pred_chunks[0] != pred_chunks[1] else 1)))
    if type(gold_chunks) == set:
        return len(pred_chunks & gold_chunks)
    elif type(gold_chunks) == dict:
        if passage_id in gold_chunks:
            return len(pred_chunks & gold_chunks[passage_id])
        else:
            0
    else:
        raise NotImplementedError
