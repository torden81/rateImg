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
    actionButton(ns("debug"), "DEBUG"),
    
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
 
    observeEvent(input[["debug"]], browser())
    
    
    idNo <- as.numeric(sub(".*_([[:digit::]]*)$", "\\1",id))
    
    
    #imgFile <- imageFile[[as.character(idNo)]]
    
    observeEvent(input[["rateButtons"]],{
      req(imageFile)
      #browser()
      rating_rv[[paste0(idNo)]] <- data.frame(image=imageFile()[idNo], rate=as.numeric(input[["rateButtons"]]))
    }, ignoreInit = TRUE)
    
    #rating_rv[[paste0(idNo)]] <- c(image=imageFile, rate=NA)
    
    observeEvent( triggerNewImages_rv(),
                  {
                    updateRadioButtons(session, "rateButtons", selected=1)
                  }, ignoreInit = TRUE)
    

    output[["myImage"]] <- renderImage({
      req(imageFile)
      print(imageFile()[idNo])
      outfile <- normalizePath(paste0(wwwPath,"/",imageFile()[idNo]))
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
