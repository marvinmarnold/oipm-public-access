################################################################################
################################################################################
## Utilities

load.subdirectory <- function(subdir) {
  file.sources <- list.files(path = paste0(subdir), pattern="*.R$", recursive = TRUE, full.name = TRUE)
  invisible(lapply(file.sources, function(source.file) {
    print(paste("Loading file:", source.file))
    source(source.file)
  }))
}
