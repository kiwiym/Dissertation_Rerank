import os
import argparse
from tqdm import tqdm
from utils import load_jsonl, dump_jsonl
from slm import create_prompt, ask_ollama

def run_slm_nq(retrieval_result, model_name, prompt_id, output_dir):
    from utils import load_cp_model, extract_qtype
    cp = load_cp_model()

    slm_res = []
    
    ret_res = load_jsonl(retrieval_result)
    for result in tqdm(ret_res):
        qid = result['id']
        question = result['input']
        qtype = extract_qtype(question, cp)
        tmp_res = []
        for passage in result['passages']:
            pid = passage['pid']
            text = passage['text']
            if qtype != "unknown":
                prompt = create_prompt(prompt_id, qtype, text)
                relevance = ask_ollama(prompt, model=model_name)
            else:
                relevance = "1"
            tmp_res.append({"pid": pid, "relevance": relevance})
        slm_res.append({"qid": qid, "input": question, "qtype": qtype, "passages": tmp_res})
        break
    
    dump_jsonl(output_dir, slm_res)
    

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Scoring')
    parser.add_argument('dataset', type=str, help='')
    parser.add_argument('-r', type=str, help='')
    parser.add_argument('-p', type=int, help='')
    parser.add_argument('-m', type=str, help='')
    parser.add_argument('-o', type=str, help='')
    args = parser.parse_args()

    if args.dataset.lower().strip() == 'nq':
        output_dir = os.path.join(args.o, f"{args.m}", f"prompt-{args.p}")
        os.makedirs(output_dir, exist_ok=True)
        output_dir = os.path.join(output_dir, args.r.split("/")[-1])
        run_slm_nq(args.r, args.m, args.p, output_dir)
    elif args.dataset.lower().strip() == 'esg':
        raise NotImplementedError
    else:
        raise NotImplementedError
