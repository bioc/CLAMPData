# CLAMPData 0.99.6

## Documentation
- Completed NEWS entries for earlier submission versions ahead of the
  Bioconductor 3.24 release.

# CLAMPData 0.99.5

## New features
- Added reader functions that load the hosted data:
  `read_clamp_alz_expression()`, `read_islet_counts()` and
  `read_islet_metadata()`, plus `list_clamp_data()` to list the available
  datasets.
- Added `validate_clamp_h5()` and `clamp_h5_schema()` to check HDF5 files
  against the expected CLAMP layout.

## Documentation
- Updated the vignette to demonstrate the new reader functions.

# CLAMPData 0.99.4

## Bug fixes
- Addressed BiocCheck findings: raised the R requirement to R (>= 4.6.0) and
  tidied DESCRIPTION fields.

# CLAMPData 0.99.3

## Improvements
- Connected the accessor functions to the published ExperimentHub resources
  and updated `inst/extdata/metadata.csv`.
- Updated the vignette and README for ExperimentHub data loading.

# CLAMPData 0.99.2

## Documentation
- Made the accessor function examples runnable.

# CLAMPData 0.99.1

## New features
- Added ExperimentHub accessor functions
  `GSE164416_DP_htseq_counts_txt_gz()`, `human_gene_v2_5_alz_h5()` and
  `islets_metadata_csv()`.

## Other changes
- Added MIT license files and updated the vignette.

# CLAMPData 0.99.0

## New features
- Initial Bioconductor submission.
- Added whole-blood and islet reference datasets.
