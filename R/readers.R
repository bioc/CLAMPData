#' Expected HDF5 schema for CLAMP expression files
#'
#' Returns a data frame of the paths, types, and purpose of each dataset
#' required in a CLAMP HDF5 expression file.
#'
#' @return A data frame with columns \code{path}, \code{type}, and
#'   \code{description}.
#'
#' @examples
#' clamp_h5_schema()
#'
#' @export
clamp_h5_schema <- function() {
    data.frame(
        path = c(
            "/data/expression",
            "/meta/genes/symbol",
            "/meta/samples/geo_accession"
        ),
        type = c(
            "matrix (samples x genes)",
            "character",
            "character"
        ),
        description = c(
            "Expression matrix; transposed to genes x samples at load",
            "Gene symbols, length = n_genes",
            "Sample identifiers, length = n_samples"
        ),
        stringsAsFactors = FALSE
    )
}


#' Validate a CLAMP HDF5 file
#'
#' Checks that an HDF5 file contains the datasets CLAMP expects (see
#' \code{\link{clamp_h5_schema}}).
#'
#' @param path Path to an HDF5 file.
#'
#' @return \code{TRUE} invisibly if the file is valid; otherwise stops with
#'   a message listing the missing datasets.
#'
#' @examples
#' if (interactive()) {
#'     validate_clamp_h5(human_gene_v2_5_alz_h5())
#' }
#'
#' @export
validate_clamp_h5 <- function(path) {
    if (!requireNamespace("rhdf5", quietly = TRUE)) {
        stop("Package 'rhdf5' is required to read CLAMP HDF5 files. ",
             "Install it with BiocManager::install('rhdf5').", call. = FALSE)
    }
    contents <- rhdf5::h5ls(path)
    found <- paste(contents$group, contents$name, sep = "/")
    required <- c("/data/expression", "/meta/genes/symbol",
                  "/meta/samples/geo_accession")
    missing <- setdiff(required, found)
    if (length(missing)) {
        stop("HDF5 file is missing required datasets: ",
             paste(missing, collapse = ", "), call. = FALSE)
    }
    invisible(TRUE)
}


#' Load islet count table
#'
#' Downloads the GSE164416 HTSeq count file via ExperimentHub and reads it
#' as a data frame
#'
#' @return A data frame with an \code{ensembl} gene-ID column and one count
#'   column per sample.
#'
#' @examples
#' if (interactive()) {
#'     counts <- read_islet_counts()
#'     dim(counts)
#' }
#'
#' @importFrom utils read.table
#' @export
read_islet_counts <- function() {
    path <- GSE164416_DP_htseq_counts_txt_gz()
    read.table(gzfile(path), header = TRUE, stringsAsFactors = FALSE)
}


#' Load islet sample metadata
#'
#' Downloads the islet sample metadata CSV via ExperimentHub and reads it as
#' a data frame
#'
#' @return A data frame with one row per sample.
#'
#' @examples
#' if (interactive()) {
#'     meta <- read_islet_metadata()
#'     head(meta)
#' }
#'
#' @importFrom utils read.csv
#' @export
read_islet_metadata <- function() {
    path <- islets_metadata_csv()
    read.csv(path, header = TRUE)
}


#' Load the Alzheimer expression matrix
#'
#' Downloads the Alzheimer HDF5 file via ExperimentHub, validates it against
#' \code{\link{clamp_h5_schema}}, and returns the expression matrix oriented
#' as genes x samples with gene symbols and sample identifiers as row and 
#' column names
#'
#' @return A numeric matrix with gene symbols as row names and sample
#'   identifiers as column names.
#'
#' @examples
#' if (interactive()) {
#'     expr <- read_clamp_alz_expression()
#'     dim(expr)
#' }
#'
#' @export
read_clamp_alz_expression <- function() {
    path <- human_gene_v2_5_alz_h5()
    validate_clamp_h5(path)
    expr <- t(rhdf5::h5read(path, "data/expression"))
    rownames(expr) <- rhdf5::h5read(path, "meta/genes/symbol")
    colnames(expr) <- rhdf5::h5read(path, "meta/samples/geo_accession")
    expr
}
