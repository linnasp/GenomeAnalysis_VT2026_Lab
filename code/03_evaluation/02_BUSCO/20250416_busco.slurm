#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 01:00:00
#SBATCH -J busco
#SBATCH --mail-type=ALL
#SBATCH --output=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/03_evaluation/02_BUSCO/outputfiles/%x.%j.out
#SBATCH --error=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/03_evaluation/02_BUSCO/errorfiles/%x.%j.err

module load BUSCO/5.8.2-gfbf-2024a

# Input 
FLYE_genome_assembly=
genome=

# Output
out_dir=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/03_evaluation/02_BUSCO

busco \
-i \
-l embryophyta_odb10 \
-c 2 \
-o busco_results \
--out_path $out_dir \
-m genome \
--augustus \