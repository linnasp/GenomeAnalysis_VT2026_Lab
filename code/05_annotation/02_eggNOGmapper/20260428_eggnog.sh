#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 24:00:00
#SBATCH -J 01_eggNOGG
#SBATCH --mem=32G
#SBATCH --mail-type=ALL
#SBATCH --output=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/05_annotation/02_eggNOGmapper/outputfiles/%x.%j.out
#SBATCH --error=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/05_annotation/02_eggNOGmapper/errorfiles/%x.%j.err

module load eggnog-mapper/2.1.13-gfbf-2024a

# Input 
braker3=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/05_annotation/01_BRAKER3/results_ch3/braker.aa

# Output
out_dir=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/05_annotation/02_eggNOGmapper/results
database=/sw/data/uppnex/eggNOG/5.0/rackham/

mkdir -p $out_dir
cd $out_dir

emapper.py \
    --cpu 2 \
    -i $braker3 \
    --itype proteins \
    --data_dir $database \
    -m diamond \
    -o eggnog \
    --go_evidence experimental \
    --pfam_realign realign \
    --sensmode ultra-sensitive \
    --output_dir $out_dir \
    --override