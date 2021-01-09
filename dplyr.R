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

# The next one is mutate
# This is a verb which is used to add variables in the dataframe which are 
# usually functions of already existing dataframes. We do this my creating data2

data2 <- data %>% 
  mutate(Freq_10 = Freq * 10) # Creates new variable called Freq_10 which is 
# former Freq in data multiplied by 10.

head(data2) # Freq_10 is added to the data set as the last column.

# Filter verb is the next one to have a close look at

# This is returning observations in the dataset which are meeting specific 
# conditions in one or more columns.
# For example if we need subdata having only female then we filter Sex by the
# word Female.

data_female <- data %>%   # Picks the whole data set
  filter(Sex == 'Female') # Picks rows with Sex as Female

head(data_female) # Returns the filtered data set

# Arrange is the next verb we are having a look at

data <- data.frame(Titanic) # Reloading the data. I noticed the grouped data issue

data <- tibble(data) # Having the data as tibble

data <- data %>% # Picks the data
  arrange(Freq) # Arranges the data in ascending order of Frequency
  
head(data) # Indicates the zeroes
tail(data) # Indicates increasing values down the tail up to max of 670.

# It is also possible to reverse the order to descending by adding desc as follows

data <- data %>% 
  arrange(desc(Freq)) # Including the desc in the arrange verb

head(data) # Now the highest value of 670 comes first and the zeroes are down.

# Cool, so that was a simple one for today, Regards :)