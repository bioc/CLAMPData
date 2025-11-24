#' GSE164416_DP_htseq_counts_txt_gz
#'
#' Retrieves the raw count matrix (path to gzipped file) for the GSE164416 dataset from ExperimentHub.
#'
#' @return A character string representing the local file path to the downloaded resource.
#' @examples
#' \dontrun{
#'   counts_path <- CLAMPData::GSE164416_DP_htseq_counts_txt_gz()
#'   # You can then use read.table or similar to load the data from this path
#' }
#' @export
GSE164416_DP_htseq_counts_txt_gz <- function() {
  ExperimentHub::ExperimentHub()[["EH10279"]]
}


#' human_gene_v2_5_alz_h5
#'
#' Retrieves the H5 file (path) containing gene sets and pathway priors from ExperimentHub.
#'
#' @return A character string representing the local file path to the downloaded resource.
#' @examples
#' \dontrun{
#'   h5_path <- CLAMPData::human_gene_v2_5_alz_h5()
#'   # Use rhdf5::h5read to access the file
#' }
#' @export
human_gene_v2_5_alz_h5 <- function() {
  ExperimentHub::ExperimentHub()[["EH10280"]]
}


#' islets_metadata_csv
#'
#' Retrieves the metadata CSV file (path) for the islets example from ExperimentHub.
#'
#' @return A character string representing the local file path to the downloaded resource.
#' @examples
#' \dontrun{
#'   metadata_path <- CLAMPData::islets_metadata_csv()
#'   # You can then use read.csv to load the data
#' }
#' @export
islets_metadata_csv <- function() {
  ExperimentHub::ExperimentHub()[["EH10281"]]
}