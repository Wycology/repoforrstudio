#### I am working on this to demonstrate the power of R in plotting ####

#############################
# Wyclife Agumba Oluoch     #
# wyclifeoluoch@gmail.com   #
#############################

data("Orange")     # Loading the inbuilt Orange data
head(Orange)       # First 6 rows of the dataframe
length(Orange$age) # Checking the length of the dataframe

Orangelm <- lm(circumference ~ age, data = Orange) # Regression model for orange
summary(Orangelm) # Details of the regression model.

plot(Orange$circumference ~ Orange$age, 
     col = "purple",
     pch = 19,
     cex = 2,
     xlab = "Age (days)",
     ylab = "Circumference (mm)",
     main = "Relationship between age and cricumference of oranges")
abline(Orangelm, lwd = 3, lty = "dashed", col = "cyan") # Adding the lm as abline
text(300, 200, "R^2 = 0.8345\nP<0.0001\ny = 17.4 + 0.107x")
# Annotating text on the graph.
# \n indicates line break to shift the next component to next line.
?Orange
