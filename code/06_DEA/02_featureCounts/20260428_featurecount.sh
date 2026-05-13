#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 00:10:00
#SBATCH -J test_featurecount
#SBATCH --mem=32G
#SBATCH --mail-type=ALL
#SBATCH --output=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/06_DEA/02_featureCounts/outputfiles/%x.%j.out
#SBATCH --error=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/06_DEA/02_featureCounts/errorfiles/%x.%j.err

BAM alignments must also be sorted
GTF format

module load Subread/2.1.1-GCC-13.3.0

# Input 
hisat_dir=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/06_DEA/01_HISAT2/results
braker3= gtf file

# Output
out_dir=/home/linnasp/GenomeAnalysis_VT2026_Lab/results/06_DEA/02_featureCounts/results

featureCounts -T 2 \
    -p \
    -a $braker3 \
    -t exon \
    -g gene_id \
    -o $out_dir/counts.txt \
    $hisat_dir/*_sorted.bam

