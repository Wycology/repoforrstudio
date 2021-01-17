#########################################
# Name: Wyclife Agumba Oluoch           #   
# E-mail: wyclifeoluoch@gmail.com       #
# GitHub: https://github.com/Wycology   #
# Task: Some data wrangling with dplyr  #
# Date: 9th Jan 2020                    #
# Last edited: 17th Jan 2020             #
#########################################

library(dplyr) # For data wrangling in the code


# I will use the Titanic data for today's exploration

data <- data.frame(Titanic) # Loading the Titanic data as a dataframe object

# Once it is a dataframe, I can set is as a tibble which is my preferred structure
data <- tibble(data) # Here is the tibble form of the data.

dim(data) # Checking the dimension of the data set.

# Checking the total number of passangers in the Titanic
# To do this, I need the sum of the frequency variable

head(data) # To appreciate the variables within the tibble to wrangle

number_passengers <- summarise(data, number_passengers = sum(Freq))
number_passengers # Returns the total passangers to be 2201.

# This can also be made more readable using the pipe (%>%) operator

number_passengers <- data %>%  # Super clear to read and understand what happens.
  summarise(number_passengers = sum(Freq))

# Working with the group_by verb to further get summary of the data

number_passengers_survived <- data %>% # Picking the data data set
  group_by(Survived) %>%  # Grouping the data by titanic ship Survived variable
  summarise(Survival = sum(Freq)) # Creating sum of based on whether 
# they survived or not.

number_passengers_survived # Returning the sum of passengers by survival which is 
# the grouping variable.


# Using the select verb to have only relevant variables for my need

data_sex_age_freq <- data %>% # Takes the Titanic data set
  select(Sex, Age, Freq) # Picking the three columns of my interest only.

# The next one is mutate
# This is a verb which is used to add variables to the dataframe which are 
# usually functions of already existing dataframes. I do this my creating data2.
# This is what I applied on my research to get tree heights from inclinometer
# values.

data2 <- data %>% 
  mutate(Freq_10 = Freq * 10) # Creates new variable called Freq_10 which is 
# former Freq in data multiplied by 10.

head(data2) # Freq_10 is added to the data set as the last column.

# If I want the just created column to fit as first in the dataframe, then I can
# add the .after or .before argument in the mutate function:

data2 <- data %>% 
  mutate(Freq_10 = Freq * 10, .after = 1) # Makes it the second

head(data2)

data2 <- data %>% 
  mutate(Freq_10 = Freq * 10, .before = 1) # Makes it the first

head(data2)


data2 <- data %>% 
  mutate(Freq_10 = Freq * 10, .after = Age) # Puts it after Age variable within
# the dataframe.
head(data2)

# Without mutation, columns can be rearranged using relocate().
head(data2)

data2 <- data2 %>% 
  relocate(Age, .before = Sex) # Cool, that worked fine. 

head(data2)

# Returning back Age to its original place

data2 <- data2 %>% 
  relocate(Age, .after = Sex)

head(data2)

# Filter verb is the next one to have a close look at.

# This is returning observations in the dataset which are meeting specific 
# conditions in one or more columns.
# For example if we need sub-data having only female then we filter Sex by the
# word Female.

data_female <- data %>%   # Picks the whole data set
  filter(Sex == 'Female') # Picks rows with Sex as Female

head(data_female) # Returns the filtered data set 

# In case I need only adult females who survived in 1st class:

data %>% 
  filter(Age == 'Child' & Sex == 'Female' & Survived == 'Yes' & Class == '1st')

data %>% 
  filter(Age == 'Child' & Sex == 'Male' & Survived == 'Yes' & Class == '1st')

# Arrange is the next verb we are having a close look at

data <- data.frame(Titanic) # Reloading the data. I noticed the grouped data issue

data <- tibble(data) # Having the data as tibble

data <- data %>% # Picks the data
  arrange(Freq) # Arranges the data in ascending order of Frequency
  
head(data) # Indicates the zeroes
tail(data) # Indicates increasing values down the tail up to max of 670.

# Reverse the order to descending by adding desc as follows

data <- data %>% 
  arrange(desc(Freq)) # Including the desc in the arrange verb

head(data) # Now the highest value of 670 comes first and the zeroes are down.

# Can we arrange by one column ascending and the other column descending, let me
# give it a try

data %>% 
  arrange(desc(Freq), Survived) # Quite doable

?dplyr::arrange # Quite rich source of information.

# Cool, so that was a simple one for today, Regards :)


# Should I want to get height of trees given inclinometer up (angle of elevation),
# inclinometer down (angle of depression) and distance to the base of the tree
# from the point of observation.

tree_height <- data.frame(up = c(13, 14, 15, 8, 15), # Random inclinometer up
                          down = c(5, 7, 7, 4, 6), # Random inclinometer down
                          dist = rep(20,5)) # Constant distance to tree base

tree_height_value <- tree_height %>% # Usind dataframe above
  mutate(height = 20*(tan(up*pi/180) + tan(down*pi/180))) # Creating new variable

head(tree_height_value) # Confirming the output values are as desired.


