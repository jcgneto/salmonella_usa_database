1. DOWNLOAD DATA
- we are given `External Id: PNUSAS038321:wgs` is an input.
- this can not be directly used to download the SRR run.
- therefore, first we need to find all runs for the given ids with:

# WORKING
# find SRR ids
module load entrez-direct
while read line
do
research -db sra -query "$line" < /dev/null | efetch -format docsum | xtract -pattern DocumentSummary -element Run@acc >> typhimurium_sra_ids.txt
done < typhimurium_ids.txt
# download .sra files in /work/deogun/npavlovikj/ncbi/public/sra
module load SRAtoolkit/2.9
while read line
do
prefetch -v $line
done < typhimurium_sra_ids.txt
# convert .sra to .fastq files


