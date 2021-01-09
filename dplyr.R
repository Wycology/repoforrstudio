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
number_passengers # Returns the total passangers to be 2201.

# This can also be made more readable using the pipe (%>%) operator

number_passengers <- data %>%  # Super clear to read and understand what happens.
  summarise(number_passengers = sum(Freq))

# Working with the group_by verb

number_passengers_class <- data %>% # Picking the data data set
  group_by(Class) %>%  # Grouping the data by titanic ship classes
  summarise(number_passengers = sum(Freq)) # Creating sum of frequency per class 

number_passengers_class # Returning the sum of passengers per class which is 
# the grouping variable.


# Using the select verb to have only relevant variables for my need

data_sex_age_freq <- data %>% # Takes the Titanic data set
  select(Sex, Age, Freq) # Picking the three columns only.




