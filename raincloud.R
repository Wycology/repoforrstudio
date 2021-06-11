# Revealing better information about data which may be hidden by boxplots
library(ggplot2) # For plotting 
library(ggdist)  # For adding the stat_halfeye and stat_dots functions


iris |> 
  select(Species, Sepal.Length) |>       # Picking the two columns
  ggplot(aes(Species, Sepal.Length)) +   # Throwing them to aesthetics
  stat_halfeye(
    adjust = .5,
    width = .6,
    .width = 0,
    justification = -.2,
    point_color = NA,
    aes(fill = Species)
  ) +
  geom_boxplot(width = .12,
               outlier.shape = NA) +
  stat_dots(
    side = 'left',
    justification = 1.1,
    binwidth = 0.05,
    aes(col = Species)
  ) +
  coord_cartesian(xlim = c(1., NA))
