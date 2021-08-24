#########################################
# Name: Wyclife Agumba Oluoch           #   
# E-mail: wyclifeoluoch@gmail.com       #
# GitHub: https://github.com/Wycology   #
# Task: Boxplot and violin plots in one #
# Date: 4th Jan 2021                    #
# Last edited: 24th Aug 2021            #
#########################################

# Loading the necessary libraries for the project

base::library(tidyverse) # This is for data wrangling and plotting.
base::library(RColorBrewer) # This is for generating color pallets for the plots.

diamonds_df <- diamonds # Saving the diamonds data-set to a new object in R.

utils::head(diamonds) # Checking the variables in the data-set for subsequent analyses
base::nrow(diamonds) # Checking for the number of rows in the data. 53940 observations
base::ncol(diamonds) # Checking the number of variables in the data-set. 10 variables

diamonds_df %>% # Picking the diamonds data, and then
  dplyr::slice_sample(n = 0.2*(nrow(diamonds))) %>% # Picking a portion of the data-set
  ggplot2::ggplot(ggplot2::aes(x = cut, y = price, color = cut)) + # Adding the mapping variables
  ggplot2::geom_point(position = "jitter", alpha = 0.2) + # Adding jitter and alpha
  ggplot2::geom_boxplot(alpha = 0.1, width = 0.5) + # Modifying dimensions of the boxplot 
  ggplot2::geom_violin(alpha = 0.5) + # Adding violin plot on top of the box and jitter
  ggplot2::theme_classic() + # Adding my preferred theme for publication.
  ggplot2::theme(legend.position = "none") + # Removing the legend; it is on the x-axis
  ggplot2::labs(x = "Diamond cut", # Labels the x-axis.
       y = "Diamonds price (USD)", # Labeling the y-axis
       title = "Diamond cut against price", # Setting tibble of the plot
       subtitle = "Preview of diamond cut versus price", # Descriptive title beneath TITLE
       caption = "Data source: gglot2 package's diamond data") +
  ggplot2::theme(axis.text = ggplot2::element_text(size=16), # Size of labels on tick-marks
        axis.title = ggplot2::element_text(size=16,face="bold")) + # Size of axis labels
  ggplot2::theme(plot.title = ggplot2::element_text(color = 'red', size = 18, face = 'bold'),
        plot.subtitle = ggplot2::element_text(color = 'purple', size = 14, face = 'italic'),
        plot.caption = ggplot2::element_text(color = 'blue', face = 'italic'))

diamonds %>% # Picking the diamonds data, and then
  dplyr::filter(cut == 'Very Good') %>% # Picking the very good cut 
  base::nrow() # counting the number of rows with very good cut

diamonds %>% 
  dplyr::select(cut) %>% 
  base::table() %>% 
  graphics::barplot(col = c('green', 'red', 'blue', 'yellow', 'purple'))

# Instead of specifying the colors, we can simply use the color brewer panel 

diamonds %>% 
  dplyr::select(cut) %>% 
  base::table() %>% 
  graphics::barplot(col = RColorBrewer::brewer.pal(n = 5, name = "RdBu"))
# To display more brewer colors options to use, run the following function:

RColorBrewer::display.brewer.all()

# Can also use rainbow colors

diamonds %>% 
  dplyr::select(cut) %>% 
  base::table() %>% 
  graphics::barplot(col = grDevices::rainbow(5))

# Can also use heat.colors
diamonds %>% 
  dplyr::select(cut) %>% 
  base::table() %>% 
  graphics::barplot(col = grDevices::heat.colors(5))

# Can also use topographic colors

diamonds %>% 
  dplyr::select(cut) %>% 
  base::table() %>% 
  graphics::barplot(col = grDevices::topo.colors(5))

# Can also use terrain colors for the plot
diamonds %>% 
  dplyr::select(cut) %>% 
  base::table() %>% 
  graphics::barplot(col = grDevices::terrain.colors(5))

# Can also use cm.colors
diamonds %>% 
  dplyr::select(cut) %>% 
  base::table() %>% 
  graphics::barplot(col = grDevices::cm.colors(5)) 

# That is awesome. Good for the day.
