#################################
# Wyclife Agumba Oluoch         #
# wyclifeoluoch@gmail.com       # 
# Task working with NAs in data #
# Created 8th Jan 2021          #
# Last edited 12th Feb 2021     #
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

# Removing the missing values and re-running the Post.Test values again.
# Going for the Post.Test variable.
mean(na_data$Post.Test, na.rm = TRUE)
min(na_data$Post.Test, na.rm = TRUE)
max(na_data$Post.Test, na.rm = TRUE)
median(na_data$Post.Test, na.rm = TRUE)
sd(na_data$Post.Test, na.rm = TRUE)

# This is working pretty fine for a single variable. However, the whole row can
# be omitted using na.omit()

na_omit_data <- na.omit(na_data)
na_omit_data # ID 5 is now missing from the new dataset because we passed the 
# dataset to na.omit() function.


mean(na_omit_data$Post.Test)
min(na_omit_data$Post.Test)
max(na_omit_data$Post.Test)
median(na_omit_data$Post.Test)
sd(na_omit_data$Post.Test)

# Cool, that is now working pretty fine.

# However, removing the row affects the results of some analyses on the data. 
# Others like t.test can handle missing values well and no difference notable.

t.test(na_data$Pre.Test, na_data$Post.Test, paired = TRUE)
t.test(na_omit_data$Pre.Test, na_omit_data$Post.Test, paired = TRUE)

# Now we want to replace the missing value with the mean of the available data.
# This is done using the na.gam.replace().

na_data_gam <- na.gam.replace(na_data)
na_data_gam # The data which was missing at ID 5 is now 7 which is the mean of 
# the available values in the dataset. Now if we run the t.test() on the data
# again, we will notice a difference.

t.test(na_data$Pre.Test, na_data$Post.Test, paired = TRUE)
t.test(na_data_gam$Pre.Test, na_data_gam$Post.Test, paired = TRUE)

# It is now clear that t, df, p-value, 95% confidence interval are all different.











