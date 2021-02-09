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
# Starting with the Pre.Test variable.
mean(na_data$Pre.Test)
min(na_data$Pre.Test)
max(na_data$Pre.Test)
median(na_data$Pre.Test)
sd(na_data$Pre.Test)

# Going for the Post.Test variable.
mean(na_data$Post.Test)
min(na_data$Post.Test)
max(na_data$Post.Test)
median(na_data$Post.Test)
sd(na_data$Post.Test)

# Removing the missing values and reruning the Post.Test values again.

