#!/bin/bash
#SBATCH --partition=benson
#SBATCH --time=72:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=12
#SBATCH --mem=100GB
#SBATCH --job-name="sistr"
#SBATCH --error="sistr.%J.error"
#SBATCH --output="sistr.%J.out"

#module load

module load anaconda/4.6  
module load blast/2.7
module load mafft/7.407
module load sistr_cmd/1.0

DATAIN={location of your contigs.fasta}

cd $DATAIN

sistr --qc -vv --alleles-output allele_results.json --novel-alleles novel_alleles.fasta --cgmlst-profiles cgmlst_profiles.csv -f csv -o sistr_output.csv *.fasta
