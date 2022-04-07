
#' get_time_human
#'
#' get a formatted string of the timestamp (exclude colons as they are invalid
#  characters in Windows filenames)
#'
#' @return
#' @export
#' @source https://github.com/daattali/shiny-server/tree/master/persistent-data-storage
#'
#' @examples
#' get_time_human()
get_time_human <- function() {
  format(Sys.time(), "%Y%m%d-%H%M%OS")
}