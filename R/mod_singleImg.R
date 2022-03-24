#' singleImg UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_singleImg_ui <- function(id){
  ns <- NS(id)
  tagList(
 
    
    radioButtons(ns("rateButtons"), label="Rate the image", choices=1:5, inline=TRUE)
  )
}
    
#' singleImg Server Functions
#'
#' @noRd 
mod_singleImg_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 

    
    
    
  })
}
    
## To be copied in the UI
# mod_singleImg_ui("singleImg_ui_1")
    
## To be copied in the server
# mod_singleImg_server("singleImg_ui_1")
