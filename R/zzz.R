.onLoad <- function(libname, pkgname) {
  fl <- system.file("extdata", "metadata.csv", package = pkgname)
  if (file.exists(fl)) {
    titles <- read.csv(fl, stringsAsFactors = FALSE)$Title
    titles <- titles[!is.na(titles) & nzchar(titles)]
    ExperimentHub::createHubAccessors(pkgname, titles)
  }
}
