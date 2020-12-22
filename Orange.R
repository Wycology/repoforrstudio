#### I am working on this to demonstrate the power of R in plotting ####

#############################
# Wyclife Agumba Oluoch     #
# wyclifeoluoch@gmail.com   #
#############################

library(tidyverse)

data("Orange")     # Loading the inbuilt Orange data
# The dataset is about circumference and ages of several orange plants

head(Orange)       # First 6 rows of the dataframe
# This is revealing the measurements of the first six individuals of orange.

Orange %>% # Picking the right dataset, and then.
        select(age) %>% # Selecting one of the columns, and then
        nrow() # Returning number of rows in the selected column.

Orangelm <- lm(circumference ~ age, data = Orange) # Regression model for orange
summary(Orangelm) # Details of the regression model.

plot(Orange$circumference ~ Orange$age, 
     col = "purple",
     pch = 19,
     cex = 2,
     xlab = "Age (days)",
     ylab = "Circumference (mm)",
     main = "Relationship between age and cricumference of oranges")
abline(Orangelm, lwd = 3, lty = "dashed", col = "cyan") # Adding the lm as abline
text(300, 200, "R^2 = 0.8345\nP<0.0001\ny = 17.4 + 0.107x")
# Annotating text on the graph.
# \n indicates line break to shift the next component to next line.

# Checking the largest tree circumference
Orange %>% # Picking teh dataset, and then.
        select(circumference) %>% # Selecting the right column, and then.
        max() # Returning the maximum value in the circumference column. 

# Checking the oldest orange tree

Orange %>% # Picks the dataset, and then.
        select(age) %>%  # Picks the age column to work with.
        max()/365 # Divides the maximum age by 365 to convert days to years.
        

library(tidyverse)
head(diamonds)
diamonds %>% 
        mutate(color2 = case_when(price > 400 ~ "High",
                                  price < 400 ~ "Moderate",
                                  TRUE ~ "Low")) %>% 
        head()

library(gapminder)
library(tidyverse)

start_time <- Sys.time()
head(gapminder)
gapminder %>% 
        select(country, year, pop) %>% 
        filter(country == "Kenya") %>% 
        head(4)

end_time <- Sys.time()

duration2 <- round(end_time - start_time, 2)

ggplot(data = gapminder, aes(pop)) +
        geom_histogram()

ggplot(data = gapminder, aes(log(pop))) +
        geom_histogram(col = "cyan", fill = "purple") # Histogram generation.

ggplot(data = gapminder, aes(x = continent, 
                             y = lifeExp, 
                             fill  = continent)) + # Generating boxplot.
        geom_boxplot()

# Working with ggstatsplot ----

install.packages("ggstatsplot") # This will install the package into R.

library(ggstatsplot) # This is loading the package to avail its functions.
library(ggplot2) # This is rendering the functions in ggplot2 package available.

ggbetweenstats(
        data = movies_long, # Picks the dataset to be plotted.
        x = mpaa, # States the variable on the x-axis (factors)
        y = rating # States the y-axis variable (response variable)
)

# Going a step further with the same data:

ggbetweenstats(
        data = movies_long,
        x = mpaa,
        y = rating,
        type = 'np', # Can also be "p", "r" or "bf"
        pairwise.display = 'all', # Can also set to "ns" or "s"
        p.adjust.method = 'fdr'
)
