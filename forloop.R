###############################
# Wyclife Agumba Oluoch       #
# wyclifeoluoch@gmail.com     #
# Task working with for loop  #
# Created 6th Jan 2021        #
# Last edited 6th Jan 2021    #
###############################

# Basic structure of a for loop is of the kind:

for (item in list_of_items){
  do_something(item)
  print()
}

# Like for every student in a class, vaccinate. So every student must get the 
# vaccine. 

# For better appreciation, let me create a vector called volumes of three numbers.

volumes <- c(1.6, 3, 8)

for (volume in volumes){  # I have just replaced item with volume, list_of_items
  print(2.65 * volume^0.9)# with volumes and do_something with print with some
}                         # math on the items

# What is going on in the above code is that every element in the volumes vector
# is raised to power 0.9 then multiplied by 2.65 and printed out.

# So we can get the same results by calling every element in the vector individually
# and raising to power 0.9 and multiplying by 2.65.

volume <- volumes[1]     # Picking the first element in the volumes vector
print(2.65 * volume^0.9) # Doing the math on that first element

volume <- volumes[2]     # Picking the second element in the volumes vector
print(2.65 * volume^0.9) # Doing the math on that second element

volume <- volumes[3]     # Picking the third element in the volumes vector
print(2.65 * volume^0.9) # Doing the math on that third element picked from volumes

# It is clear that the second approach of doing the same thing is quite tiring.









