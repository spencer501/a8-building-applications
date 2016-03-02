# ui.R

# Needed libraries
library(shiny)
library(plotly)

# Source file
source('iris_analysis.R')

# Create UI
shinyUI(fluidPage(
   # Title of UI
   titlePanel("Iris Data"),
   
   # Controls
   sidebarLayout(
      sidebarPanel(
         # Select species of flower to plot
         selectInput('type', label = h4("Species of flower:"),
                     choices = species,
                     selected = species[1]),
         
         radioButtons('x_compare', label = h4("X-value to compare:"),
                      choices = measures,
                      selected = measures[1]),
         
         radioButtons('y_compare', label = h4("Y-value to compare:"),
                      choices = measures,
                      selected = measures[2])
      ),
      
      # Plot output
      mainPanel(
         plotlyOutput('map')
      )
   )
))