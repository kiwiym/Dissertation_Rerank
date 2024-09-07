import os
import argparse
from tqdm import tqdm
from utils import load_pickle, dump_pickle
from slm import create_prompt, ask_ollama

    
def run_slm_quick(fp, model_name, prompt_id, output_dir):
    psg_dict = load_pickle(fp)
    result = []
    for psg in tqdm(psg_dict, total=len(psg_dict), desc="SLM-full"):
        prompt = create_prompt(prompt_id, psg[2], psg[1])
        relevance = ask_ollama(prompt, model=model_name)
        result.append([psg[0], psg[1], psg[2], relevance])
    dump_pickle(output_dir, result)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Run SLM Quick')
    parser.add_argument('dict_file', type=str, help='')
    parser.add_argument('-p', type=int, help='')
    parser.add_argument('-m', type=str, help='')
    parser.add_argument('-o', type=str, help='')
    args = parser.parse_args()

    output_dir = os.path.join(args.o, f"{args.m}", f"prompt-{args.p}")
    os.makedirs(output_dir, exist_ok=True)
    output_dir = os.path.join(output_dir, args.dict_file.split("/")[-1])
    run_slm_quick(args.dict_file, args.m, args.p, output_dir)
