# inst/scripts/make-data.R
#---------------------------------------------------------------
# Provenance & build notes for CLAMPData resources
#---------------------------------------------------------------
# Resources (v1):
#   1) GSE164416_DP_htseq_counts.txt.gz   (TXT.gz)
#   2) human_gene_v2.5_alz.h5             (HDF5)
#   3) islets_metadata.csv                (CSV)
#
# Output:
#   Files staged under out_dir ready to upload to Zenodo (or Bioc Data Lake).
#---------------------------------------------------------------

if (!requireNamespace("BiocManager", quietly = TRUE)) install.packages("BiocManager")
if (!requireNamespace("BiocFileCache", quietly = TRUE)) BiocManager::install("BiocFileCache")

library(BiocFileCache)
bfc <- BiocFileCache("~/.cache/CLAMPData_build", ask = FALSE)

# Output directory
out_dir <- normalizePath(file.path(tempdir(), "CLAMPData_build_v1"), mustWork = FALSE)
dir.create(out_dir, showWarnings = FALSE, recursive = TRUE)
message("Output directory: ", out_dir)

# 1) HTSeq-counts TXT.gz
counts_url <- "https://zenodo.org/records/17014313/files/GSE164416_DP_htseq_counts.txt.gz?download=1"
counts_path <- bfcrpath(bfc, counts_url)
file.copy(counts_path, file.path(out_dir, "GSE164416_DP_htseq_counts.txt.gz"), overwrite = TRUE)

# 2) HDF5 file
h5_url <- "https://zenodo.org/records/17014313/files/human_gene_v2.5_alz.h5?download=1"
h5_path <- bfcrpath(bfc, h5_url)
file.copy(h5_path, file.path(out_dir, "human_gene_v2.5_alz.h5"), overwrite = TRUE)

# 3) CSV metadata
meta_url <- "https://zenodo.org/records/17014313/files/islets_metadata.csv?download=1"
meta_path <- bfcrpath(bfc, meta_url)
file.copy(meta_path, file.path(out_dir, "islets_metadata.csv"), overwrite = TRUE)