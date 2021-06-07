# Revealing better information about data 
ggplot(iris, aes(Species, Sepal.Length)) + 
  ggdist::stat_halfeye(adjust = .5, 
                       width = .6, 
                       .width = 0, 
                       justification = -.2, 
                       point_color = NA, 
                       aes(fill = Species)) + 
  geom_boxplot(width = .12, 
               outlier.shape = NA) + 
  ggdist::stat_dots(side = 'left', 
                    justification = 1.1, 
                    binwidth = 0.05, 
                    aes(col = Species)) + 
  coord_cartesian(xlim = c(1., NA))