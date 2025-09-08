# inst/scripts/make-metadata.R
# -------------------------------------------------------------------
# Generate and validate inst/extdata/metadata.csv for CLAMPData
# -------------------------------------------------------------------
pkg <- "CLAMPData"
bioc_ver <- "3.22" 
maint <- "Marc Subirana Granés <mb2subi@gmail.com>"

# Base URL for Zenodo files 
location_prefix <- "https://zenodo.org/records/17014313/files/"

meta <- data.frame(
  Title = c(
    "GSE164416_DP_htseq_counts_txt_gz",
    "human_gene_v2_5_alz_h5",
    "islets_metadata_csv"
  ),
  Description = c(
    "HTSeq-counts (gene-level) text file from GSE164416 for CLAMP examples.",
    "HDF5 file used in CLAMP vignettes (human_gene_v2.5_alz.h5).",
    "Sample metadata table for islet RNA-seq example (CLAMP)."
  ),
  BiocVersion = bioc_ver,
  Genome = c(NA, NA, NA),
  SourceType = c("TXT", "HDF5", "CSV"),
  SourceUrl = c(
    paste0(location_prefix, "GSE164416_DP_htseq_counts.txt.gz?download=1"),
    paste0(location_prefix, "human_gene_v2.5_alz.h5?download=1"),
    paste0(location_prefix, "islets_metadata.csv?download=1")
  ),
  SourceVersion = c("v1", "v1", "v1"),
  Species = c("Homo sapiens", "Homo sapiens", "Homo sapiens"),
  TaxonomyId = c("9606", "9606", "9606"),
  Coordinate_1_based = c(NA, NA, NA),
  DataProvider = c("Zenodo", "Zenodo", "Zenodo"),
  Maintainer = maint,
  RDataClass = c("character", "character", "character"),
  DispatchClass = c("FilePath", "FilePath", "FilePath"),
  Location_Prefix = location_prefix,
  RDataPath = c(
    "CLAMPData/GSE164416_DP_htseq_counts.txt.gz",
    "CLAMPData/human_gene_v2.5_alz.h5",
    "CLAMPData/islets_metadata.csv"
  ),
  Tags = c(
    "CLAMP:RNA-seq:HTSeq:counts:example-data",
    "CLAMP:HDF5:example-data",
    "CLAMP:metadata:example-data:RNA-seq"
  ),
  stringsAsFactors = FALSE
)

dir.create("inst/extdata", showWarnings = FALSE, recursive = TRUE)

if (requireNamespace("ExperimentHubData", quietly = TRUE)) {
  ExperimentHubData::makeExperimentHubMetadata(pkgname = pkg, file = meta)
  message("Metadata validated by ExperimentHubData::makeExperimentHubMetadata().")
} else {
  message("ExperimentHubData not installed; skipping validation.")
}

write.csv(meta, file = "inst/extdata/metadata.csv", row.names = FALSE)
message("Wrote inst/extdata/metadata.csv with ", nrow(meta), " rows.")
