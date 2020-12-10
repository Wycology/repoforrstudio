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
                        label = "Iiris virginica",
                        description = "Tallest species")) +
  theme_classic() +
  geom_smooth()

combined_plots <- separate_smooth + uniform_smooth












