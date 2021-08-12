# Created: 3rd July 2021
# Last edited 12th Aug 2021
# By Wyclife Agumba Oluoch (wyclifeoluoch@gmail.com)

base::library(tidyverse) # For wrangling the data
base::library(plyr) # For lapply function

# I have 4 .csv files in my working directory "D:/FILES"

my_csv_files <- base::list.files(path = 'D:/FILES', 
                           pattern = "*.csv", 
                           full.names = TRUE) %>% # Tells where the files are
  base::lapply(readr::read_csv) %>% # Reads all the .csv files in the specified folder
  dplyr::bind_cols() %>% # Binds the read files by columns
  dplyr::select(A...1, B...8, E...17) # Selects column names of interest

readr::write_csv(my_csv_files, 'my_columns.csv') # Writes the output as csv to directory

# Note: Column names will be appended ...1, ...2, ...3 upto the last column name
# This helps avoid having same column names in a single dataframe.