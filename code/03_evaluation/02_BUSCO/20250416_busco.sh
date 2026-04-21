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
module load BLAST+/2.16.0-gompi-2024a
module load HMMER/3.4-gompi-2024a 

# Input 
Pilon_genome_assembly=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/02_assembly/04_Pilon/pilon.fasta

# Output
out_dir=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/03_evaluation/02_BUSCO

export AUGUSTUS_CONFIG_PATH=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/03_evaluation/02_BUSCO/augustus_config_

busco \
-i $Pilon_genome_assembly \
-l embryophyta_odb10 \
-c 2 \
-o busco_7 \
--out_path $out_dir \
-m genome \
--augustus 