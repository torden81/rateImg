#' The application User-Interface
#' 
#' @param request Internal parameter for `{shiny}`. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {

  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic 
    fluidPage(
      
      
      #actionButton("debug", "DEBUG"),
      h1("rateImg", id="title"),
      fluidRow({
        column(
          uiOutput("allImages"),
          width=8
        )
      }),
      fluidRow({
        column(
          mod_acceptAndSave_ui("acceptAndSave_1"),
          width=8,
        )
      }),
      fluidRow({
        column(
          textOutput("sessionID"),
          #textOutput("xImgFiles"),
        width=8)
      })
    )
  )
}

#' Add external Resources to the Application
#' 
#' This function is internally used to add external 
#' resources inside the Shiny application. 
#' 
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @importFrom shinyjs useShinyjs
#' @noRd
golem_add_external_resources <- function(){
  
  add_resource_path(
    'www', app_sys('app/www')
  )
 
  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys('app/www'),
      app_title = 'evalImg'
    ),
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert() 
    useShinyjs(),
  )
}

