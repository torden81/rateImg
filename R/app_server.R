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
  
  randomImages <- reactiveVal(imageFiles[sample(length(imageFiles),5)])
  triggerNewImages_rv <- reactiveVal(0)
  
  image_i <- reactiveVal(1)
  user_i <- reactiveVal(1)

  rating_rv <- reactiveValues()

  # Generate images and ratings buttons module ####
  lapply(1:5, function(i){
    mod_singleImg_server(paste0("singleImg_",i), randomImages()[i], rating_rv, triggerNewImages_rv)
  })
  #mod_singleImg_server("singleImg_1", randomImages()[1])
  
  
  output[["allImages"]] <- renderUI({
    do.call(tagList,
      lapply(1:5, function(i){
        mod_singleImg_ui(paste0("singleImg_",i))
      })
    )
  })
  
  
  # Generate accept button and save module ####
  mod_acceptAndSave_server("acceptAndSave_1", rating_rv, triggerNewImages_rv)
  
  observeEvent(triggerNewImages_rv(),{
    print("Generate new images")
    browser()
    randomImages( imageFiles[sample(length(imageFiles),5)] )
    
  }, ignoreInit = TRUE)
  
  
  # output[["upperPanel"]] <- renderUI(
  #   tagList(
  #     verbatimTextOutput("myImages"),
  #     imageOutput("myImage")
  #   )
  # )
  
  # output[["lowerPanel"]] <- renderUI(
  #   tagList(
  #     radioButtons("radioBtns", "evaluate image", choices=1:5, selected = 3, inline=TRUE),
  #     actionButton("nextBtn", "Next")
  #   )
  # )
  
  # observeEvent(input[["nextBtn"]],{
  #              if ( image_i() < length(randomImages()))
  #                image_i(image_i()+1)
  #              else{
  #                image_i(1)
  #                randomImages(imageFiles[sample(length(imageFiles),5)])
  #                user_i(user_i()+1)
  #              }
  #              
  #              updateRadioButtons(session, "radioBtns", "evaluate image", choices=1:5, selected = 3, inline=TRUE)
  #              }
  #              )
  
  
  
  

  output[["sessionID"]] <- renderText(sessionToken())
  output[["sessionID_user"]] <- renderText(paste0(sessionToken(),"_",user_i()))
  
  
  
}
