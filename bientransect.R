###############################
# Wyclife Agumba Oluoch       #
# wyclifeoluoch@gmail.com     #
# Task working with BIEN  data#
# Created 8th Jan 2021        #
# Last edited 26th Jan 2021    #
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

# Checking the structure of the dataset
str(gentry)  # This is revealing that we have a dataframe at hand.
head(gentry) # Checking the first six observations.

# Calculating species richness
rich_data <- gentry %>%           # Picks the gentry data
  filter(is_new_world == 1) %>%   # filter where newworld is 1
  group_by(county, plot_name) %>% # grouping by the two variables
  summarise(richness = n()) %>%   # counting richness per group
  collect()                       # rendering output as table

rich_data %>% arrange(richness) %>% head() # Ascending order of richness
rich_data %>% arrange(-richness) %>% head() # Descending order of richness

# Download environmental data from worldclim
bioclim <- getData('worldclim', var = 'bio', res = 10 )

sites_spatial <- SpatialPointsDataFrame(sites[c('longitude', 'latitude')], 
                                        sites)

class(sites_spatial) # Checking whether making the data spatial succeeded. 
head(sites_spatial) # Printing the first six rows of the sp.
nrow(sites_spatial) # This is returning number of rows of the sp dataset

plot(bioclim$bio12) # Plotting one of the bioclimate data downloaded.
plot(sites_spatial, add = TRUE) # Plotting the plot points on the raster data.

# Extract environmental data for each transect

bioclim_gentry <- raster::extract(bioclim, sites_spatial) %>% 
  cbind(sites)

head(bioclim_gentry) # Checking how each of the raster layers has been extracted
# and bound to the sites dataframe.
tail(bioclim_gentry)

# Combining with the species richness data

richness_with_env <- inner_join(rich_data, bioclim_gentry)

head(richness_with_env)
tail(richness_with_env)

# See how richness relate to precipitation which is bio 12

ggplot(richness_with_env, aes(x = bio12, y = richness)) +
  geom_point() +
  theme_classic() +
  labs(x = 'Precipitation', # Adding labels to the plot.
       y = 'Richness')

