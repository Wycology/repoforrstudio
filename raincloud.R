# 30th June 2021
# Last Modified 24th July 2021

# Revealing better information about data which may be hidden by boxplots

base::library(tidyverse)  # For wrangling the data and plotting 
library(ggdist)     # For adding the stat_halfeye and stat_dots functionalities
library(ggtext)     # For making annotation on the plot
library(gapminder)  # For getting the data to plot
library(glue)       # For handling the text labels on the plot

annotation <- base::data.frame(x = 4.5, y = 35, label = c(glue::glue(
  "The data is from the <br> gapminder package<br> which you can easily install")))

gapminder |>
  dplyr::select(continent, lifeExp) |>     
  ggplot2::ggplot(aes(continent, lifeExp)) +   
  ggdist::stat_halfeye(adjust = .5, width = .6, .width = 0, justification = -.2,
               point_color = NA, ggplot2::aes(fill = continent)) +
  ggplot2::geom_boxplot(width = .12, outlier.shape = NA) +
  ggdist::stat_dots(side = 'left', justification = 1.1, binwidth = 0.5, ggplot2::aes(col = continent)) +
  ggtext::geom_richtext(data = annotation, ggplot2::aes(x = x, y = y, label = label), color = 'orange',
                size = 7, angle = 0, fontface = 'bold') +
  ggplot2::labs(title = 'Distribution of life expectancy across continents', subtitle = 'Between 1952 and 2007',
    caption = base::paste0('Source: Data from gapminder, Version ', utils::packageVersion('gapminder')
    ), x = 'Continent', y = 'Life expectancy (years)') +
  ggplot2::coord_cartesian(xlim = c(0.6, NA)) +  
  ggplot2::theme_classic() +
  ggplot2::theme(legend.position = 'none',
        text = ggplot2::element_text(size = 20)) 