###############################
# Wyclife Agumba Oluoch       #
# wyclifeoluoch@gmail.com     #
# https://github.com/Wycology #
# Task: Playing with some data#
# Created: 30th Nov 2020      #
# Edited: 19th Jan 2021       #
###############################

# Loading the necessary libraries 

library(vioplot)
library(ggplot2)
library(readxl)
library(tidyverse)

# abline in R ----
# Checking all the available data in base R, of course iris is one of them

data() # To view a list of available datasets in the base R.

# Loading the iris data which comes with the base R.

data("iris") # This is one of the datasets which is available and ready for use.

# Let me start by running regression line on the data

Reg <-  lm(Sepal.Length ~ Petal.Width, data = iris) # simple linear regression.

summary(Reg) # Looking at the regression results.
coeff <- coefficients(Reg)
Eq <- paste0('y = ', round(coeff[2], 2), '*x + ', round(coeff[1], 2)) 
# For every increase in width of petals, there is a significant increase in
# sepal length.

plot(iris$Sepal.Length ~ iris$Petal.Width, # Simple plotting procedure
     col = "yellow", # Adding my favorite color to the plot
     pch = 23,
     bg = 'purple',
     bty = 'n',
     main = paste0('Simple plot \n \n', Eq),
     xlab = 'Petal width (cm)',
     xlim = range(0:2.5)
     )# Selecting my desired point character for plotting.
abline(Reg, col = "red", lty = 3, lwd = 3)
text(0.5, 7, "Wondering how this kind of plot looks")

# Some relationship can be seen between the two variables on the plot

abline(Reg, # Passing regression line as the best line of fit.
       col = "blue", # Assigning blue color to the abline.
       lwd = 4, # Increasing line width to my taste.
       lty = "dotted", # Could also set it as 'dashed'. default is solid line
       v = 1.6, # Drawing vertical abline at x = 1.6
       h = 7.2) # Adding another horizontal line at y = 7.2, just for fun.

# I think the plot is fine depending on the need.

# Boxplots in R ----
# Adding beautiful violin plots on boxplots in R Studio

diamonds_df <- diamonds # Creating a copy of the diamonds data to manipulate

diamonds_df %>%
  ggplot(aes(x = cut, y = price, color = cut)) + # Adding the aesthetics
  geom_jitter(alpha = 0.2) +                     # Showing points as jitter
  geom_boxplot(alpha = 0, width = 0.15) +        # Adding boxplots
  geom_violin(alpha = 0.1) +                     # Adds the violin plots
  theme(legend.position = "none")                # Does away with legend

# From online to geom_hex plots ----
# Plotting beautiful hexagons
# Reading data from url
chic <- readr::read_csv("https://raw.githubusercontent.com/Z3tt/R-Tutorials/master/ggplot2/chicago-nmmaps.csv")

tibble::glimpse(chic) # Quick look at the data we got from the website

ggplot(data = chic, aes(x = temp, y = o3)) +
  geom_hex(color = "grey") +
  scale_fill_distiller(palette = "RdPu", direction = 1) +
  labs(title = 'My Honeycomb Plot, kind of :)',
       subtitle = 'I think it is such a cool plot',
       caption = 'Data source: Somewhere',
       x = "Temperature (°F)",
       y = "Ozone Level (I don't know the units)") +
  theme_classic()

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
        col = "purple")
title("Tool Rentals by Season")

# Time to try histograms too

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

# Doing the same with density plot

qplot(testData1$temp,
      xlab = "Temperature",
      geom = "density",
      ylab = "Count",
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

# Practicing with tapply function
# Let me create a dataframe

tea_yield <- data.frame(Yield = c(20, 27, 25, 21, 25, 28, 29, 35, 36, 33),
                        Temp = c(12.5, 15, 11, 12, 16, 18, 17, 16, 19, 20),
                        Site = c('Timbilil', 'Timbilil', 'Timbilil', 'Timbilil',
                                 'Timbilil', 'Sotik', 'Sotik', 'Sotik', 'Sotik', 
                                 'Sotik'))

tapply(tea_yield$Yield, tea_yield$Site, mean, simplify = TRUE) # Applies a 
# function with respect to a factor.

# Can do the same for Temp

tapply(tea_yield$Temp, tea_yield$Site, mean, simplify = TRUE)

apply(tea_yield[,1:2], 2, FUN = mean) # Finds means of columns in a dataframe

# An interesting one is a stem plot

stemdata <-  tea_yield %>% 
  filter(Site == "Sotik") %>% 
  select(Temp)

str(stemdata)

stem(iris$Sepal.Width, scale = 5)
