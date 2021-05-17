library(dismo) # for the getData function
library(raster) # for crop, mask and stack functions
library(ecbtools) # for raster.kmeans function

# ecbtools package is only available from gitHub repository at the time of 
# writing this code

# To install ecbtools, run this: remotes::install_github("ozjimbob/ecbtools")

my_rasters <- getData('worldclim', res = 10, var = 'tmin') # worldclim rasters
my_polygon <- getData('GADM', country = 'KEN', level = 0) # shapefile of my area

cropped_rasters <- crop(my_rasters, my_polygon) # cropped rasters
masked_rasters <- mask(cropped_rasters, my_polygon) # masked rasters

plot(masked_rasters[[2]]) #Visual of one masked layer 

stacked_rasters <- stack(masked_rasters) # Creating rasterStack from rasterBrick

kmeans_layer <- raster.kmeans(x = stacked_rasters, # The stack
                             k = 4,# Number of clusters
                             nstart = 3, # random sets 
                             geo = TRUE, # weighting by location (x,y coords)
                             geo.weight = 1) # wweight to location

kmeans_layer # Output is raster layer with four groups/clusters 

plot(kmeans_layer) # Visualizing the output as a plot

writeRaster(kmeans_layer, 'output_clusters.tif', overwrite = TRUE) # Write raster to working dir.
