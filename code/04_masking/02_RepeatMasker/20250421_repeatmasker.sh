#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 10:00:00
#SBATCH -J repeatmasking
#SBATCH --mem=32G
#SBATCH --mail-type=ALL
#SBATCH --output=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/04_masking/02_RepeatMasker/outputfiles/%x.%j.out
#SBATCH --error=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/04_masking/02_RepeatMasker/errorfiles/%x.%j.err

module load RepeatMasker/4.2.1-foss-2024a

Pilon_asembly=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/02_assembly/04_Pilon/pilon.fasta
out_dir=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/04_masking/02_RepeatMasker/01_run
library=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/04_masking/01_RepeatModeler/3_run/N_japonicum_db-families.fa

RepeatMasker \
-dir $out_dir \
-xsmall \
-pa 2 \
-lib $library \
$Pilon_asembly

