#!/bin/bash

#SBATCH --partition=benson
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=12
#SBATCH --time=72:00:00
#SBATCH --mem=100GB
#SBATCH --job-name="fastqc"
#SBATCH --error="fastaqc.%J.error"
#SBATCH --output="fastqc.%J.out"

# Module load 

module load fastqc/0.11
########################################################

# First move your fastq files to an untrimmed directory
# Create the directory if that has not been done
# Here I am skipping one step which would be if had downloaded zipped files and still had to unzip them to move all to the respective folder

# Starting from unzipped files, do the following:
# Assuming you are in the correct relative path

mkdir -p /work/benson/netogomes/../untrimmed_reads
mv *.fastq ./untrimmed_reads 
cd untrimmed_reads/
#########################################################

# Run fastqc

fastqc *.fastq
#######################################################

# Unzip output files

for filename in *.zip
do
    unzip $filename
done

####################################################

# Checking summary statistics of fastqc

cat */summary.txt > fastqc_summaries.txt #compiling all summary.txt files into one file
#don't forget to cd into the directory containing the *.txt files

grep FAIL fastqc_summaries.txt # get all files with at least one FAILED job

grep FAIL fastqc_summaries.txt | cut -f 3 | sort | uniq # get the failed jobs sorted by ID and with uniq entries

grep FAIL fastqc_summaries.txt | cut -f 2 | sort | uniq -c # display the counts for each unique type of failure
