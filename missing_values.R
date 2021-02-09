#################################
# Wyclife Agumba Oluoch         #
# wyclifeoluoch@gmail.com       # 
# Task working with NAs in data #
# Created 8th Jan 2021          #
# Last edited 9th Feb 2021      #
#################################

# Here I am going to demonstrate how to work with missing data (NAs) in R

# Loading the necessary libraries

library(tidyverse, warn.conflicts = FALSE)
library(gam, warn.conflicts = FALSE)

# Creating the dataset

na_data <- tibble(ID = c(1:10),
                  Pre.Test = c(4, 5, 5, 4, 4, 3, 4, 4, 3, 4),
                  Post.Test = c(8, 7, 8, 7, NA, 6, 7, 6, 7, 7))

mean(na_data$Pre.Test)
min(na_data$Pre.Test)
max(na_data$Pre.Test)
median(na_data$Pre.Test)
sd(na_data$Pre.Test)
