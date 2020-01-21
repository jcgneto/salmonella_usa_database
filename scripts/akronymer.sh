#!/bin/bash
#SBATCH --job-name=aKronyMer
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8
#SBATCH --time=05:00:00
#SBATCH --mem=20gb

export OMP_NUM_THREADS=8

# aKronyMer doesn't work with multiline fasta files
# Multiline fasta files can be converted to single line with: awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < input.aln | sed -e "1d" > input.aln
# git clone https://github.com/knights-lab/aKronyMer.git; cd aKronyMer
./bin/akmer94b_linux input.aln output.file
