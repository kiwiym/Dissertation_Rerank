# # ESG Re2G Retrieval
# echo ""
# echo "Baseline"
# python scoring.py esg -r ../Retrieval\ Results/esg/bm25 -g ../ESG\ Disclosure\ Dataset/Dataset\ by\ Report
# python scoring.py esg -r ../Retrieval\ Results/esg/dprKGI0 -g ../ESG\ Disclosure\ Dataset/Dataset\ by\ Report
# python scoring.py esg -r ../Retrieval\ Results/esg/dpr_bm25 -g ../ESG\ Disclosure\ Dataset/Dataset\ by\ Report
# python scoring.py esg -r ../Retrieval\ Results/esg/rerank_bm25 -g ../ESG\ Disclosure\ Dataset/Dataset\ by\ Report
# python scoring.py esg -r ../Retrieval\ Results/esg/rerank_dpr_bm25 -g ../ESG\ Disclosure\ Dataset/Dataset\ by\ Report

# AMR Rerank
# echo ""
# bm25
# echo "bm25"
# python scoring.py esg -r ../Experimental\ Results/ESG\ Disclosure/AMR/bm25/S1 -g ../ESG\ Disclosure\ Dataset/Dataset\ by\ Report
# python scoring.py esg -r ../Experimental\ Results/ESG\ Disclosure/AMR/bm25/S2 -g ../ESG\ Disclosure\ Dataset/Dataset\ by\ Report
# python scoring.py esg -r ../Experimental\ Results/ESG\ Disclosure/AMR/bm25/S-EXT -g ../ESG\ Disclosure\ Dataset/Dataset\ by\ Report

# dprKGI0
# echo ""
# echo "dprKGI0"
# python scoring.py esg -r ../Experimental\ Results/ESG\ Disclosure/AMR/dprKGI0/S1 -g ../ESG\ Disclosure\ Dataset/Dataset\ by\ Report
# python scoring.py esg -r ../Experimental\ Results/ESG\ Disclosure/AMR/dprKGI0/S2 -g ../ESG\ Disclosure\ Dataset/Dataset\ by\ Report
# python scoring.py esg -r ../Experimental\ Results/ESG\ Disclosure/AMR/dprKGI0/S-EXT -g ../ESG\ Disclosure\ Dataset/Dataset\ by\ Report

# dpr_bm25
# echo ""
# echo "dpr_bm25"
# python scoring.py esg -r ../Experimental\ Results/ESG\ Disclosure/AMR/dpr_bm25/S1 -g ../ESG\ Disclosure\ Dataset/Dataset\ by\ Report
# python scoring.py esg -r ../Experimental\ Results/ESG\ Disclosure/AMR/dpr_bm25/S2 -g ../ESG\ Disclosure\ Dataset/Dataset\ by\ Report
# python scoring.py esg -r ../Experimental\ Results/ESG\ Disclosure/AMR/dpr_bm25/S-EXT -g ../ESG\ Disclosure\ Dataset/Dataset\ by\ Report


# # NQ Re2G Retrieval
# echo ""
# echo "Baseline"
# python scoring.py nq -r ../Retrieval\ Results/nq_dev_bm25_wqtype.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Retrieval\ Results/nq_dev_dpr_wqtype.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Retrieval\ Results/nq_dev_dpr_bm25.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Retrieval\ Results/nq_dev_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl

# # # AMR Rerank
# # # bm25
# echo ""
# echo "bm25"
# python scoring.py nq -r ../Experimental\ Results/NQ/AMR/bm25/S1/nq_dev_bm25.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/AMR/bm25/S2/nq_dev_bm25.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/AMR/bm25/S-EXT/nq_dev_bm25.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/AMR/bm25/S-TFIDF/nq_dev_bm25.jsonl -g ../../NQ/dev_positive_pids.jsonl

# # # dprKGI0
# echo ""
# echo "dprKGI0"
# python scoring.py nq -r ../Experimental\ Results/NQ/AMR/dprKGI0/S1/nq_dev_dpr.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/AMR/dprKGI0/S2/nq_dev_dpr.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/AMR/dprKGI0/S-EXT/nq_dev_dpr.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/AMR/dprKGI0/S-TFIDF/nq_dev_dpr.jsonl -g ../../NQ/dev_positive_pids.jsonl

# # # dpr_bm25
# echo ""
# echo "dpr_bm25"
# python scoring.py nq -r ../Experimental\ Results/NQ/AMR/dpr_bm25/S1/nq_dev_dpr_bm25.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/AMR/dpr_bm25/S2/nq_dev_dpr_bm25.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/AMR/dpr_bm25/S-EXT/nq_dev_dpr_bm25.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/AMR/dpr_bm25/S-TFIDF/nq_dev_dpr_bm25.jsonl -g ../../NQ/dev_positive_pids.jsonl

# SLM Rerank
# ESG
# bm25
# echo "bm25"
# echo "llama2"
# python scoring.py esg -r ../Experimental\ Results/ESG\ Disclosure/SLM/llama2_latest/prompt-0/bm25 -g ../ESG\ Disclosure\ Dataset/Dataset\ by\ Report
# python scoring.py esg -r ../Experimental\ Results/ESG\ Disclosure/SLM/llama2_latest/prompt-1/bm25 -g ../ESG\ Disclosure\ Dataset/Dataset\ by\ Report
# python scoring.py esg -r ../Experimental\ Results/ESG\ Disclosure/SLM/llama2_latest/prompt-2/bm25 -g ../ESG\ Disclosure\ Dataset/Dataset\ by\ Report
# python scoring.py esg -r ../Experimental\ Results/ESG\ Disclosure/SLM/llama2_latest/prompt-3/bm25 -g ../ESG\ Disclosure\ Dataset/Dataset\ by\ Report

# echo "phi3"
# python scoring.py esg -r ../Experimental\ Results/ESG\ Disclosure/SLM/phi3_latest/prompt-0/bm25 -g ../ESG\ Disclosure\ Dataset/Dataset\ by\ Report
# python scoring.py esg -r ../Experimental\ Results/ESG\ Disclosure/SLM/phi3_latest/prompt-1/bm25 -g ../ESG\ Disclosure\ Dataset/Dataset\ by\ Report
# python scoring.py esg -r ../Experimental\ Results/ESG\ Disclosure/SLM/phi3_latest/prompt-2/bm25 -g ../ESG\ Disclosure\ Dataset/Dataset\ by\ Report
# python scoring.py esg -r ../Experimental\ Results/ESG\ Disclosure/SLM/phi3_latest/prompt-3/bm25 -g ../ESG\ Disclosure\ Dataset/Dataset\ by\ Report

# echo "mistral"
# python scoring.py esg -r ../Experimental\ Results/ESG\ Disclosure/SLM/mistral_latest/prompt-0/bm25 -g ../ESG\ Disclosure\ Dataset/Dataset\ by\ Report
# python scoring.py esg -r ../Experimental\ Results/ESG\ Disclosure/SLM/mistral_latest/prompt-1/bm25 -g ../ESG\ Disclosure\ Dataset/Dataset\ by\ Report
# python scoring.py esg -r ../Experimental\ Results/ESG\ Disclosure/SLM/mistral_latest/prompt-2/bm25 -g ../ESG\ Disclosure\ Dataset/Dataset\ by\ Report
# python scoring.py esg -r ../Experimental\ Results/ESG\ Disclosure/SLM/mistral_latest/prompt-3/bm25 -g ../ESG\ Disclosure\ Dataset/Dataset\ by\ Report
# python scoring.py esg -r ../Experimental\ Results/ESG\ Disclosure/SLM/mistral_latest/prompt-4/bm25 -g ../ESG\ Disclosure\ Dataset/Dataset\ by\ Report
# python scoring.py esg -r ../Experimental\ Results/ESG\ Disclosure/SLM/mistral_latest/prompt-5/bm25 -g ../ESG\ Disclosure\ Dataset/Dataset\ by\ Report

# echo "aya_35b"
# python scoring.py esg -r ../Experimental\ Results/ESG\ Disclosure/SLM/aya_35b/prompt-0/bm25 -g ../ESG\ Disclosure\ Dataset/Dataset\ by\ Report
# python scoring.py esg -r ../Experimental\ Results/ESG\ Disclosure/SLM/aya_35b/prompt-1/bm25 -g ../ESG\ Disclosure\ Dataset/Dataset\ by\ Report
# python scoring.py esg -r ../Experimental\ Results/ESG\ Disclosure/SLM/aya_35b/prompt-2/bm25 -g ../ESG\ Disclosure\ Dataset/Dataset\ by\ Report
# python scoring.py esg -r ../Experimental\ Results/ESG\ Disclosure/SLM/aya_35b/prompt-3/bm25 -g ../ESG\ Disclosure\ Dataset/Dataset\ by\ Report
# python scoring.py esg -r ../Experimental\ Results/ESG\ Disclosure/SLM/aya_35b/prompt-5/bm25 -g ../ESG\ Disclosure\ Dataset/Dataset\ by\ Report


# # dprKGI0
# echo "dprKGI0"
# echo "llama2"
# python scoring.py esg -r ../Experimental\ Results/ESG\ Disclosure/SLM/llama2_latest/prompt-0/dprKGI0 -g ../ESG\ Disclosure\ Dataset/Dataset\ by\ Report
# python scoring.py esg -r ../Experimental\ Results/ESG\ Disclosure/SLM/llama2_latest/prompt-1/dprKGI0 -g ../ESG\ Disclosure\ Dataset/Dataset\ by\ Report
# python scoring.py esg -r ../Experimental\ Results/ESG\ Disclosure/SLM/llama2_latest/prompt-2/dprKGI0 -g ../ESG\ Disclosure\ Dataset/Dataset\ by\ Report
# python scoring.py esg -r ../Experimental\ Results/ESG\ Disclosure/SLM/llama2_latest/prompt-3/dprKGI0 -g ../ESG\ Disclosure\ Dataset/Dataset\ by\ Report

# echo "phi3"
# python scoring.py esg -r ../Experimental\ Results/ESG\ Disclosure/SLM/phi3_latest/prompt-0/dprKGI0 -g ../ESG\ Disclosure\ Dataset/Dataset\ by\ Report
# python scoring.py esg -r ../Experimental\ Results/ESG\ Disclosure/SLM/phi3_latest/prompt-1/dprKGI0 -g ../ESG\ Disclosure\ Dataset/Dataset\ by\ Report
# python scoring.py esg -r ../Experimental\ Results/ESG\ Disclosure/SLM/phi3_latest/prompt-2/dprKGI0 -g ../ESG\ Disclosure\ Dataset/Dataset\ by\ Report
# python scoring.py esg -r ../Experimental\ Results/ESG\ Disclosure/SLM/phi3_latest/prompt-3/dprKGI0 -g ../ESG\ Disclosure\ Dataset/Dataset\ by\ Report

# echo "mistral"
# python scoring.py esg -r ../Experimental\ Results/ESG\ Disclosure/SLM/mistral_latest/prompt-0/dprKGI0 -g ../ESG\ Disclosure\ Dataset/Dataset\ by\ Report
# python scoring.py esg -r ../Experimental\ Results/ESG\ Disclosure/SLM/mistral_latest/prompt-1/dprKGI0 -g ../ESG\ Disclosure\ Dataset/Dataset\ by\ Report
# python scoring.py esg -r ../Experimental\ Results/ESG\ Disclosure/SLM/mistral_latest/prompt-2/dprKGI0 -g ../ESG\ Disclosure\ Dataset/Dataset\ by\ Report
# python scoring.py esg -r ../Experimental\ Results/ESG\ Disclosure/SLM/mistral_latest/prompt-3/dprKGI0 -g ../ESG\ Disclosure\ Dataset/Dataset\ by\ Report

# echo "aya_35b"
# python scoring.py esg -r ../Experimental\ Results/ESG\ Disclosure/SLM/aya_35b/prompt-0/dprKGI0 -g ../ESG\ Disclosure\ Dataset/Dataset\ by\ Report
# python scoring.py esg -r ../Experimental\ Results/ESG\ Disclosure/SLM/aya_35b/prompt-1/dprKGI0 -g ../ESG\ Disclosure\ Dataset/Dataset\ by\ Report
# python scoring.py esg -r ../Experimental\ Results/ESG\ Disclosure/SLM/aya_35b/prompt-2/dprKGI0 -g ../ESG\ Disclosure\ Dataset/Dataset\ by\ Report
# python scoring.py esg -r ../Experimental\ Results/ESG\ Disclosure/SLM/aya_35b/prompt-3/dprKGI0 -g ../ESG\ Disclosure\ Dataset/Dataset\ by\ Report


# # dpr_bm25
# echo "dpr_bm25"
# echo "llama2"
# python scoring.py esg -r ../Experimental\ Results/ESG\ Disclosure/SLM/llama2_latest/prompt-0/dpr_bm25 -g ../ESG\ Disclosure\ Dataset/Dataset\ by\ Report
# python scoring.py esg -r ../Experimental\ Results/ESG\ Disclosure/SLM/llama2_latest/prompt-1/dpr_bm25 -g ../ESG\ Disclosure\ Dataset/Dataset\ by\ Report
# python scoring.py esg -r ../Experimental\ Results/ESG\ Disclosure/SLM/llama2_latest/prompt-2/dpr_bm25 -g ../ESG\ Disclosure\ Dataset/Dataset\ by\ Report
# python scoring.py esg -r ../Experimental\ Results/ESG\ Disclosure/SLM/llama2_latest/prompt-3/dpr_bm25 -g ../ESG\ Disclosure\ Dataset/Dataset\ by\ Report

# echo "phi3"
# python scoring.py esg -r ../Experimental\ Results/ESG\ Disclosure/SLM/phi3_latest/prompt-0/dpr_bm25 -g ../ESG\ Disclosure\ Dataset/Dataset\ by\ Report
# python scoring.py esg -r ../Experimental\ Results/ESG\ Disclosure/SLM/phi3_latest/prompt-1/dpr_bm25 -g ../ESG\ Disclosure\ Dataset/Dataset\ by\ Report
# python scoring.py esg -r ../Experimental\ Results/ESG\ Disclosure/SLM/phi3_latest/prompt-2/dpr_bm25 -g ../ESG\ Disclosure\ Dataset/Dataset\ by\ Report
# python scoring.py esg -r ../Experimental\ Results/ESG\ Disclosure/SLM/phi3_latest/prompt-3/dpr_bm25 -g ../ESG\ Disclosure\ Dataset/Dataset\ by\ Report

# echo "mistral"
# python scoring.py esg -r ../Experimental\ Results/ESG\ Disclosure/SLM/mistral_latest/prompt-0/dpr_bm25 -g ../ESG\ Disclosure\ Dataset/Dataset\ by\ Report
# python scoring.py esg -r ../Experimental\ Results/ESG\ Disclosure/SLM/mistral_latest/prompt-1/dpr_bm25 -g ../ESG\ Disclosure\ Dataset/Dataset\ by\ Report
# python scoring.py esg -r ../Experimental\ Results/ESG\ Disclosure/SLM/mistral_latest/prompt-2/dpr_bm25 -g ../ESG\ Disclosure\ Dataset/Dataset\ by\ Report
# python scoring.py esg -r ../Experimental\ Results/ESG\ Disclosure/SLM/mistral_latest/prompt-3/dpr_bm25 -g ../ESG\ Disclosure\ Dataset/Dataset\ by\ Report

# echo "aya_35b"
# python scoring.py esg -r ../Experimental\ Results/ESG\ Disclosure/SLM/aya_35b/prompt-0/dpr_bm25 -g ../ESG\ Disclosure\ Dataset/Dataset\ by\ Report
# python scoring.py esg -r ../Experimental\ Results/ESG\ Disclosure/SLM/aya_35b/prompt-1/dpr_bm25 -g ../ESG\ Disclosure\ Dataset/Dataset\ by\ Report
# python scoring.py esg -r ../Experimental\ Results/ESG\ Disclosure/SLM/aya_35b/prompt-2/dpr_bm25 -g ../ESG\ Disclosure\ Dataset/Dataset\ by\ Report
# python scoring.py esg -r ../Experimental\ Results/ESG\ Disclosure/SLM/aya_35b/prompt-3/dpr_bm25 -g ../ESG\ Disclosure\ Dataset/Dataset\ by\ Report



# SLM Rerank NQ
# bm25
# echo ""
# echo "bm25"
# echo "llama2"
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/llama2_latest/prompt-0/nq_dev_bm25_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/llama2_latest/prompt-1/nq_dev_bm25_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/llama2_latest/prompt-2/nq_dev_bm25_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/llama2_latest/prompt-3/nq_dev_bm25_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/llama2_latest/prompt-4/nq_dev_bm25_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/llama2_latest/prompt-5/nq_dev_bm25_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl


# echo ""
# echo ""
# echo "-----------mistral-----------"
# echo ""
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/mistral_latest/prompt-0/nq_dev_bm25_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/mistral_latest/prompt-1/nq_dev_bm25_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/mistral_latest/prompt-2/nq_dev_bm25_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/mistral_latest/prompt-3/nq_dev_bm25_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/mistral_latest/prompt-4/nq_dev_bm25_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/mistral_latest/prompt-5/nq_dev_bm25_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl

# echo "phi3"
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/phi3_latest/prompt-0/nq_dev_bm25_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/phi3_latest/prompt-1/nq_dev_bm25_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/phi3_latest/prompt-2/nq_dev_bm25_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/phi3_latest/prompt-3/nq_dev_bm25_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/phi3_latest/prompt-4/nq_dev_bm25_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/phi3_latest/prompt-5/nq_dev_bm25_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl

# echo "aya:35b"
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/aya_35b/prompt-0/nq_dev_bm25_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/aya_35b/prompt-1/nq_dev_bm25_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/aya_35b/prompt-2/nq_dev_bm25_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/aya_35b/prompt-3/nq_dev_bm25_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/aya_35b/prompt-4/nq_dev_bm25_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/aya_35b/prompt-5/nq_dev_bm25_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl

# dpr
# echo ""
# echo "dpr"
# echo "llama2"
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/llama2_latest/prompt-0/nq_dev_dpr_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/llama2_latest/prompt-1/nq_dev_dpr_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/llama2_latest/prompt-2/nq_dev_dpr_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/llama2_latest/prompt-3/nq_dev_dpr_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/llama2_latest/prompt-4/nq_dev_dpr_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/llama2_latest/prompt-5/nq_dev_dpr_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl


# echo ""
# echo ""
# echo "-----------mistral-----------"
# echo ""
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/mistral_latest/prompt-0/nq_dev_dpr_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/mistral_latest/prompt-1/nq_dev_dpr_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/mistral_latest/prompt-2/nq_dev_dpr_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/mistral_latest/prompt-3/nq_dev_dpr_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/mistral_latest/prompt-4/nq_dev_dpr_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/mistral_latest/prompt-5/nq_dev_dpr_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl

# echo "phi3"
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/phi3_latest/prompt-0/nq_dev_dpr_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/phi3_latest/prompt-1/nq_dev_dpr_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/phi3_latest/prompt-2/nq_dev_dpr_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/phi3_latest/prompt-3/nq_dev_dpr_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/phi3_latest/prompt-4/nq_dev_dpr_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/phi3_latest/prompt-5/nq_dev_dpr_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl

# echo "aya:35b"
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/aya_35b/prompt-0/nq_dev_dpr_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/aya_35b/prompt-1/nq_dev_dpr_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/aya_35b/prompt-2/nq_dev_dpr_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/aya_35b/prompt-3/nq_dev_dpr_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/aya_35b/prompt-4/nq_dev_dpr_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/aya_35b/prompt-5/nq_dev_dpr_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl


# echo ""
# echo "dpr_bm25"
# echo "llama2"
# echo ""
# echo ""
# echo "-----------llama2-----------"
# echo ""
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/llama2_latest/prompt-0/nq_dev_dpr_bm25_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/llama2_latest/prompt-1/nq_dev_dpr_bm25_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/llama2_latest/prompt-2/nq_dev_dpr_bm25_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/llama2_latest/prompt-3/nq_dev_dpr_bm25_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/llama2_latest/prompt-4/nq_dev_dpr_bm25_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/llama2_latest/prompt-5/nq_dev_dpr_bm25_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl

# echo ""
# echo ""
# echo "-----------mistral-----------"
# echo ""
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/mistral_latest/prompt-0/nq_dev_dpr_bm25_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/mistral_latest/prompt-1/nq_dev_dpr_bm25_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/mistral_latest/prompt-2/nq_dev_dpr_bm25_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/mistral_latest/prompt-3/nq_dev_dpr_bm25_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/mistral_latest/prompt-4/nq_dev_dpr_bm25_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/mistral_latest/prompt-5/nq_dev_dpr_bm25_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl

# echo ""
# echo ""
# echo "-----------phi3-----------"
# echo ""
python scoring.py nq -r ../Experimental\ Results/NQ/SLM/phi3_latest/prompt-0/nq_dev_dpr_bm25_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
python scoring.py nq -r ../Experimental\ Results/NQ/SLM/phi3_latest/prompt-1/nq_dev_dpr_bm25_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
python scoring.py nq -r ../Experimental\ Results/NQ/SLM/phi3_latest/prompt-2/nq_dev_dpr_bm25_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
python scoring.py nq -r ../Experimental\ Results/NQ/SLM/phi3_latest/prompt-3/nq_dev_dpr_bm25_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
python scoring.py nq -r ../Experimental\ Results/NQ/SLM/phi3_latest/prompt-4/nq_dev_dpr_bm25_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
python scoring.py nq -r ../Experimental\ Results/NQ/SLM/phi3_latest/prompt-5/nq_dev_dpr_bm25_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl


# echo ""
# echo ""
# echo "-----------aya:35b-----------"
# echo ""
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/aya_35b/prompt-0/nq_dev_dpr_bm25_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/aya_35b/prompt-1/nq_dev_dpr_bm25_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/aya_35b/prompt-2/nq_dev_dpr_bm25_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/aya_35b/prompt-3/nq_dev_dpr_bm25_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/aya_35b/prompt-4/nq_dev_dpr_bm25_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/aya_35b/prompt-5/nq_dev_dpr_bm25_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl


# echo ""
# echo "rerank"
# echo "llama2"
# echo ""
# echo ""
# echo "-----------llama2-----------"
# echo ""
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/llama2_latest/prompt-0/nq_dev_rerank_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/llama2_latest/prompt-1/nq_dev_rerank_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/llama2_latest/prompt-2/nq_dev_rerank_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/llama2_latest/prompt-3/nq_dev_rerank_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/llama2_latest/prompt-4/nq_dev_rerank_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/llama2_latest/prompt-5/nq_dev_rerank_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl

# echo ""
# echo ""
# echo "-----------mistral-----------"
# echo ""
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/mistral_latest/prompt-0/nq_dev_rerank_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/mistral_latest/prompt-1/nq_dev_rerank_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/mistral_latest/prompt-2/nq_dev_rerank_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/mistral_latest/prompt-3/nq_dev_rerank_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/mistral_latest/prompt-4/nq_dev_rerank_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/mistral_latest/prompt-5/nq_dev_rerank_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl

# echo ""
# echo ""
# echo "-----------phi3-----------"
# echo ""
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/phi3_latest/prompt-0/nq_dev_rerank_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/phi3_latest/prompt-1/nq_dev_rerank_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/phi3_latest/prompt-2/nq_dev_rerank_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/phi3_latest/prompt-3/nq_dev_rerank_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl

# echo ""
# echo ""
# echo "-----------aya:35b-----------"
# echo ""
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/aya_35b/prompt-0/nq_dev_rerank_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/aya_35b/prompt-1/nq_dev_rerank_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/aya_35b/prompt-2/nq_dev_rerank_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/aya_35b/prompt-3/nq_dev_rerank_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/aya_35b/prompt-4/nq_dev_rerank_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
# python scoring.py nq -r ../Experimental\ Results/NQ/SLM/aya_35b/prompt-5/nq_dev_rerank_rerank.jsonl -g ../../NQ/dev_positive_pids.jsonl
