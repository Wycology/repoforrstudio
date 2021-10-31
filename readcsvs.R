# ####################################################
# Created: 3rd July 2021                             #
# Last edited 31st Oct 2021                          #
# By Wyclife Agumba Oluoch (wyclifeoluoch@gmail.com) #
######################################################

base::library(dplyr)
base::library(plyr) 
base::library(readr)

# I have 4 .csv files in "D:/FILES"

my_csv_files <- base::list.files(path = 'D:/FILES', 
                           pattern = "*.csv", 
                           full.names = TRUE) %>% 
  base::lapply(readr::read_csv) %>% 
  dplyr::bind_cols() %>% 
  dplyr::select(A...1, B...8, E...17)

readr::write_csv(my_csv_files, 'my_columns.csv', progress = TRUE) 
