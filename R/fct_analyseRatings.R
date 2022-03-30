#' readEvalFiles
#'
#' @return list with the rated images
#' @export
#'
#' @examples
readEvalFiles <- function(){

  evalFilePattern <- "^[[:digit:]]+-[[:digit:]]+_.*\\.rds$"
  
  pathToRDSfiles <- "."#paste0(system.file(package = "evalImg"), "\\..")
  
  filesToLoad <- list.files(path = pathToRDSfiles,pattern=evalFilePattern)
  
  dat <- lapply(filesToLoad, readRDS)
  names(dat) <- tools::file_path_sans_ext(filesToLoad)
  
  out <- do.call(rbind, dat)
  rownames(out) <- seq_along(rownames(out))
  
  return(out)
}
