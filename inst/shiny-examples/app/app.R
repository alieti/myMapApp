#' A Shiny app for myMapp package
#' @title myMapApp
#' @description This app shows some functions of myMap package interactively.
#' @author Mohsen Pirmoradiyan, Ali Etminan
#' 
#' @import shiny
#' 

ui <- fluidPage(
  title = titlePanel("myMapApp"),
  sidebarLayout( 
    sidebarPanel(
      h4("Coordinates"),
      numericInput("left", "Lowerleft longitude", value = 86.05),
      numericInput("bottom", "Lowerleft latitude", value = 27.21),
      numericInput("right", "Upperright longitude", value = 87.81),
      numericInput("top", "Upperright latitude", value = 28.76),
      br(),
      br(),
      
      selectInput("mapType", h4("Map Type"),
                  choices = list("terrain", "terrain-background", "terrain-labels", 
                                 "terrain-lines", "toner", "toner-2010", "toner-2011", 
                                 "toner-background", "toner-hybrid", "toner-labels", 
                                 "toner-lines", "toner-lite", "watercolor"), selected = 1),
      br(),
      br(),
      sliderInput("Zoom", h4("Zoom"), min = 1, max = 15, value = 5, step = 1),
      br(),
      
      submitButton('View')
    ),
    mainPanel(
      plotOutput("showMap")
      
    )
  )
)


server <- function(input, output){output$showMap = renderPlot({
  MapStamen$new(left = input$left, bottom = input$bottom, right = input$right,
                top = input$top, mapType = input$mapType, Zoom = input$Zoom)$
    showMap()
  
  
})
}


shinyApp(ui, server)