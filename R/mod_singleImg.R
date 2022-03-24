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
 
    imageOutput(ns("myImage"), height="auto"), 
    radioButtons(ns("rateButtons"), label="Rate the image", choices=1:5, inline=TRUE),
    tags$hr()
  )
}
    
#' singleImg Server Functions
#'
#' @noRd 
mod_singleImg_server <- function(id, imageFile, rating_rv, triggerNewImages_rv){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
    
    idNo <- reactive({
      sub(".*_([[:digit::]]+)$", "\\1",id)
    })
    
    
    observeEvent(input[["rateButtons"]],{
      #browser()
      rating_rv[[paste0(idNo())]] <- data.frame(image=imageFile, rate=as.numeric(input[["rateButtons"]]))
    })
    
    #rating_rv[[paste0(idNo)]] <- c(image=imageFile, rate=NA)
    
    observeEvent( triggerNewImages_rv,
                  {
                    updateRadioButtons(session, "rateButtons", selected=1)
                  }, ignoreInit = TRUE)
    

    output[["myImage"]] <- renderImage({
      print(imageFile)
      outfile <- normalizePath(paste0(wwwPath,"/",imageFile))
      list(src = outfile,
           alt = "This is alternate text")
    },
    deleteFile=F)
  
    
    
  })
}
    
## To be copied in the UI
# mod_singleImg_ui("singleImg_ui_1")
    
## To be copied in the server
# mod_singleImg_server("singleImg_ui_1")
