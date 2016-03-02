# Analysis and plot functions for the iris dataset

#needed libraries
library(dplyr)
library(plotly)

# load iris dataset
data <- iris 
   # # clean data
   # rename("Sepal Width" = Sepal.Width,
   #        "Sepal Length" = Sepal.Length,
   #        "Petal Width" = Petal.Width,
   #        "Petal Length" = Petal.Length)
   
# get species
species <- as.vector(unique(data$Species))

# get values
measures <- colnames(data)[1:4]


#Build a map 
build_map <- function(type, x_value, y_value) {

   plot_data <- data %>%
      filter(Species == type) %>% 
      select(eval(parse(text = x_value)), 
             eval(parse(text = y_value)))
   
   plot <- plot_data %>% 
      plot_ly(x = eval(parse(text = x_value)),
              y = eval(parse(text = y_value)),
              mode = 'markers',
              marker = list(size = 12)

      ) %>% 
      layout(title = paste(y_value, "VS", x_value, "for", type),
             xaxis = list(title = x_value),
             yaxis = list(title = y_value))
      
   return(plot)
}













