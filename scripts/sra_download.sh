#!/bin/bash
#SBATCH --job-name=sra_download
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8
#SBATCH --time=10:00:00
#SBATCH --mem=10gb

export OMP_NUM_THREADS=8
# We use parallel-fastq-dump instead of SRAtoolkit fastq-dump because it is faster and gives less intermittent NCBI errors
module load parallel-fastq-dump/0.6

prefetch SRR9855353 && parallel-fastq-dump --sra-id SRR9855353 --threads 8 --split-files
