import os
import argparse
import pandas as pd
from tqdm import tqdm

from utils import *
from amr_graph import AMRExtractor

def load_answers(filepath):
    answers = load_jsonl(filepath)
    result_answers = {}
    for answer in tqdm(answers, desc='Load answers'):
        qid = answer['id']
        anss = []
        for a in answer['output']:
            if 'answer' in a and type(a['answer']) == str:
                anss.append(a['answer'].strip())
        result_answers[qid] = [a for a in set(anss) if a is not None and len(a.strip()) > 0]
    return result_answers

def load_nq(filepath, answers):
    results = load_jsonl(filepath)
    questions = {}
    result_passages = {}
    for result in tqdm(results, desc="Load NQ Retrieval Result"):
        qid = result['id']
        question = result['input']
        questions[qid] = (question, answers[qid])
        for passage in result['passages']:
            if passage['pid'].split("::")[0] in result_passages:
                result_passages[passage['pid'].split("::")[0]][passage['pid']] = passage['text']
            else:
                result_passages[passage['pid'].split("::")[0]] = {passage['pid']: passage['text']}
    return questions, result_passages

def nq_extract(nq_results, output_dir, start=0, size=None):
    if not os.path.exists(output_dir):
        os.makedirs(output_dir)
    elif not os.path.isdir(output_dir):
        raise NotImplementedError
    
    amr_extractor = AMRExtractor()
    questions, result_passages = nq_results
    questions_pkl_fp = os.path.join(output_dir, "qa_amr.pkl")
    questions_amr = load_pickle(questions_pkl_fp) if os.path.exists(questions_pkl_fp) else {}
    for qid, (question, answers) in tqdm(questions.items(), desc='Extract Questions & Answers'):
        if qid in questions_amr:
            continue
        graphs = amr_extractor.extract_graphs_from_sents([question] + answers)
        question_graph, answers_graph = graphs[0], graphs[1:]
        questions_amr[qid] = (question_graph, answers_graph)
        if len(questions_amr) % 5 == 0:
            dump_pickle(questions_pkl_fp, questions_amr)
    dump_pickle(questions_pkl_fp, questions_amr)
    print("Questions & Answers Extraction Finished!")

    current_pid = None
    if size is None:
        pids = list(result_passages.keys())[start:]
    else:
        pids = list(result_passages.keys())[start:start+size]
    for passage_id in tqdm(pids, desc='Extract Paragraphs'):
    # for pid, paragraph in tqdm(result_passages.items(), desc='Extract Paragraphs'):
        for pid, paragraph in result_passages[passage_id].items():
            if current_pid != pid.split("::")[0].strip():
                if current_pid is not None:
                    dump_pickle(passage_pkl_fp, passage_amr)
                current_pid = pid.split("::")[0].strip()
                passage_pkl_fp = os.path.join(output_dir, f"{current_pid}.pkl")
                passage_amr = load_pickle(passage_pkl_fp) if os.path.exists(passage_pkl_fp) else {}
            if pid not in passage_amr or (type(passage_amr[pid]) == list and len(passage_amr[pid]) == 0):
                graphs = amr_extractor.extract_graphs_from_paragraph(paragraph)
                passage_amr[pid] = graphs
    
    if current_pid is not None:
        dump_pickle(passage_pkl_fp, passage_amr)
    print("Paragraphs Extraction Finished!")

def esg_extract(passage_dir, output_dir):
    amr_extractor = AMRExtractor()
    for passage_folder in tqdm(os.listdir(passage_dir), desc='Extract ESG Reports'):
        folder = os.path.join(passage_dir, passage_folder)
        if os.path.isdir(folder) and not passage_folder.startswith("."):
            output_folder = os.path.join(output_dir, passage_folder)
            if not os.path.exists(output_folder):
                os.makedirs(output_folder)

            # QA
            questions_pkl_fp = os.path.join(output_folder, "qa_amr.pkl")
            questions_amr = load_pickle(questions_pkl_fp) if os.path.exists(questions_pkl_fp) else {}
            qdf = pd.read_csv(os.path.join(folder, "esg_df_v0.3.csv")).drop(columns=["Unnamed: 0"])
            for i, row in qdf.iterrows():
                qid = str(row.pid) + str(i)
                if qid in questions_amr:
                    continue
                question = row.question
                answer = row.answer
                graphs = amr_extractor.extract_graphs_from_sents([question, answer])
                if len(graphs) == 0:
                    questions_amr[qid] = (None, None)
                else:
                    question_graph, answers_graph = graphs[0], graphs[1:]
                    questions_amr[qid] = (question_graph, answers_graph)
                if len(questions_amr) % 5 == 0:
                    dump_pickle(questions_pkl_fp, questions_amr)
            dump_pickle(questions_pkl_fp, questions_amr)

            # Paragraphs
            paragraphs_json = os.path.join(folder, "esg_knowledge_source.json")
            with open(paragraphs_json, "r") as f:
                paragraphs = json.loads(f.read())[0]['text']
            for i, paragraph in enumerate(paragraphs):
                graph_fp = os.path.join(output_folder, f"{i}_amr.pkl")
                if not os.path.exists(graph_fp):
                    graphs = amr_extractor.extract_graphs_from_paragraph(paragraph)
                    amr_extractor.dump_graphs_details(graph_fp, graphs)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Prepare AMR Graphs')
    parser.add_argument('dataset', type=str, help='')
    parser.add_argument('-p', type=str, help='')
    parser.add_argument('-o', type=str, help='')
    parser.add_argument('-a', type=str, help='compulsory if NQ', required=False)
    parser.add_argument('-s', type=int, required=False)
    parser.add_argument('-t', type=int, required=False)
    args = parser.parse_args()

    if args.dataset.lower().strip() == 'nq':
        answers = load_answers(args.a)
        nq_results = load_nq(args.p, answers)
        nq_extract(nq_results, args.o, args.s, args.t)
    elif args.dataset.lower().strip() == 'esg':
        esg_extract(args.p, args.o)
    else:
        raise NotImplementedError
    
