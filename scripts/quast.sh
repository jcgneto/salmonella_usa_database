#!/bin/bash

#SBATCH --partition=benson
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=12
#SBATCH --time=72:00:00
#SBATCH --mem=100GB
#SBATCH --job-name="quast"
#SBATCH --error="quast.%J.error"
#SBATCH --output="quast.%J.out"

#module load

module load python/3.7
module load quast/5.0 

#enter the directory

DATAIN=/work/benson/netogomes/pop_genomics/salmonella_project_1/data_raw_files/test_pipeline_all_genomes/trimmed_reads/trimmed_fastq_raw_reads/scaffolds_all_genomes
DATAOUT=/work/benson/netogomes/pop_genomics/salmonella_project_1/data_raw_files/test_pipeline_all_genomes/trimmed_reads/trimmed_fastq_raw_reads/scaffolds_all_genomes/quast_output

cd $DATAIN

quast.py *.fasta -o $DATAOUT

