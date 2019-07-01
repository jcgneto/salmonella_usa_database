#!/bin/bash

#SBATCH --partition=benson
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=12
#SBATCH --time=72:00:00
#SBATCH --mem=100GB
#SBATCH --job-name="spades"
#SBATCH --error="spades.%J.error"
#SBATCH --output="spades.%J.out"

#module load

module load spades/py36/3.13

#enter the directory

DATAIN=/work/benson/netogomes/pop_genomics/salmonella_project_1/data_raw_files/bovine_salmonella_VDL
DATAOUT=/work/benson/netogomes/pop_genomics/salmonella_project_1/data_raw_files/bovine_salmonella_VDL/assemblies

cd $DATAIN

##Assembly of all genomes simultaneously 

for file1 in *R1*fastq
do 
file2=${file1/R1/R2}
out=${file1%%_R01_001.fastq}_output.fasta
spades.py -t 12 -1 $file1 -2 $file2 --careful --cov-cutoff auto -o $DATAOUT/$out 
done


echo "Job is done!"
