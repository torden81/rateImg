#' acceptAndSave UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList
#' @import digest
mod_acceptAndSave_ui <- function(id){
  ns <- NS(id)
  tagList(
    actionButton(ns("acceptAndSaveButton"), "Accept and save")
  )
}
    
#' acceptAndSave Server Functions
#'
#' @noRd 
mod_acceptAndSave_server <- function(id, rating_rv, triggerNewImages_rv){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
    
    observeEvent(
      input[["acceptAndSaveButton"]],
      {
        req(rating_rv)
        ratings <- do.call(rbind, rvtl(rating_rv))
        date_ <- get_time_human()
        outdata <- data.frame(date=date_, ratings)
        
        id <- paste0(date_, "_", digest(outdata, algo="md5"))
        
        outdata <- data.frame(id=id, outdata)
        
        saveRDS(outdata, file = paste0(id,".rds"))
        triggerNewImages_rv(Sys.time())
      })
    
    
  })
}
    
## To be copied in the UI
# mod_acceptAndSave_ui("acceptAndSave_ui_1")
    
## To be copied in the server
# mod_acceptAndSave_server("acceptAndSave_ui_1")
