###############################
# Wyclife Agumba Oluoch       #
# wyclifeoluoch@gmail.com     #
# Task: working with for loop #
# Created 6th Jan 2021        #
# Last edited 24th April 2021  #
###############################

# The basic structure of a `for loop` is of the kind:

for (item in list_of_items){
  do_something(item)
  print()
} 

# Simple but powerful code. Of course that throws an error when run because
# we have not defined object to iterate.

# Like for every student in a class, vaccinate. So every student must get the 
# vaccine. 

# For better appreciation, let me create vector called volumes of three numbers.

volumes <- c(22, 12, 29)

for (volume in volumes){  # I have replaced item with volume, list_of_items
  print(2.65 * volume^0.9)# with volumes and do_something with print with some
}                         # math on the items.

# What is going on in the above code is that every element in the volumes vector
# is raised to power 0.9 then multiplied by 2.65 and printed out.

# So we can get the same results by calling every element in the vector 
# individually and raising to power 0.9 and multiplying by 2.65.

volume <- volumes[1]     # Picking the first element in the volumes vector
print(2.65 * volume^0.9) # Doing the math on that first element

volume <- volumes[2]     # Picking the second element in the volumes vector
print(2.65 * volume^0.9) # Doing the math on that second element

volume <- volumes[3]     # Picking the third element in the volumes vector
print(2.65 * volume^0.9) # Doing the math on that third element 

# It is clear that the second approach of doing the same thing is quite tiring.

# If subsetting with square brackets [] is still a nightmare, then we can 
# achieve the end result with plain math like this:

2.65 * 22^0.9 # Really picking the first element in volumes vector manually
2.65 * 12^0.9   # Picking the second element in the volumes vector by eye
2.65 * 29^0.9  # Literally lifting the third element and doing the math.

# So in the end, we are sweating and at the back of our minds we wish we could 
# go back to the for loop.

# There we go...

for (volume in volumes){
  print(2.65 * volume^0.9)
}

# Super simple... :) Right!

# Now we can do more with the for loop including creating outputs which we save 
# to objects and other objects, and other objects.....

for (volume in volumes){         # Picking each element in the volumes vector
  mass_kgs <- 2.65 * volume^0.9  # Creates mass in Kgs using some formula
  mass_lb <- mass_kgs * 2.2      # Changing mass in kgs to mass in pounds
  mass_whole <- round(mass_lb)   # Setting output to whole number
  mass_tens <- round(mass_whole, digits = -1) # Round to nearest tens
  print(mass_tens)              # Printing the final output.
}

# I can't imagine doing this manually plus the math

# One more step....using index in for loop. 

for (i in 1:length(volumes)){   # length of vector volumes is 3
  mass <- 2.65 * volumes[i]^0.9 # i in [] stands for every item in volumes
  mass <- round(mass)           # rounding to whole numbers
  print(mass)                   # printing the final output to whole numbers
}

# Now we might need to store output of our for loop in some vector
# So we start by creating an empty vector

masses <- vector(mode = 'numeric', length = length(volumes))
# This is an empty object (having only three zero values). The three zeroes fill
# up three spaces for the length of volumes vector. Can have one with 50 spaces

masses2 <- vector(mode = 'numeric', length = 50)
print(masses2)

print(masses) # zero zero zero for the number of elements in volumes object

for (i in 1:length(volumes)){
  mass <- 2.65 * volumes[i]^0.9
  masses[i] <- mass
}

print(masses)
print(round(masses))
print(round(masses, digits = -1))

# This is enough for a single vector, let us now try multiple vectors
# Indexing can be used to iterate through multiple vectors
# Let us create additional vectors

b0 <- c(2.2, 1.2, 2.9) # A vector of three elements
b1 <- c(0.22, 0.12, 0.29)    # The second vector with similar length as previous

# Creating an empty vector to store numeric elements of length same as volumes
masses <- vector(mode = 'numeric', length = length(volumes))

for (i in seq_along(volumes)){ # seq_along(volumes) is same as 1:length(volumes)
  mass <- b0[i] * volumes[i] ^ b1[i]
  masses[i] <- mass
} 
masses

# Looping over files -  I could have done this but I do not like to do it so that
# I don't push so many files to the github.
