###############################
# Wyclife Agumba Oluoch       #
# wyclifeoluoch@gmail.com     #
# https://github.com/Wycology #
# Task: Playing with iris data#
# Created: 30th Dec 2020      #
# Edited: 14th Feb 2021       #
###############################

# IRIS PLOT ----

# Loading necessary packages.

library(modelr)
library(patchwork) # Combining plots
library(ggforce)
library(tidyverse) # Huge library for wrangling and visualizing the data-set

str(iris) # Checking the data structure. We can already see relatively higher 
# values for sepal length variable.

reg <- lm(Petal.Width ~ Sepal.Length, data = iris)
coeff <- coefficients(reg)
eq <- paste0('y = ', round(coeff[2], 1), "*x ", round(coeff[1], 1))
plot(iris$Sepal.Length, iris$Petal.Width, # Variables to use on the plot
     col = 'purple', # Color for the data points on the plot
     main = paste0("Simple plot in R \n Isn't it?\n", eq), # Title of the plot in two lines
     sub = 'Subtitle at lower center of the plot', # Adding subtitle to the plot
     cex = 2, # Double size of the points on the plot
     pch = 19, # Picks the 19th character in terms of shape of points plotted
     bty = 'l', # Box type. Other options are 'o', 'n', 'l', '7', 'c', 'u', ']'
     xlab = 'Sepal length (cm)', # Labels x axis
     ylab = 'Petal width (cm)', # Labels y axis
     las = 1, # Making y axis labels to stand upright
     cex.main = 1.5, # Doubles text size on title
     cex.lab = 1.5, # Increases labels text size by 50%
     cex.axis = 1.5
     # xlim = range(0:8), # Can easily set the limits of x-axis
     # ylim = range(0:2.6) # Can easily set the limits of y-axis
     )
abline(reg, data = iris, lty = 5, lwd = 2, col = 'purple')# Best line of fit on the plot
abline(v = mean(iris$Sepal.Length), col = 'red', lwd = 3, lty = 2)
abline(v = median(iris$Sepal.Length), col = 'yellow', lwd = 3, lty = 3)
abline(h = mean(iris$Petal.Width), col = 'blue', lwd = 3, lty = 2)
abline(h = median(iris$Petal.Width), col = 'orange', lwd = 3, lty = 6)
text(7, 0.5, "Such a simple plot to generate")
text(5, 2.25, "I thought it was hard until I gave it a try")

# Creating cool plot of the iris data using ggplot2 package.

separate_smooth <- ggplot(data = iris,    # Specifying the data to be plotted.
       mapping = aes(x = Sepal.Length,    # Stating the axes data.
                     y = Petal.Width,
                     color = Species)) +  # Ensuring points are colored by spp.
  geom_point() +                          # Deciding the plotting geometry.
  labs(x = "Petal length (cm)",           # Specifying the axes labels.
       y = "Sepal width (cm)") +
  geom_mark_ellipse(aes(fill = Species,   # Adding ellipses for the spps.
                        filter = Species == "setosa",
                        label = "Iris setosa",
                        description = "Shortest species")) +
  geom_mark_ellipse(aes(fill = Species,
                        filter = Species == "versicolor",
                        label = "Iris versicolor",
                        description = "Moderate species")) +
  geom_mark_ellipse(aes(fill = Species,
                        filter = Species == "virginica",
                        label = "Iris virginica",
                        description = "Largest species")) +
  theme_classic() +                      # Having publication ready background.
  geom_smooth() # Adding smooth line around 95% level on the plot.

separate_smooth # Generates the plot output of the dataset 

# In the above plot, having color within the aes() breakes the data into 
# species-wise groups. Meaning each species group will be smoothed separately.

uniform_smooth <- ggplot(data = iris,
                         mapping = aes(x = Sepal.Length,
                                       y = Petal.Width)) + # Note no color here.
  geom_point() +
  labs(x = "Petal length (cm)",
       y = "Petal width (cm)") +
  geom_mark_ellipse(aes(fill = Species,
                        filter = Species == "setosa",
                        label = "Iris setosa",
                        description = "Shortest species")) +
  geom_mark_ellipse(aes(fill = Species,
                        filter = Species == "versicolor",
                        label = "Iris versicolor",
                        description = "Medium species")) +
  geom_mark_ellipse(aes(fill = Species,
                        filter = Species == "virginica",
                        label = "Iris virginica",
                        description = "Tallest species")) +
  theme_classic() +
  geom_smooth()

uniform_smooth # This is looking cool!

# Avoiding the color parameter in the aes() ensures all species are considered
# together in the subsequent layers arguments. No grouping by species.

# Patchwork package allows for addition of two plots by their object names.
# The addition is so simple, just relying on the plus (+) operator.

combined_plots <- separate_smooth + uniform_smooth # Adding plots.

combined_plots # Even cooler than I thought!
# Now I want to give the plots title and tags or labels to identify them

combined_plots_labeled <- combined_plots +
  plot_annotation(
    title = "Relationships among dimensions of the three iris species", # Title of both plots.
    tag_levels = "A" # Indicates that the plots will be labelled A, B, C etc.
  ) # This makes the first plot to be A and the next to be B. Checking on 
# documentation will help know more arguments in this function.

# Now I want to remove the legends since the species labels are visible

combined_plots_labeled_no_legend <- combined_plots_labeled &
  theme(legend.position = "none") # Removes legends from the plots. I do not 
# need the legends since the species are labeled in the plots.

combined_plots_labeled_no_legend # This will print out the final product.

# Showing that in ggplot2 we can use & instead of plus (+)
attach(iris)

ggplot(data = iris, mapping = aes(x = Sepal.Length, y = Petal.Width)) +
  geom_point() +
  theme_classic()
head(iris)

# I think it has taken me a long time to know this.
# I used ggplot2:: so that I can be sure that the & is supported by ggplot2 and 
# not any other loaded packages such ggforce and patchwork.

ggplot(data = diamonds) + # Feeding in the diamonds data for the plot.
  geom_bar(mapping = aes(x = cut, fill = cut), show.legend = FALSE, width = 1) +
  theme(aspect.ratio = 1) +
  labs(x = NULL, y = NULL) +
  coord_polar() # coord_flip() can also work well with the data depending on need.
  
# Cool/crazy plot with modelr package.

library(modelr)
options(na.action = na.warn)

ggplot(data = sim1, mapping = aes(x = x, y = y)) +
  geom_point() # There is some visible correlation between the variables

models <- tibble( # Creating some random tibble data-set for plotting.
  a1 = runif(250, -20, 40), # Generates 250 random numbers between -20 and 40
  a2 = runif(250, -5, 5) # Generates 250 random numbers between -5 and 5
)

ggplot(data = sim1, mapping = aes(x = x, y =y)) +
  geom_abline(mapping = aes(intercept = a1, slope = a2),
              data = models, alpha = 1/4) +
  geom_point(col = 'purple', pch = 18, size = 5) +
  labs(x = 'The x-axis', y = 'The y-axis', title = 'Crazy model in deed') +
  theme_classic()
rm(list = ls())
