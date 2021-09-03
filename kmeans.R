# 3rd July 2021
# Created by Wyclife Agumba Oluoch (wyclifeoluoch@gmail.com)
# 3rd Sept 2021

base::library(dismo) # for the getData function
base::library(raster) # for crop, mask and stack functions
base::library(ecbtools) # for raster.kmeans function

# ecbtools package is only available from gitHub repository at the time of 
# writing this code

# To install ecbtools, run this: remotes::install_github("ozjimbob/ecbtools")

my_rasters <- raster::getData('worldclim', res = 10, var = 'tmin') # worldclim rasters
my_polygon <- raster::getData('GADM', country = 'KEN', level = 0) # shapefile of my area

cropped_rasters <- raster::crop(my_rasters, my_polygon) # cropped rasters
masked_rasters <- raster::mask(cropped_rasters, my_polygon) # masked rasters

raster::plot(masked_rasters[[2]]) #Visual of one masked layer 

stacked_rasters <- raster::stack(masked_rasters) # Creating rasterStack from rasterBrick

kmeans_layer <- ecbtools::raster.kmeans(x = stacked_rasters, # The stack
                             k = 4,# Number of clusters
                             nstart = 3, # random sets 
                             geo = TRUE, # weighting by location (x,y coords)
                             geo.weight = 1) # wweight to location

kmeans_layer # Output is raster layer with four groups/clusters 

raster::plot(kmeans_layer) # Visualizing the output as a plot

raster::writeRaster(kmeans_layer, 'output_clusters.tif', overwrite = TRUE) # Write raster to working dir.