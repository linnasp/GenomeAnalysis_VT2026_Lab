#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 00:10:00
#SBATCH -J trim_RNA
#SBATCH --mail-type=ALL
#SBATCH --output=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/01_preprocessing/04_RNA/02_Trimmomatic_RNA/outputfiles/%x.%j.out
#SBATCH --error=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/01_preprocessing/04_RNA/02_Trimmomatic_RNA/errorfiles/%x.%j.err

# Load modules
module load Trimmomatic/0.39-Java-17

trimmomatic PE -threads 2 \
/crex/proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/reads/transcriptomic_data/*.fq.gz \

ouput fastqc

ILLUMINACLIP:$TRIMMOMATIC_HOME/adapters/TruSeq3-PE.fa:2:30:10:2:True LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36 \
