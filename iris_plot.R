# IRIS PLOT ----

# One of the beautiful plots I created using a range of packages

# I will use three packages

# install.packages("patchwork")
# install.packages("ggforce")
# install.packages("ggplot2")

# Let me load the packages using library() function.

library(patchwork)
library(ggforce)
library(ggplot2)

str(iris)

plot(iris$Sepal.Length, iris$Petal.Width)

separate_smooth <- ggplot(data = iris,
       mapping = aes(x = Sepal.Length,
                     y = Petal.Width,
                     color = Species)) +
  geom_point() +
  labs(x = "Petal length (cm)",
       y = "Sepal width (cm)") +
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
                        label = "Iiris virginica",
                        description = "Tallest species")) +
  theme_classic() +
  geom_smooth()

uniform_smooth <- ggplot(data = iris,
                         mapping = aes(x = Sepal.Length,
                                       y = Petal.Width)) +
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

combined_plots <- separate_smooth + uniform_smooth

# Now I want to give the plots title and tags or labels to identify them

combined_plots_labeled <- combined_plots +
  plot_annotation(
    title = "Dimensions of three iris species",
    tag_levels = "A"
  ) # This makes the first plot to be a and the next to be b

# Now I want to remove the legends since the species labels are visible

combined_plots_labeled_no_legend <- combined_plots_labeled &
  theme(legend.position = "none")

combined_plots_labeled_no_legend # This will print out the final product.
