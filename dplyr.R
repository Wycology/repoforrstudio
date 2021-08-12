#########################################
# Name: Wyclife Agumba Oluoch           #   
# E-mail: wyclifeoluoch@gmail.com       #
# GitHub: https://github.com/Wycology   #
# Task: Some data wrangling with dplyr  #
# Date: 9th Jan 2020                    #
# Last edited: 12th Aug 2021            #
#########################################

library(tidyverse) # For data wrangling in the whole project.
library(broom) # For tidying model outputs. Kind of displaying model output in a tibble
library(nycflights13) # This is having the titanic data-set.
library(moderndive) # Almost the same role as broom of tidying model output 

# I will use the Titanic data.set which is a of class table

titanic_df <- base::data.frame(Titanic) # Titanic data as a data.frame object

# Once it is a data.frame, I can set it as a tibble which is my preferred structure
titanic_tibble <- tibble::tibble(titanic_df) # Tibble form of the titanic_df

titanic_tibble <- tibble::tibble(base::data.frame(Titanic)) # In a single line of code

base::dim(titanic_tibble) # Dimension of the data set; rows and columns.

# Checking the total number of passengers in the Titanic

number_passengers <- dplyr::summarise(titanic_tibble, number_passengers = base::sum(Freq))
number_passengers # Number of passengers.

# This can also be made more readable using the pipe ( |> )

number_passengers <- titanic_tibble |>  # Super clear to read and understand what happens.
  dplyr::summarise(number_passengers = base::sum(Freq))

# Working with the group_by verb to further get summary of the data

number_survived <- titanic_tibble  |>  # Picking the data data set
  dplyr::group_by(Survived) |>  # Grouping the data by titanic ship Survived variable
  dplyr::summarise(Survival = base::sum(Freq)) # Creating sum of based on whether 

number_survived # Returning the sum of passengers by survival which is 
# the grouping variable.

# Using the select verb----

data_sex_age_freq <- titanic_tibble |> # Takes the Titanic data set
  dplyr::select(Sex, Age, Freq) # Picking the three columns of my interest only.

# Using the mutate verb----

# This is a verb which is used to add variables to the data.frame which are 
# usually functions of already existing data.frames. I do this by creating data2.
# This is what I applied on my research to get tree heights from inclinometer
# read values.

titanic_tibble_mutate <- titanic_tibble |> 
  dplyr::mutate(Freq_10 = Freq * 10) # Creates new variable called Freq_10 which is 
# former Freq in the titanic_tibble multiplied by 10.

utils::head(titanic_tibble_mutate) # Freq_10 is added to the data-set as the last column.

# If I want the created column to fit as first in the tibble, then I can
# add the .after or .before argument in the mutate function:

titanic_tibble_mutate <- titanic_tibble |> 
  dplyr::mutate(Freq_10 = Freq * 10, .after = 1) # Makes it the second variable

utils::head(titanic_tibble_mutate) # Checking the first few rows

titanic_tibble_mutate <- titanic_tibble |> 
  dplyr::mutate(Freq_10 = Freq * 10, .before = 1) # Makes it the first variable

utils::head(titanic_tibble_mutate) # First six rows

titanic_tibble_mutate <- titanic_tibble |> 
  dplyr::mutate(Freq_10 = Freq * 10, .after = Age) # Puts it after Age variable within
# the dataframe.
utils::head(titanic_tibble_mutate)

# Without mutation, columns can be rearranged using relocate().

titanic_tibble_mutate <- titanic_tibble_mutate |> 
  dplyr::relocate(Age, .before = Sex) # Cool, that worked fine. 

utils::head(titanic_tibble_mutate)

# Returning back Age to its original place

titanic_tibble_mutate <- titanic_tibble_mutate |> 
  dplyr::relocate(Age, .after = Sex)

utils::head(titanic_tibble_mutate)

# Filter verb----

# This is returning observations in the data.set which are meeting specific 
# conditions in one or more columns.
# For example if we need sub-data having only female then we filter Sex by the
# word Female.

titanic_female <- titanic_tibble |>   # Picks the whole data set
  dplyr::filter(Sex == 'Female') # Picks rows with Sex as Female

utils::head(titanic_female) # Returns the filtered data set 

# In case I need only child females who survived in 1st class:

titanic_tibble |> 
  dplyr::filter(Age == 'Child' & Sex == 'Female' & Survived == 'Yes' & Class == '1st')

titanic_tibble |> 
  dplyr::filter(Age == 'Child' & Sex == 'Male' & Survived == 'Yes' & Class == '1st')

# Using Arrange verb----

titanic_tibble <- base::data.frame(Titanic) # Reloading the data. I noticed the grouped data issue

titanic_tibble <- tibble::tibble(titanic_tibble) # Having the data as tibble

titanic_tibble <- titanic_tibble |> # Picks the data
  dplyr::arrange(Freq) # Arranges the data in ascending order of Frequency
  
utils::head(titanic_tibble) # Indicates the zeroes
utils::tail(titanic_tibble) # Indicates increasing values down the tail up to max of 670.

# Reverse the order to descending by adding desc as follows

titanic_tibble <- titanic_tibble |> 
  dplyr::arrange(utils::desc(Freq)) # Including the desc in the arrange verb

utils::head(titanic_tibble) # Now the highest value of 670 comes first and the zeroes are down.

# Can we arrange by one column ascending and the other column descending, let me
# give it a try

titanic_tibble |> 
  dplyr::arrange(utils::desc(Freq), Survived) # Quite doable

?dplyr::arrange # Quite rich source of information.

# Cool, so that was a simple one for today, Regards :)

# Should I want to get heights of trees given inclinometer up (angle of elevation),
# inclinometer down (angle of depression) and distance to the base of the tree
# from the point of observation. Kind of my observations in Turkana

tree_height <- base::data.frame(up = base::c(13, 14, 15, 8, 15), # Random inclinometer up
                          down = base::c(5, 7, 7, 4, 6), # Random inclinometer down
                          dist = base::rep(20,5)) # Constant distance to tree base

tree_height_value <- tree_height |> # Using the data.frame above
  dplyr::mutate(height = 20*(base::tan(up*pi/180) + base::tan(down*pi/180))) # Creating new variable

utils::head(tree_height_value) # Confirming the output values are as desired. This has 
# made my work easier to accomplish.

# Correlation within dplyr----

utils::data(flights)

flights |> 
  dplyr::summarise(delay_cor = stats::cor(dep_delay, arr_delay)) # This is returning NA.

# To resolve this problem, we need to set the function to use only complete cases

flights |> 
  dplyr::summarise(delay_cor = stats::cor(dep_delay, arr_delay, use = 'complete.obs'))

# The same can also be achieved by omiting the rows with na values

flights |> 
  dplyr::select(dep_delay, arr_delay) |>
  stats::na.omit() |> 
  dplyr::summarise(delay_cor = stats::cor(dep_delay, arr_delay))

# Running a model and returning a tidy output

utils::data("iris") # This is loading the data.set that intend to model

score_model <- stats::lm(Sepal.Length ~ Petal.Width, data = iris) # The model

score_model |> # This is spitting the normal output, good but not tidy.
  base::summary()

# Using tidy() from broom on model outputs

# Now we will make the summary more tidy using tidy function from broom

broom::tidy(score_model) # This is tidying up the data. Comes from broom package.

# This is now tidier. Pretty cool, let me try plotting it out.

broom::tidy(score_model) |> # Generating the model output tibble
  ggplot2::ggplot() + # Calling for the ggplot
  ggplot2::geom_col(ggplot2::aes(x = term, y = statistic, fill = term)) # Bar plot using the 
# statistic variable.

# How far can we make this simple

iris |> # Pick the iris dataframe
  dplyr::select(Sepal.Length, Petal.Width) |> # Select the two variables to regress
  stats::lm() |> # Apply the lm function to the selected variables
  broom::tidy() |> # Make the output tidy using the tidy() function from broom
  ggplot2::ggplot() + # Invoke ggplot
  ggplot2::geom_col(ggplot2::aes(x = term, y = std.error, fill = term)) # Give geometry & aesthetics

broom::glance(score_model) # This is also a tidy one to think about.

moderndive::get_regression_summaries(score_model) # The function is from moderndive package

broom::augment(score_model) # This is revealing a lot of information including fitted

moderndive::get_regression_points(score_model) # This is returning regression points and 
# residual

anova_iris <- stats::aov(Sepal.Length ~ Petal.Width, data = iris)
broom::tidy(anova_iris)

# Here comes the sum by group in dplyr----

utils::data(iris) # Loading the iris data
utils::head(iris) # Checking the first six observation in the iris data

stats::aggregate(x = base::c(iris$Sepal.Length), # Picks the column to be summarized
          by = base::list(iris$Species), # Picks the summarizing group
          FUN = sum)  # Gets the function to use in the summary

# I want to attempt this using the other approach where I set group_by

iris |> # Picking the iris data.
  dplyr::group_by(Species) |> # Grouping the data by the Species variable.
  dplyr::summarise(x = base::sum(Sepal.Length)) # Getting a summary of the expected output.

# One thing to note is that the earlier one gave result to the first decimal 
# value while the second gave only the whole number part.

# We can force the dplyr to show the hidden decimal by

iris |> 
  dplyr::group_by(Species) |> 
  dplyr::summarise(`sum(Sepal.Length)` = base::sprintf('%0.1f', base::sum(Sepal.Length)))
# Great, that has worked.
# We can alter the number of decimal places by varying the value 1 next to f.
# For example, we can change it to 4.

iris |> 
  dplyr::group_by(Species) |> 
  dplyr::summarise(`sum(Sepal.Length)` = base::sprintf('%0.4f', base::sum(Sepal.Length)))
# Done for the day  