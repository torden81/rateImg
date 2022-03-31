#' scrollIntoView
#' 
#' Wrapper for js function scrollIntoView.
#' Scroll window to the anchor id.
#'
#' @param id the html anchor id
#'
#' @return
#' 
#' @import shinyjs
scrollIntoView <- function(id){
  runjs(paste0('document.getElementById(\"',id,'\").scrollIntoView();'))
}
