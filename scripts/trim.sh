#!/bin/bash

#SBATCH --partition=benson
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=12
#SBATCH --time=72:00:00
#SBATCH --mem=100GB
#SBATCH --job-name="trimmomatic"
#SBATCH --error="trimmomatic.%J.error"
#SBATCH --output="trimmomatic.%J.out"

# module load

module load trimmomatic/0.38

# enter the correct directory

cd /work/benson/netogomes/pop_genomics/salmonella_project_1/data_raw_files/bovine_salmonella_VDL/untrimmed_reads/trimming_test

# trim all sequences evenly 

for R1 in *R1*
do
   R2=${R1//R1_001.fastq/R2_001.fastq}
   R1paired=${R1//.fastq/_paired.fastq.gz}
   R1unpaired=${R1//.fastq/_unpaired.fastq.gz}	
   R2paired=${R2//.fastq/_paired.fastq.gz}
   R2unpaired=${R2//.fastq/_unpaired.fastq.gz}	
   trimmomatic PE -threads 12 $R1 $R2 $R1paired $R1unpaired $R2paired $R2unpaired CROP:215 LEADING:10 TRAILING:10 SLIDINGWINDOW:5:20 MINLEN:215
done
