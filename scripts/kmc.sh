#!/bin/bash
#SBATCH --job-name=kmc-matrix
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8  # set this to 1 for create_matrix.py
#SBATCH --time=168:00:00
#SBATCH --mem=200gb

module load kmc/3.1

# Step 1: extract all kmers
<<COMM
while read line
do
# Input files are in /directory/SRR*_contigs.fasta
# Get SRA ID
srr_id=`echo "${line}" | sed 's/\/directory\/\(.*\)_contigs.fasta/\1/g'`
mkdir output_${srr_id}
kmc -k30 -t8 -fa ${line} ${srr_id}.out output_${srr_id}
kmc_dump ${srr_id}.out ${srr_id}_freq.txt.tmp
awk '$2="1"' ${srr_id}_freq.txt.tmp > ${srr_id}_freq.txt
sed -i '1i kmer '"$srr_id"'' ${srr_id}_freq.txt
rm ${srr_id}_freq.txt.tmp
rm -rf ${srr_id}.out*
rm -rf output_${srr_id}
done <list_contigs_path.txt
COMM



# Step 2: create joined kmer matrix
# This is memory intensive step
cat > create_matrix.py <<EOF
#!/usr/bin/env python

import sys
import re
import pandas as pd
import numpy as np
import dask.dataframe as dd

# Input 1 is list of SRA IDs in file srr_ids.txt
# Input 2 is srr_id_freq.txt output from KMC
input_file = open("srr_ids.txt")
lines = input_file.readlines()
input_file = open("srr_ids.txt")
length = len(input_file.readlines())

dfs = []
for i in range(0,length):
    srr_id = lines[i].strip()
    # SRR1002816_freq.txt
    df = dd.read_csv(str(srr_id) + "_freq.txt", sep=" ")
    # dfn = ddf.from_pandas(df3, npartitions=8)
    df[srr_id] = df[srr_id].astype(np.int8)
    df["kmer"] = df["kmer"].astype('category')
    dfs.append(df)

# print("concatenating...")
df_fin = dd.concat(dfs)
# df_fin = dd.from_pandas(df_fin)
df_fin = df_fin.groupby("kmer").sum().replace(0,0).reset_index().compute()

df_fin.to_csv(sys.argv[1], sep='\t', index=False)

input_file.close()

EOF

python create_matrix.py newport_matrix_kmer.csv
