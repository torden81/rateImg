#' The application server-side
#' 
#' @param input,output,session Internal parameters for {shiny}. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function( input, output, session ) {
  # Your application server logic 
  
  observeEvent(input[["debug"]], browser())
  
  wwwPath <- app_sys("app/www")
  imageFiles <- list.files(path=wwwPath, pattern="\\.jpg$")
  
  randomImages <- reactiveVal(imageFiles[sample(length(imageFiles),5)])
  image_i <- reactiveVal(1)
  
  user_i <- reactiveVal(1)
  
  sessionToken <- reactive(session$token)
  
  
  
  output[["myImages"]] <- renderPrint(randomImages())
  
  
  
  
  output[["myImage"]] <- renderImage({
    outfile <- normalizePath(paste0(wwwPath,"/",randomImages()[image_i()]))
    list(src = outfile,
         alt = "This is alternate text")
    },
    deleteFile=F)
  
  output[["upperPanel"]] <- renderUI(
    tagList(
      verbatimTextOutput("myImages"),
      imageOutput("myImage")
    )
  )
  
  output[["lowerPanel"]] <- renderUI(
    tagList(
      radioButtons("radioBtns", "evaluate image", choices=1:5, selected = 3, inline=TRUE),
      actionButton("nextBtn", "Next")
    )
  )
  
  observeEvent(input[["nextBtn"]],{
               if ( image_i() < length(randomImages()))
                 image_i(image_i()+1)
               else{
                 image_i(1)
                 randomImages(imageFiles[sample(length(imageFiles),5)])
                 user_i(user_i()+1)
               }
               
               updateRadioButtons(session, "radioBtns", "evaluate image", choices=1:5, selected = 3, inline=TRUE)
               }
               )
  
  
  
  

  output[["sessionID"]] <- renderText(sessionToken())
  output[["sessionID_user"]] <- renderText(paste0(sessionToken(),"_",user_i()))
  
  
  
}
