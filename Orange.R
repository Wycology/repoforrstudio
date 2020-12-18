#### I am working on this to demonstrate the power of R in plotting ####

#############################
# Wyclife Agumba Oluoch     #
# wyclifeoluoch@gmail.com   #
#############################

data("Orange")     # Loading the inbuilt Orange data
head(Orange)       # First 6 rows of the dataframe
length(Orange$age) # Checking the length of the dataframe

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
max(Orange$circumference) # This gives a value of 214 mm. 

# Checking the oldest orange tree
max(Orange$age)/365 # This gives 1582 days. About 4.3 years. Dividing days by 365.


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
        geom_histogram(col = "cyan", fill = "purple")






