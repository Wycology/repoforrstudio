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

# Calculating species richness
rich_data <- gentry %>% 
  filter(is_new_world == 1) %>% 
  group_by(county, plot_name) %>% 
  summarise(richness = n()) %>% 
  collect()

# Download environmental data from worldclim
bioclim <- getData('worldclim', var = 'bio', res = 10 )

sites_spatial <- SpatialPointsDataFrame(sites[c('longitude', 'latitude')], sites)

plot(bioclim$bio12)
plot(sites_spatial, add = TRUE)

# Extract environmental data for each transect

bioclim_gentry <- raster::extract(bioclim, sites_spatial) %>% 
  cbind(sites)



