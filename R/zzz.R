#' GSE164416_DP_htseq_counts_txt_gz
#'
#' Retrieves the raw count matrix (path to gzipped file) for the GSE164416
#' dataset from ExperimentHub.
#'
#' @return A character string representing the local file path to the
#'   downloaded resource.
#'
#' @examples
#' if (interactive()) {
#'     counts_path <- GSE164416_DP_htseq_counts_txt_gz()
#'     print(counts_path)
#' }
#'
#' @export
#' @importFrom ExperimentHub ExperimentHub
GSE164416_DP_htseq_counts_txt_gz <- function() {
    ExperimentHub::ExperimentHub()[["EH10279"]]
}


#' human_gene_v2_5_alz_h5
#'
#' Retrieves the H5 file (path) containing gene sets and pathway priors
#' from ExperimentHub.
#'
#' @return A character string representing the local file path to the
#'   downloaded resource.
#'
#' @examples
#' if (interactive()) {
#'     h5_path <- human_gene_v2_5_alz_h5()
#'     print(h5_path)
#' }
#'
#' @export
#' @importFrom ExperimentHub ExperimentHub
human_gene_v2_5_alz_h5 <- function() {
    ExperimentHub::ExperimentHub()[["EH10280"]]
}


#' islets_metadata_csv
#'
#' Retrieves the metadata CSV file (path) for the islets example
#' from ExperimentHub.
#'
#' @return A character string representing the local file path to the
#'   downloaded resource.
#'
#' @examples
#' if (interactive()) {
#'     metadata_path <- islets_metadata_csv()
#'     print(metadata_path)
#' }
#'
#' @export
#' @importFrom ExperimentHub ExperimentHub
islets_metadata_csv <- function() {
    ExperimentHub::ExperimentHub()[["EH10281"]]
}