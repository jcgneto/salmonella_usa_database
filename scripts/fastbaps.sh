#!/bin/bash
#SBATCH --partition=batch
#SBATCH --time=168:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=30GB
#SBATCH --job-name="fastbaps"
#SBATCH --error="fastbaps.%J.error"
#SBATCH --output="fastbaps.%J.out"

module load r-fastbaps/1.0

# change input and output directories

cat > fastbaps.R <<EOF
#Load library
library("fastbaps")

# Set seed to reproduce results
set.seed(1234)

sparse.data <- import_fasta_sparse_nt("core_gene_alignment.fa", prior = "baps")
# levels=1, population=150, cores=1
multi.results <- multi_res_baps(sparse.data, levels = 1, k.init=150, n.cores = 1)

write.csv(multi.results, file = file.path("/work/benson/netogomes/sal_newport_usa_baps_analysis", "fastbaps_partition_baps_prior_l1.csv"), col.names = TRUE, row.names = FALSE, quote = FALSE)
EOF

Rscript fastbaps.R
