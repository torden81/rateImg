#' The application server-side
#' 
#' @param input,output,session Internal parameters for {shiny}. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function( input, output, session ) {
  # Your application server logic 
  
  observeEvent(input[["debug"]], browser())

  sessionToken <- reactive(session$token)
  randomImages <- reactiveVal()
  
  wwwPath <- app_sys("app/www")
  imageFiles <- list.files(path=wwwPath, pattern="\\.jpg$", full.names = TRUE)
  
  
  observeEvent(triggerNewImages_rv(),{
    print("Generate new images")
    print(imageFiles)
    imgSample <- sample(imageFiles,5)
    randomImages(imgSample)
  }, ignoreInit = FALSE)
  
  
  triggerNewImages_rv <- reactiveVal(0)
  rating_rv <- reactiveValues()

  
  # Generate images and ratings buttons module ####
  lapply(1:5, function(i){
    mod_singleImg_server(paste0("singleImg_",i), randomImages, rating_rv, triggerNewImages_rv)
  })
  
  output[["allImages"]] <- renderUI({
    do.call(tagList,
      lapply(1:5, function(i){
        mod_singleImg_ui(paste0("singleImg_",i))
      })
    )
  })
  
  
  # Generate accept button and save module ####
  mod_acceptAndSave_server("acceptAndSave_1", rating_rv, triggerNewImages_rv)
  
  output[["sessionID"]] <- renderText(sessionToken())
  output[["xImgFiles"]] <- renderText({
    #paste0(wwwPath,"\\", imageFiles)
    imageFiles
  })
  
  
}
