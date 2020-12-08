data("iris")
# Drawing regression line on a plot

Reg <-  lm(Sepal.Length ~ Petal.Width, data = iris)
plot(iris$Sepal.Length ~ iris$Petal.Width, 
     col = "purple",
     pch = 16)
abline(Reg, 
       col = "blue", 
       lwd = 3, 
       lty = "dashed",
       v = 1.6,
       h = 7.3)

# Adding beautiful violin plots on boxplots in R Studio

library(tidyverse) # Loading the necessary libraries
diamonds_df <- diamonds # Creating a copy of the diamonds data to manipulate

diamonds_df %>% 
        ggplot(aes(x = cut, y = price, color = cut)) +
        geom_boxplot(alpha = 0, width = 0.15) +
        geom_violin(alpha = 0) +
        theme(legend.position = "none")
library(shiny)
library(shinythemes)

# Plotting beautiful hexagons
chic <- readr::read_csv("https://raw.githubusercontent.com/Z3tt/R-Tutorials/master/ggplot2/chicago-nmmaps.csv")
tibble::glimpse(chic)
ggplot(chic, aes(temp, o3)) +
        geom_hex(color = "grey") +
        scale_fill_distiller(palette = "RdPu", direction = 1) +
        labs(x = "Temperature (°F)", y = "Ozone Level")
