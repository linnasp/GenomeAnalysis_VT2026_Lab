#!/bin/bash -l

#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 03:00:00
#SBATCH -J trim_illumina
#SBATCH --mail-type=ALL
#SBATCH --output=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/01_preprocessing/02_Trimmomatic/outputfiles/%x.%j.out
#SBATCH --error=/gorilla/home/linnasp/GenomeAnalysis_VT2026_Lab/results/01_preprocessing/02_Trimmomatic/errorfiles/%x.%j.err

# Load modules
module load Trimmomatic/0.39-Java-17

trimmomatic PE -threads 2 \

# Input files
/crex/proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/reads/genomics_chr3_data/chr3_illumina_R1.fastq.gz \
/crex/proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/reads/genomics_chr3_data/chr3_illumina_R2.fastq.gz \

# Output files
/home/linnasp/GenomeAnalysis_VT2026_Lab/results/01_preprocessing/02_Trimmomatic/output_forward_paired.fq.gz \
/home/linnasp/GenomeAnalysis_VT2026_Lab/results/01_preprocessing/02_Trimmomatic/output_forward_unpaired.fq.gz \
/home/linnasp/GenomeAnalysis_VT2026_Lab/results/01_preprocessing/02_Trimmomatic/output_reverse_paired.fq.gz \
/home/linnasp/GenomeAnalysis_VT2026_Lab/results/01_preprocessing/02_Trimmomatic/output_reverse_unpaired.fq.gz \

# Parameters
ILLUMINACLIP:TruSeq3-PE.fa:2:30:10:2:True LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36 \
