#' runExample
#'
#' \code{runExample()} Run the shiny app related to myMap package.
#' 
#' 
#'  
#' @description This function runs the shiny myMapApp. The app shows the myMap methods
#'     output interactively.
#' @return Shiny app to run myMap.
#' @import shiny
#' @import myMap
#' @export
#' 
runExample <- function() {
  appDir <- system.file("shiny-examples", "app", package = "myMapApp")
  if (appDir == "") {
    stop("Could not find example directory. Try re-installing `myMapApp`.", call. = FALSE)
  }
  
  runApp(appDir, display.mode = "normal")
}