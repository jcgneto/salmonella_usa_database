#!/bin/bash

#SBATCH --partition=benson
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=12
#SBATCH --time=72:00:00
#SBATCH --mem=100GB
#SBATCH --job-name="plasmidfinder"
#SBATCH --error="plasmidfinder.%J.error"
#SBATCH --output="plasmidfinder.%J.out"

#module load

module load plasmidfinder/2.0

#enter directory

DATAIN=/work/benson/netogomes/pop_genomics/salmonella_project_1/data_raw_files/paper_1_analysis/plasmidfinder
DATAOUT=/work/benson/netogomes/pop_genomics/salmonella_project_1/data_raw_files/paper_1_analysis/plasmidfinder/output_plasmidfinder

cd $DATAIN

plasmidfinder.py -p $PLASMID_DB -i 00837_11_contigs.fa -o $DATAOUT

