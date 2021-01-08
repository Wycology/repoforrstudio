#########################################
# Name: Wyclife Agumba Oluoch           #   
# E-mail: wyclifeoluoch@gmail.com       #
# GitHub: https://github.com/Wycology   #
# Task: Creating functions in R         #
# Date: 7th Jan 2020                    #
# Last edited: 7th Jan 2020             #
#########################################

# R has thousands of inbuilt functions as well as those inside various third 
# party libraries, how to write them is important just to be sure of what a 
# function does.

# Let us start with a basic structure of a function.

function_name <- function(inputs){
  output_value <- do_something(inputs)
  return(output_value)
}

# Using curly braces {} tells R that whatever is inside should be run together, e.g

{
  a = 3
  b = 2
  a + b
}

# Let us create a function which calculates the volume of a shrub

calc_shrub_vol <- function(length, width, height){ # inputs are the dimensions
  volume <- length*width*height # output is given the math to do on inputs
  return(volume) # output is returned
}

# Now we have created a function, so we need to feed it some data to see output
# Let us assume a shrub has a length of 1.8m, width of 1.2m, and height of 2.0m

# So we feed these dimension values into the function to see the output

calc_shrub_vol(1.8, 1.2, 2.0) # the order follows that of defined functions

# However when we want to change the order, like enter height, then length, then
# width then we must provide them in the function explicitly like:

calc_shrub_vol(height = 2.0, length = 1.8, width = 1.2) # Same results. Care must
# be taken when playing around with the input values to take care of the order.


# Now we can go ahead and combine functions. That is, we can feed the output of 
# the shrub's volume to another function which calculates mass of the bush

est_shrub_mass <- function(volume){
  mass <- 2.65 * volume^0.9
}

# Great, the function is built.

shrub_volume <- calc_shrub_vol(1.8, 1.2, 2.0) # calculate shrub volume
shrub_mass <- est_shrub_mass(shrub_volume) # feed volume to mass function
shrub_mass # print the output (mass of the shrub)

# This our young function can also enjoy ride with pipe operator
library(dplyr)
shrub_mass <- calc_shrub_vol(1.8, 1.2, 2.0) %>% # Perfect and the output piped down
  est_shrub_mass() # receives output from the above function and calculates mass
shrub_mass # Confirms everything went on well.

# Now let us do actual nesting of out two functions we created so far.

shrub_mass <- est_shrub_mass(calc_shrub_vol(1.8, 1.2, 2.0)) # two nested functions
shrub_mass

est_shrub_mass_dim  <- function(length, width, height) {
  volume <- calc_shrub_vol(length, width, height)
  mass <- est_shrub_mass(volume)
  return(mass)
}

est_shrub_mass_dim(1.8, 1.2, 2.0) # This gets volume then mass then prints
# Super good way of having all the functions together and getting the single result.

# That is it for today, I enjoyed it and I hope you too.
# Note: when one of the inputs is negative value or NA then problems arise
# Those can be handled later.