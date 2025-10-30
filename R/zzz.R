#' GSE164416_DP_htseq_counts_txt_gz
#'
#' A brief description of this dataset
#'
#' @format ## `GSE164416_DP_htseq_counts_txt_gz()`
#' A data frame with x,xxx rows and xx columns:
#' \describe{
#'   \item{field1}{describe}
#'   \item{field2}{describe}
#'   \item{field3}{describe}
#'   ...
#' }
#' @source <https://zenodo.org/records/17014313/files/GSE164416_DP_htseq_counts.txt.gz?download=1>
#' @examples
#' data(GSE164416_DP_htseq_counts_txt_gz)
#' head(GSE164416_DP_htseq_counts_txt_gz)
"GSE164416_DP_htseq_counts_txt_gz"

#' human_gene_v2_5_alz_h5
#'
#' A brief description of this dataset
#'
#' @format ## `human_gene_v2_5_alz_h5()`
#' A data frame with x,xxx rows and xx columns:
#' \describe{
#'   \item{field1}{describe}
#'   \item{field2}{describe}
#'   \item{field3}{describe}
#'   ...
#' }
#' @source <https://zenodo.org/records/17014313/files/human_gene_v2.5_alz.h5?download=1>
#' @examples
#' data(human_gene_v2_5_alz_h5)
#' head(human_gene_v2_5_alz_h5)
"human_gene_v2_5_alz_h5"

#' islets_metadata_csv
#'
#' A brief description of this dataset
#'
#' @format ## `islets_metadata_csv()`
#' A data frame with x,xxx rows and xx columns:
#' \describe{
#'   \item{field1}{describe}
#'   \item{field2}{describe}
#'   \item{field3}{describe}
#'   ...
#' }
#' @source <https://zenodo.org/records/17014313/files/islets_metadata.csv?download=1>
#' @examples
#' data(islets_metadata_csv)
#' head(islets_metadata_csv)
"islets_metadata_csv"

#' @importFrom utils read.csv
.onLoad <- function(libname, pkgname) {
  fl <- system.file("extdata", "metadata.csv", package = pkgname)
  if (file.exists(fl)) {
    titles <- read.csv(fl, stringsAsFactors = FALSE)$Title
    titles <- titles[!is.na(titles) & nzchar(titles)]
    ExperimentHub::createHubAccessors(pkgname, titles)
  }
}
