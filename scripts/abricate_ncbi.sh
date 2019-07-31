#!/bin/bash

#SBATCH --partition=benson
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=12
#SBATCH --time=72:00:00
#SBATCH --mem=100GB
#SBATCH --job-name="abricate_ncbi"
#SBATCH --error="abricate_ncbi.%J.error"
#SBATCH --output="abricate_ncbi.%J.out"

#module load

module load blast/2.7
module load abricate/0.8 

#enter the directory

DATAIN=/work/benson/netogomes/pop_genomics/salmonella_project_1/data_raw_files/paper_1_analysis/abricate/abricate_ncbi

cd $DATAIN

abricate --db ncbi *.fa --csv
