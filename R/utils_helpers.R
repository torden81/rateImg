#' helpers 
#'
#' @description A utils function
#'
#' @return The return value, if any, from executing the utility.
#'
#' @noRd



#' get_time_human
#'
#' get a formatted string of the timestamp (exclude colons as they are invalid
#  characters in Windows filenames)
#'
#' @return
#' @export
#'
#' @examples
get_time_human <- function() {
  format(Sys.time(), "%Y%m%d-%H%M%OS")
}