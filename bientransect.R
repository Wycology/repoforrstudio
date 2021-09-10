################################
# Wyclife Agumba Oluoch        #
# wyclifeoluoch@gmail.com      #
# Task working with BIEN  data #
# Created 8th Jan 2021         #
# Last edited 10thSept 2021    #
################################

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

head(richness_with_env) # First six rows.
tail(richness_with_env) # Last six rows.

# See how richness relate to precipitation which is bio 12

ggplot(data = richness_with_env, aes(x = bio10, y = richness, col = county)) +
  geom_point() +
  theme_classic() +
  labs(x = 'Precipitation (mm)', # Adding labels to the plot.
       y = 'Richness')

# I see a lot of NAs (gray color points) under county, let me omit the NAs. 
# Remember the NAs are for the county names and not in about missing richness
# nor precipitation data.

richness_with_env %>% 
  na.omit() %>% 
  ggplot(aes(x = bio10, y = richness, col = county)) +
  geom_point() +
  geom_abline() +
  theme_classic() +
  labs(x = 'Precipitation (mm)', # Adding labels to the plot.
       y = 'Richness')

# That is good for the day. Key things here are just about data wrangling.

one_county <- nc %>% select(NAME) %>% filter(NAME == 'Ashe')

two_county <- st_transform(one_county, 32119)

two_county <- st_geometry(two_county)
buf <- st_buffer(two_county, dist = 3000)
plot(buf, border = 'red', col = 'purple')
plot(two_county, add = TRUE, col = 'cyan')
plot(st_buffer(two_county, dist = -3000), add = TRUE, border = 'blue', col = 'yellow')