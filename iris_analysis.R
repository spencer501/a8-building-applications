# Analysis and plot functions for the iris dataset

#needed libraries
library(dplyr)
library(plotly)

# load iris dataset
data <- iris 
   
# get species
species <- as.vector(unique(data$Species))

# get values
measures <- colnames(data)[1:4]


#Build a map 
build_map <- function(type, x_value, y_value) {
   
   # create data frame with values to plot
   plot_data <- data %>%
      filter(Species == type) %>%
      select_(x_value,
              y_value)
   
   # make a plot
   plot <- plot_data %>% 
      plot_ly(x = eval(parse(text = x_value)),
              y = eval(parse(text = y_value)),
              mode = 'markers',
              marker = list(size = 12)
      ) %>% 
      layout(title = paste(gsub("\\.", " ", y_value), "VS", gsub("\\.", " ", x_value), "for", type),
             xaxis = list(title = gsub("\\.", " ", x_value)),
             yaxis = list(title = gsub("\\.", " ", y_value))
             )
   
   # return the plot   
   return(plot)
}













