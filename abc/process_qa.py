import os
import json
import argparse
from tqdm import tqdm
from collections import Counter
from amr_graph import AMRExtractor
from utils import load_pickle, load_jsonl,load_esg_gold, load_cp_model, extract_qtype

def process_nq(cp, qa_dict, questions):
    for qid in tqdm(questions, desc="Extracting Features"):
        questions[qid].append(extract_qtype(questions[qid][0], cp))

    qtype_feature_dicts = {}

    for qid in tqdm(questions, desc="Counting Features"):
        qtype = questions[qid][-1]
        ans_graphs = qa_dict[qid][1]
        features = []
        for graph in ans_graphs:
            for edge in graph.edges():
                features.append(edge.role[1:])
            for ins in graph.instances():
                features.append(ins.target)
        
        if qtype in qtype_feature_dicts:
            qtype_feature_dicts[qtype] = qtype_feature_dicts[qtype] + Counter(features)
        else:
            qtype_feature_dicts[qtype] = Counter(features)

    total_counter = None
    for key in qtype_feature_dicts:
        if total_counter is None:
            total_counter = qtype_feature_dicts[key].copy()
        else:
            total_counter = total_counter + qtype_feature_dicts[key]

    with open("nq-dev-normal-scorer.json", "w") as f:
        json.dump(qtype_feature_dicts, f)

    tf_idf_feature_dicts = {}
    for key in qtype_feature_dicts:
        tf_idf_feature_dicts[key] = {}
        for k, v in sorted([(k, v) for k, v in qtype_feature_dicts[key].items() if v > 5], key=lambda x: x[1])[::-1][:20]:
            tf_idf_feature_dicts[key][k] = v / total_counter[k]
    with open("nq-dev-tfidf-scorer.json", "w") as f:
        json.dump(tf_idf_feature_dicts, f)

def process_esg(esg_amr_dir, dataset_dir):
    report_ids = [f for f in os.listdir(dataset_dir) if f.startswith("1")]
    amr_ext = AMRExtractor(load=False)

    qtype_feature_dicts = {}
    for report_id in tqdm(report_ids, total=len(report_ids)):
        qa_dict = load_pickle(os.path.join(esg_amr_dir, str(report_id), "qa_amr.pkl"))

        esg_gold_df = load_esg_gold(report_id, dir=dataset_dir)

        for i, gold in esg_gold_df.iterrows():
            qid = f"{gold.pid}{i}"
            if gold.question.startswith("Is"):
                qtype = "Qualitative"
            else:
                qtype = "Quantitaive"
            
            features = Counter(amr_ext.extract_features(qa_dict[qid][1]))
                
            if qtype in qtype_feature_dicts:
                qtype_feature_dicts[qtype] = qtype_feature_dicts[qtype] + Counter(features)
            else:
                qtype_feature_dicts[qtype] = Counter(features)

    with open("esg-1-scorer.json", "w") as f:
        json.dump(qtype_feature_dicts, f)

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Process QA')
    parser.add_argument('dataset', type=str, help='')
    parser.add_argument('-p', type=str, help='')
    parser.add_argument('-g', type=str, help='')
    args = parser.parse_args()

    if args.dataset.lower().strip() == 'nq':
        cp = load_cp_model()
        qa_dict = load_pickle(args.p)
        questions = load_jsonl(args.g)
        questions = {question['id'] : [question['input'], 
                                    [ans['answer'] for ans in question['output'] if 'answer' in ans]] for question in tqdm(questions, desc="Extracting")}
        process_nq(cp, qa_dict, questions)
    elif args.dataset.lower().strip() == 'esg':
        process_esg(args.g, args.p)
    else:
        raise NotImplementedError