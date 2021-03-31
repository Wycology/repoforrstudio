# Parametric and Non-parametric t-tests in r
# Created on 31st March 2021

# Creating the dataset

Male <- data.frame(Gender = rep('Male', 10),
                   abundance = c(35, 40, 28, 38, 30, 35, 45, 20, 7, 17))
Female <- data.frame(Gender = rep('Female', 10),
                   abundance = c(60, 20, 37, 19, 15, 4, 28, 18, 3, 35))

bee.data <- rbind(Male, Female)

head(bee.data)
tail(bee.data)

# Normality check

qqnorm(bee.data$abundance)
qqline(bee.data$abundance)

# Normality check using shapiro test
shapiro.test(bee.data$abundance)
# p>a hence we fail to reject the null hypothesis and conclude that the data 
# is parametric

# Normality check using Anderson-Darling test
library(nortest)

ad.test(bee.data$abundance)
# p>a hence we fail to reject the null hypothesis and conclude that the data 
# is parametric

# Test for equal variance using levene's test
library(car)

leveneTest(bee.data$abundance ~ bee.data$Gender)
# p>a hence we fail to reject the null hypothesis and conclude that the data 
# is parametric
