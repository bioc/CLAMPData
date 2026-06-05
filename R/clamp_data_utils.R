# Internal catalog for all CLAMPData resources.
.CLAMP_CATALOG <- list(
    GSE164416_DP_htseq_counts_txt_gz = list(
        name        = "GSE164416_DP_htseq_counts_txt_gz",
        accessor    = "GSE164416_DP_htseq_counts_txt_gz",
        description = "HTSeq-counts (gene-level) text file from GSE164416 for CLAMP examples.",
        type        = "TXT.gz",
        species     = "Homo sapiens",
        eh_id       = "EH10279",
        version     = "v1"
    ),

    human_gene_v2_5_alz_h5 = list(
        name        = "human_gene_v2_5_alz_h5",
        accessor    = "human_gene_v2_5_alz_h5",
        description = "HDF5 file used in CLAMP vignettes (human_gene_v2.5_alz.h5).",
        type        = "HDF5",
        species     = "Homo sapiens",
        eh_id       = "EH10280",
        version     = "v1"
    ),

    islets_metadata_csv = list(
        name        = "islets_metadata_csv",
        accessor    = "islets_metadata_csv",
        description = "Sample metadata table for islet RNA-seq example (CLAMP).",
        type        = "CSV",
        species     = "Homo sapiens",
        eh_id       = "EH10281",
        version     = "v1"
    )
)


#' List available CLAMPData datasets
#'
#' Returns a data frame of all datasets in the package, one row per
#' resource.
#'
#' @return A \code{data.frame} with columns \code{name}, \code{accessor},
#'   \code{description}, \code{type}, \code{species}, \code{eh_id}, and
#'   \code{version}.
#'
#' @examples
#' datasets <- list_clamp_data()
#' datasets[, c("name", "type", "eh_id")]
#'
#' @export
list_clamp_data <- function() {
    rows <- lapply(.CLAMP_CATALOG, function(entry) {
        data.frame(
            name        = entry$name,
            accessor    = entry$accessor,
            description = entry$description,
            type        = entry$type,
            species     = entry$species,
            eh_id       = entry$eh_id,
            version     = entry$version,
            stringsAsFactors = FALSE
        )
    })
    do.call(rbind, c(rows, make.row.names = FALSE))
}
