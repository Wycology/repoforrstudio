#########################################
# Name: Wyclife Agumba Oluoch           #   
# E-mail: wyclifeoluoch@gmail.com       #
# GitHub: https://github.com/Wycology   #
# Task: Boxplot and violin plots in one #
# Date: 4th Jan 2021                    #
# Last edited: 20th Mar 2021            #
#########################################

# Loading the necessary libraries for the project
library(tidyverse) # This is for data wrangling and plotting
library(RColorBrewer) # This is for generating color pallets for the plots.

diamonds_df <- diamonds # Saving the diamonds data to a new object in R.

head(diamonds) # Checking the variables in the data-set for subsequent analyses
nrow(diamonds) # Checking for the number of rows in the data. 53940 observations
ncol(diamonds) # Checking the number of variables in the data-set. 10 variables

diamonds_df %>% # Picking the diamonds data object, and then
  slice_sample(n = 0.2*(nrow(diamonds))) %>% # Picking a portion of the data-set
  ggplot(aes(x = cut, y = price, color = cut)) + # Adding the mapping variables
  geom_point(position = "jitter", alpha = 0.2) + # Adding jitter and alpha
  geom_boxplot(alpha = 0.1, width = 0.5) + # Modifying dimensions of the boxplot 
  geom_violin(alpha = 0.5) + # Adding violin plot on top of the box and jitter
  theme_classic() + # Adding my preferred theme for publication.
  theme(legend.position = "none") + # Removing the legend; it is on the x-axis
  labs(x = "Diamond cut", # Labels the x-axis.
       y = "Diamonds price (USD)", # Labeling the y-axis
       title = "Diamond cut against price", # Setting tibble of the plot
       subtitle = "Preview of diamond cut versus price", # Descriptive title beneath TITLE
       caption = "Data source: gglot2 package's diamond data") +
  theme(axis.text = element_text(size=16), # Size of labels on tick-marks
        axis.title = element_text(size=16,face="bold")) + # Size of axis labels
  theme(plot.title = element_text(color = 'red', size = 18, face = 'bold'),
        plot.subtitle = element_text(color = 'purple', size = 14, face = 'italic'),
        plot.caption = element_text(color = 'blue', face = 'italic'))

diamonds %>% 
  filter(cut == 'Very Good') %>% 
  nrow()

diamonds %>% 
  select(cut) %>% 
  table() %>% 
  barplot(col = c('green', 'red', 'blue', 'yellow', 'purple'))

# Instead of specifying the colors, we can simply use the color brewer panel 

diamonds %>% 
  select(cut) %>% 
  table() %>% 
  barplot(col = brewer.pal(n = 5, name = "RdBu"))
# To display more brewer colors options to use, run the following function:

display.brewer.all()

# Can also use rainbow colors

diamonds %>% 
  select(cut) %>% 
  table() %>% 
  barplot(col = rainbow(5))

# Can also use heat.colors
diamonds %>% 
  select(cut) %>% 
  table() %>% 
  barplot(col = heat.colors(5))

# Can also use topographic colors

diamonds %>% 
  select(cut) %>% 
  table() %>% 
  barplot(col = topo.colors(5))

# Can also use terrain colors
diamonds %>% 
  select(cut) %>% 
  table() %>% 
  barplot(col = terrain.colors(5))

# Can also use cm.colors
diamonds %>% 
  select(cut) %>% 
  table() %>% 
  barplot(col = cm.colors(5))

?getData
# That is awesome. Good for the day.