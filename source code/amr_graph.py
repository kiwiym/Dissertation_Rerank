import hanlp
from utils import dump_pickle
from collections import Counter

class AMRExtractor:

    def __init__(self, load=True):
        self.split_sent = None
        self.amr_parser = None
        if load:
            self._load_models()

    def _load_models(self):
        self.split_sent = hanlp.load(hanlp.pretrained.eos.UD_CTB_EOS_MUL)
        self.amr_parser = hanlp.load(hanlp.pretrained.amr.AMR3_SEQ2SEQ_BART_LARGE)

    def extract_graphs_from_sents(self, sents):
        try:
            graphs = self.amr_parser(sents)
        except Exception as e:
            print(e)
            graphs = []
        return graphs

    def extract_graphs_from_paragraph(self, paragraph):
        try:
            sents = self.split_sent(paragraph)
            graphs = self.amr_parser(sents)
        except Exception as e:
            print(e)
            graphs = []
        return graphs
    
    def extract_features(self, graphs):
        features = []
        for graph in graphs:
            for edge in graph.edges():
                features.append(edge.role[1:])
            for ins in graph.instances():
                features.append(ins.target)
        return features

    def dump_graphs_details(self, output_path, graphs):
        features = self.extract_features(graphs)
        dump_pickle(output_path, {"graph": graphs, "counter": Counter(features)})

