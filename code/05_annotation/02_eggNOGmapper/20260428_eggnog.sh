#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 00:10:00
#SBATCH -J test_eggNOGG
#SBATCH --mem=32G
#SBATCH --mail-type=ALL
#SBATCH --output=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/05_annotation/02_eggNOGmapper/outputfiles/%x.%j.out
#SBATCH --error=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/05_annotation/02_eggNOGmapper/errorfiles/%x.%j.err

go terms
module load eggnog-mapper/2.1.13-gfbf-2024a

# Input 
braker3= .aa

# Output
out_dir=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/05_annotation/02_eggNOGmapper/results

emapper.py \
    --cpu 2 \
    -i $braker3 (FASTA file) \
    --itype proteins \
    --data_dir /sw/data/eggNOG/5.0.0/rackham \
    -m hmm \
    -o eggnog \
    --go_evidence all \
    --pfam_realign realign 