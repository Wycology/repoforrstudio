# Revealing better information about data which may be hidden by boxplots

library(tidyverse)  # For wrangling the data and plotting 
library(ggdist)     # For adding the stat_halfeye and stat_dots functionalities
library(ggtext)     # For making annotation on the plot
library(gapminder)  # For getting the data to plot
library(glue)       # For handling the text labels on the plot

annotation <- data.frame(x = 4.5, y = 35, label = c(glue(
  "The data is from the <br> gapminder package<br> which you can easily install")))

gapminder |>
  select(continent, lifeExp) |>     
  ggplot(aes(continent, lifeExp)) +   
  stat_halfeye(adjust = .5, width = .6, .width = 0, justification = -.2,
               point_color = NA, aes(fill = continent)) +
  geom_boxplot(width = .12, outlier.shape = NA) +
  stat_dots(side = 'left', justification = 1.1, binwidth = 0.5, aes(col = continent)) +
  geom_richtext(data = annotation, aes(x = x, y = y, label = label), color = 'orange',
                size = 7, angle = 0, fontface = 'bold') +
  labs(title = 'Distribution of life expectancy across continents', subtitle = 'Between 1952 and 2007',
    caption = paste0('Source: Data from gapminder, Version ', packageVersion('gapminder')
    ), x = 'Continent', y = 'Life expectancy (years)') +
  coord_cartesian(xlim = c(0.6, NA)) +  
  theme_classic() +
  theme(legend.position = 'none',
        text = element_text(size = 20)) 