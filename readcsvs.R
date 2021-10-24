# ####################################################
# Created: 3rd July 2021                             #
# Last edited 13th Sept 2021                         #
# By Wyclife Agumba Oluoch (wyclifeoluoch@gmail.com) #
######################################################

base::library(dplyr)
base::library(plyr) 
base::library(readr)

# I have 4 .csv files in my working directory "D:/FILES"

my_csv_files <- base::list.files(path = 'D:/FILES', 
                           pattern = "*.csv", 
                           full.names = TRUE) %>% 
  base::lapply(readr::read_csv) %>% 
  dplyr::bind_cols() %>% 
  dplyr::select(A...1, B...8, E...17)

readr::write_csv(my_csv_files, 'my_columns.csv', progress = TRUE) # Writes the output as csv to directory

# Note: Column names will be appended ...1, ...2, ...3 upto the last column name
# This helps avoid having same column names in a single dataframe.