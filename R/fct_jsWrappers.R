#' scrollIntoView
#' 
#' Wrapper for js function scrollIntoView.
#' Scroll window to the anchor id.
#'
#' @param id the html anchor id
#'
#' @return
#' @source https://stackoverflow.com/questions/61757698/how-to-go-to-an-html-anchor-programatically-in-shiny
#' @importFrom shinyjs runjs
scrollIntoView <- function(id){
  runjs(paste0('document.getElementById(\"',id,'\").scrollIntoView();'))
}
