#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 03:00:00
#SBATCH -J bwa_samtools
#SBATCH --mail-type=ALL
#SBATCH --output=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/02_assembly/02_BWA_03_SAMtools/outputfiles/%x.%j.out
#SBATCH --error=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/02_assembly/02_BWA_03_SAMtools/errorfiles/%x.%j.err

module load BWA/0.7.19-GCCcore-13.3.0
module load bwa-mem2/2.3-GCC-13.3.0
module load SAMtools/1.22.1-GCC-13.3.0

# Input files
ref_genome=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/02_assembly/01_Flye/assembly.fasta
read1=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/01_preprocessing/02_Trimmomatic/output_forward_paired.fq.gz
read2=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/01_preprocessing/02_Trimmomatic/output_reverse_paired.fq.gz

# Output 
out_dir=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/02_assembly/02_BWA_03_SAMtools

bwa-mem2 index $ref_genome 
bwa-mem2 mem -t 2 $ref_genome $read1 $read2 | \
samtools sort -o $out_dir/mapped_reads_sorted.bam 
samtools index $out_dir/mapped_reads_sorted.bam