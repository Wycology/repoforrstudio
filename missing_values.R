##################################
# Wyclife Agumba Oluoch          #
# wyclifeoluoch@gmail.com        # 
# Task: working with NAs in data #
# Created 8th Jan 2021           #
# Last edited 31st July 2021      #
##################################

# I am going to demonstrate how to work with missing data (NAs) in R

# Loading the necessary libraries for working with NA values

base::library(tidyverse, warn.conflicts = FALSE) # For data wrangling
base::library(gam)

# Creating the data-set with NA in post-test variable

na_data <- tibble::tibble(ID = base::c(1:10), # First variable
                  Pre.Test = base::c(4, 5, 5, 4, 4, 3, 4, 4, 3, 4), # Complete set
                  Post.Test = base::c(8, 7, 8, 7, NA, 6, 7, 6, 7, 7)) # With NA
# Starting with the Pre.Test variable.
mean(na_data$Pre.Test) # Works fine with the Pre-Test column
min(na_data$Pre.Test) # Runs pretty fine, this is also cool.
max(na_data$Pre.Test) # Cool
median(na_data$Pre.Test) # Cooler
sd(na_data$Pre.Test) # Coolest
var(na_data$Pre.Test) # variance of the data

# Going for the Post.Test variable. Here we have a number of missing values
mean(na_data$Post.Test) # NA
min(na_data$Post.Test) # Another NA
max(na_data$Post.Test) # Checking for the max in the data-set
median(na_data$Post.Test) # Also NA
sd(na_data$Post.Test)
var(na_data$Post.Test, use = 'complete.obs') # complete.obs returns a value

# Removing the missing values and re-running the Post.Test values again.
# Going for the Post.Test variable.
mean(na_data$Post.Test, na.rm = TRUE) # Handling NA in the data-set 
min(na_data$Post.Test, na.rm = TRUE)
max(na_data$Post.Test, na.rm = TRUE)
median(na_data$Post.Test, na.rm = TRUE)
sd(na_data$Post.Test, na.rm = TRUE)

# This is working pretty fine for a single variable. However, the whole row can
# be omitted using na.omit()

na_omit_data <- na.omit(na_data) # This is also working pretty fine.
na_omit_data # ID 5 is now missing from the new dataset because we passed the 
# dataset to na.omit() function.

min(na_omit_data$Post.Test)
max(na_omit_data$Post.Test)
median(na_omit_data$Post.Test)
sd(na_omit_data$Post.Test)
mean(na_omit_data$Post.Test)

# Cool, that is now working pretty fine.

# However, removing the row affects the results of some analyses on the data. 
# Others like t.test can handle missing values well and no difference notable.

t.test(na_data$Pre.Test, na_data$Post.Test, paired = TRUE)
t.test(na_omit_data$Pre.Test, na_omit_data$Post.Test, paired = TRUE)

# Now I want to replace the missing value with the mean of the available data.
# This is done using the na.gam.replace().

na_data_gam <- na.gam.replace(na_data) # Uses the mean to impute missing values
na_data_gam # The data which was missing at ID 5 is now 7 which is the mean of 
# the available values in the dataset. Now if we run the t.test() on the data
# again, we will notice a difference.

t.test(na_data$Pre.Test, na_data$Post.Test, paired = TRUE)
t.test(na_data_gam$Pre.Test, na_data_gam$Post.Test, paired = TRUE)

# It is now clear that t, df, p-value, 95% confidence interval are all different.
# This is calling for maximum care when imputing missing values in a dataset
# depending on the subsequent analyses to be conducted.