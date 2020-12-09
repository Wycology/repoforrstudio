data("iris")
# Drawing regression line on a plot

Reg <-  lm(Sepal.Length ~ Petal.Width, data = iris)
plot(iris$Sepal.Length ~ iris$Petal.Width, 
     col = "purple",
     pch = 23)
abline(Reg, 
       col = "blue", 
       lwd = 2.5, 
       lty = "dotted",
       v = 1.6,
       h = 7.2)

# Adding beautiful violin plots on boxplots in R Studio

library(tidyverse) # Loading the necessary libraries
diamonds_df <- diamonds # Creating a copy of the diamonds data to manipulate

diamonds_df %>% 
        ggplot(aes(x = cut, y = price, color = cut)) +
        geom_boxplot(alpha = 0, width = 0.15) +
        geom_violin(alpha = 0.1) +
        theme(legend.position = "none")

library(shiny)
library(shinythemes)

# Plotting beautiful hexagons
chic <- readr::read_csv("https://raw.githubusercontent.com/Z3tt/R-Tutorials/master/ggplot2/chicago-nmmaps.csv")
tibble::glimpse(chic)
ggplot(chic, aes(temp, o3)) +
        geom_hex(color = "grey") +
        scale_fill_distiller(palette = "RdPu", direction = 1) +
        labs(x = "Temperature (°F)", y = "Ozone Level") +
  theme_classic()
# install.packages("vioplot")
library(vioplot)
library(ggplot2)
library(readxl)
library(tidyverse)

testData1 <- read_xlsx("CommercialToolRentals2016and2017.xlsx")
        
str(testData1)

# Separate the data by weekday

graph0 <- testData1$newrentals[testData1$weekday == 1]
graph1 <- testData1$newrentals[testData1$weekday == 2]
graph2 <- testData1$newrentals[testData1$weekday == 3]
graph3 <- testData1$newrentals[testData1$weekday == 4]
graph4 <- testData1$newrentals[testData1$weekday == 5]
graph5 <- testData1$newrentals[testData1$weekday == 6]
graph6 <- testData1$newrentals[testData1$weekday == 7]

# Separate the data by seasons

graph7 <- testData1$newrentals[testData1$season == 1]
graph8 <- testData1$newrentals[testData1$season == 2]
graph9 <- testData1$newrentals[testData1$season == 3]
graph10 <- testData1$newrentals[testData1$season == 4]

# Basic violin plot by weekday

vioplot(graph0, graph1, graph2, graph3, graph4, graph5, graph6, 
        names = c("1", "2", "3", "4", "5", "6", "7"))

# Violin plot by weekday with color added and graph title

vioplot(graph0, graph1, graph2, graph3, graph4, graph5, graph6, 
        names = c("1", "2", "3", "4", "5", "6", "7"),
col = "purple")
title("Tool Rental by Day of the Week")

# Doing that for the seasons

vioplot(graph7, graph8, graph9, graph10, 
        names = c("1", "2", "3", "4"),
        col = "magenta")
title("Tool Rentals by Season")

# Time to try histograms

qplot(testData1$temp,
      xlab = "Temperature",
      geom = "histogram",
      ylab = "Count")

# Boosting the histogram with color and definition

qplot(testData1$temp,
      xlab = "Temperature",
      geom = "histogram",
      ylab = "Count",
      binwidth = 1,
      fill = I("steel blue"),
      col = I("black"))

# Try a bar plot. I must admit that I rarely draw bar plots

barplot(testData1$newrentals) # This is horrible

barplot(testData1$newrentals, names.arg = testData1$date,
        col = "red", border = NA, 
        main = "Tool Rentals By Date",
        ylab = "Rentals",
        xlab = "Date") # Somehow better

# Same bar plot with added color layer by season

barplot(height = testData1$newrentals, 
        names.arg = testData1$date,
        las = 1,
        col = testData1$season, 
        border = NA, 
        main = "Tool Rentals By Date",
        ylab = "Rentals",
        xlab = "Date") # Super cool
