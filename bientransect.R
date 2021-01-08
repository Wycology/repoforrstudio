###############################
# Wyclife Agumba Oluoch       #
# wyclifeoluoch@gmail.com     #
# Task working with BIEN  data#
# Created 8th Jan 2021        #
# Last edited 8th Jan 2021    #
###############################


# Working with transect data in bien library
# install.packages('BIEN'), just realized I did not have the package

# Loading the required libraries

library(BIEN); library(raster); library(dplyr); library(ggplot2)

# Next, I am going to download the gentry transect dataset

gentry <- BIEN_plot_dataset('Gentry Transect Dataset', 
                            political.boundaries = TRUE)
sites <- na.omit(unique(gentry[c('plot_name', 
                                 'latitude', 
                                 'longitude')]))

