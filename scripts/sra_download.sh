#!/bin/bash
#SBATCH --job-name=sra_download
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8
#SBATCH --time=10:00:00
#SBATCH --mem=10gb

export OMP_NUM_THREADS=8
# We use parallel-fastq-dump instead of SRAtoolkit fastq-dump because it is faster and gives less intermittent NCBI errors
module load parallel-fastq-dump/0.6

export PERL5LIB=/util/opt/anaconda/deployed-conda-envs//packages/parallel-fastq-dump/envs/parallel-fastq-dump-0.6.5/lib/site_perl/5.26.2/:/util/opt/anaconda/deployed-conda-envs/packages/parallel-fastq-dump/envs/parallel-fastq-dump-0.6.5/lib/5.26.2/:/util/opt/anaconda/deployed-conda-envs/packages/parallel-fastq-dump/envs/parallel-fastq-dump-0.6.5/lib/site_perl/5.26.2/x86_64-linux-thread-multi/:$PERL5LIB

while read line
do
prefetch ${line} && parallel-fastq-dump --sra-id ${line} --threads 8 --split-3
rm -rf ${line}
done <input_sra_list.txt
