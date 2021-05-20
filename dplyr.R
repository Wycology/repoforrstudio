#########################################
# Name: Wyclife Agumba Oluoch           #   
# E-mail: wyclifeoluoch@gmail.com       #
# GitHub: https://github.com/Wycology   #
# Task: Some data wrangling with dplyr  #
# Date: 9th Jan 2020                    #
# Last edited: 19th May 2021            #
#########################################

library(tidyverse) # For data wrangling in the whole project.
library(broom)
library(nycflights13) # This is having
library(moderndive)
# I will use the Titanic data for today's exploration

titanic_df <- data.frame(Titanic) # Titanic data as a data.frame object

# Once it is a data.frame, I can set it as a tibble which is my preferred structure
titanic_tibble <- tibble(titanic_df) # Here is the tibble form of the titanic_df

dim(titanic_tibble) # Checking the dimension of the data set; rows and columns.

# Checking the total number of passengers in the Titanic
# To do this, I need the sum of the frequency variable

head(titanic_tibble) # To appreciate the variables within the tibble to wrangle

number_passengers <- summarise(titanic_tibble, number_passengers = sum(Freq))
number_passengers # Returns the total passangers to be 2201.

# This can also be made more readable using the pipe (%>%) operator

number_passengers <- titanic_tibble %>%  # Super clear to read and understand what happens.
  summarise(number_passengers = sum(Freq))

# Working with the group_by verb to further get summary of the data

number_passengers_survived <- titanic_tibble %>% # Picking the data data set
  group_by(Survived) %>%  # Grouping the data by titanic ship Survived variable
  summarise(Survival = sum(Freq)) # Creating sum of based on whether 
# they survived or not.

number_passengers_survived # Returning the sum of passengers by survival which is 
# the grouping variable.


# Using the select verb to have only relevant variables for my need

data_sex_age_freq <- titanic_tibble %>% # Takes the Titanic data set
  select(Sex, Age, Freq) # Picking the three columns of my interest only.

# The next dplyr verb is mutate
# This is a verb which is used to add variables to the dataframe which are 
# usually functions of already existing dataframes. I do this my creating data2.
# This is what I applied on my research to get tree heights from inclinometer
# values.

titanic_tibble_mutate <- titanic_tibble %>% 
  mutate(Freq_10 = Freq * 10) # Creates new variable called Freq_10 which is 
# former Freq in data multiplied by 10.

head(titanic_tibble_mutate) # Freq_10 is added to the data set as the last column.

# If I want the just created column to fit as first in the dataframe, then I can
# add the .after or .before argument in the mutate function:

titanic_tibble_mutate <- titanic_tibble %>% 
  mutate(Freq_10 = Freq * 10, .after = 1) # Makes it the second variable

head(titanic_tibble_mutate)

titanic_tibble_mutate <- titanic_tibble %>% 
  mutate(Freq_10 = Freq * 10, .before = 1) # Makes it the first variable

head(titanic_tibble_mutate)


titanic_tibble_mutate <- titanic_tibble %>% 
  mutate(Freq_10 = Freq * 10, .after = Age) # Puts it after Age variable within
# the dataframe.
head(titanic_tibble_mutate)

# Without mutation, columns can be rearranged using relocate().
head(titanic_tibble_mutate)

titanic_tibble_mutate <- titanic_tibble_mutate %>% 
  relocate(Age, .before = Sex) # Cool, that worked fine. 

head(titanic_tibble_mutate)

# Returning back Age to its original place

titanic_tibble_mutate <- titanic_tibble_mutate %>% 
  relocate(Age, .after = Sex)

head(titanic_tibble_mutate)

# Filter verb is the next one to have a close look at.

# This is returning observations in the dataset which are meeting specific 
# conditions in one or more columns.
# For example if we need sub-data having only female then we filter Sex by the
# word Female.

titanic_female <- titanic_tibble %>%   # Picks the whole data set
  filter(Sex == 'Female') # Picks rows with Sex as Female

head(titanic_female) # Returns the filtered data set 

# In case I need only adult females who survived in 1st class:

titanic_tibble %>% 
  filter(Age == 'Child' & Sex == 'Female' & Survived == 'Yes' & Class == '1st')

titanic_tibble %>% 
  filter(Age == 'Child' & Sex == 'Male' & Survived == 'Yes' & Class == '1st')

# Arrange is the next verb we are having a close look at

titanic_tibble <- data.frame(Titanic) # Reloading the data. I noticed the grouped data issue

titanic_tibble <- tibble(titanic_tibble) # Having the data as tibble

titanic_tibble <- titanic_tibble %>% # Picks the data
  arrange(Freq) # Arranges the data in ascending order of Frequency
  
head(titanic_tibble) # Indicates the zeroes
tail(titanic_tibble) # Indicates increasing values down the tail up to max of 670.

# Reverse the order to descending by adding desc as follows

titanic_tibble <- titanic_tibble %>% 
  arrange(desc(Freq)) # Including the desc in the arrange verb

head(titanic_tibble) # Now the highest value of 670 comes first and the zeroes are down.

# Can we arrange by one column ascending and the other column descending, let me
# give it a try

titanic_tibble %>% 
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

head(tree_height_value) # Confirming the output values are as desired. This has 
# made my work easier to accomplish.

# Correlation within dplyr----

data(flights)

flights %>% 
  summarise(delay_cor = cor(dep_delay, arr_delay)) # This is returning NA.

# To solve this problem, we need to set the function to use only complete cases

flights %>% 
  summarise(delay_cor = cor(dep_delay, arr_delay, use = 'complete.obs'))

# The same can also be achieved by
flights %>% 
  select(dep_delay, arr_delay) %>%
  na.omit() %>% 
  summarise(delay_cor = cor(dep_delay, arr_delay))

# Running a model and returning a tidy output

data("iris") # This is loading the dataset that intend to model

score_model <- lm(Sepal.Length ~ Petal.Width, data = iris) # The model

score_model %>% # This is spitting the normal output, good but not tidy.
  summary()

# Now we will make the data more tidy using tidy function from broom

tidy(score_model) # This is tidying up the data. Comes from broom package.

# This is now tidier. Pretty cool, let me try plotting it out.

tidy(score_model) %>% # Generating the model output tibble
  ggplot() + # Calling for the ggplot
  geom_col(aes(x = term, y = statistic, fill = term)) # Bar plot using the 
# statistic variable.

# How far can we make this simple

iris %>% # Pick the iris dataframe
  select(Sepal.Length, Petal.Width) %>% # Select the two variables to regress
  lm() %>% # Apply the lm function to the selected variables
  tidy() %>% # Make the output tidy using the tidy() function from broom
  ggplot() + # Invoke ggplot
  geom_col(aes(x = term, y = std.error, fill = term)) # Give geometry & aesthetics

glance(score_model) # This is also a tidy one to think about.

get_regression_summaries(score_model) # The function is from moderndive package

augment(score_model) # This is revealing a lot of information including fitted

get_regression_points(score_model) # This is returning regression points and 
# residual

anova_iris <- aov(Sepal.Length ~ Petal.Width, data = iris)
tidy(anova_iris)

# Here comes the sum by group in dplyr----

data(iris) # Loading the iris data
head(iris) # Checking the first six observation in the iris data

aggregate(x = c(iris$Sepal.Length, iris$Sepal.Width), # Picks the column to be summarized
          by = list(iris$Species), # Picks the summarizing group
          FUN = sum)  # Gets the function to use in the summary


# I want to attempt this using the other approach where I set group_by

iris %>% # Picking the iris data.
  group_by(Species) %>% # Grouping the data by the Species variable.
  summarise(x = sum(Sepal.Length)) # Getting a summary of the expected output.

# One thing to note is that the earlier one gave result to the first decimal 
# value while the second gave only the whole number part.

# We can force the dplyr to show the hidden decimal by

iris %>% 
  group_by(Species) %>% 
  summarise(`sum(Sepal.Length)` = sprintf('%0.1f', sum(Sepal.Length)))
# Great, that has worked.
# We can alter the number of decimal places by varying the value 1 next to f.
# For example, we can change it to 4.

iris %>% 
  group_by(Species) %>% 
  summarise(`sum(Sepal.Length)` = sprintf('%0.4f', sum(Sepal.Length)))