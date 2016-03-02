# Server.r

# Needed libraries
library(plotly)
library(shiny)

# Source file for function
source('iris_analysis.R')

shinyServer(function(input, output) {
   
   # Create a map via the build_map function
   output$map <- renderPlotly({
      
      build_map(input$type, input$x_compare, input$y_compare)
      })
   
})