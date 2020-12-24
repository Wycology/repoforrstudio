# IRIS PLOT ----

# I will use three packages

# install.packages("patchwork")
# install.packages("ggforce")
# install.packages("ggplot2")

# Let me load the packages using library() function.

library(patchwork)
library(ggforce)
library(ggplot2)

str(iris) # Checking the structure of the dataset. Returned in Console.

plot(iris$Sepal.Length, iris$Petal.Width) # Basic plot within the R base.

# Creating the first plot of the iris data.

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
                        description = "Medium species")) +
  geom_mark_ellipse(aes(fill = Species,
                        filter = Species == "virginica",
                        label = "Iiris virginica",
                        description = "Tallest species")) +
  theme_classic() +                      # Having publication ready background.
  geom_smooth()                          # Adding smooth line around 95% level.

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

# Avoiding the color parameter in the aes() ensures all species are considered
# together in the subsequent layers arguments. No grouping by species.

# Patchwork package allows for addition of two plots by their object names.
# The addition is so simple, just relying on the plus (+) operator.

combined_plots <- separate_smooth + uniform_smooth # Adding plots.

# Now I want to give the plots title and tags or labels to identify them

combined_plots_labeled <- combined_plots +
  plot_annotation(
    title = "Dimensions of three iris species", # Title of both plots.
    tag_levels = "A" # Indicates that the plots will be labelled A, B, C etc.
  ) # This makes the first plot to be A and the next to be B. Checking on 
# documentation will help know more arguments in this function.

# Now I want to remove the legends since the species labels are visible

combined_plots_labeled_no_legend <- combined_plots_labeled &
  theme(legend.position = "none") # Removes legends from the plots.

combined_plots_labeled_no_legend # This will print out the final product.

# Showing that in ggplot2 we can use & instead of plus (+)
library(ggplot2)
attach(iris)

ggplot(data = iris, mapping = aes(x = Sepal.Length, y = Petal.Width)) +
  geom_point() +
  theme_classic()
head(iris)

# I think it has taken me a long time to know this.
# I used ggplot2:: so that I can be sure that the & is supported by ggplot2 and 
# not any other loaded packages such ggforce and patchwork.

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = cut), show.legend = FALSE, width = 1) +
  theme(aspect.ratio = 1) +
  labs(x = NULL, y = NULL) +
  coord_polar() # coord_flip() can also work well with the data depending on need.
  
