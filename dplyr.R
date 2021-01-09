#########################################
# Name: Wyclife Agumba Oluoch           #   
# E-mail: wyclifeoluoch@gmail.com       #
# GitHub: https://github.com/Wycology   #
# Task: Some data wrangling with dplyr  #
# Date: 9th Jan 2020                    #
# Last edited: 9th Jan 2020             #
#########################################

library(dplyr) # The great package for data wrangling

# I will use the Titanic data

data <- data.frame(Titanic) # Loading the Titanic data as data.frame

data <- tibble(data) # Here is the tibble form of the data.

dim(data) # Checking the dimension of the data set.

# Checking the total number of passangers in the Titanic
# To do this, we need the sum of the frequency variable

number_passengers <- summarise(data, number_passengers = sum(Freq))
number_passengers












