# Parametric and Non-parametric t-tests in r
# Created on 31st March 2021
# Last modified 24th July 2021

# Creating the data-set 

Male <- data.frame(Gender = rep('Male', 10),
                   abundance = sample(x = 7:40, size = 10, replace = TRUE))
Female <- data.frame(Gender = rep('Female', 10),
                   abundance = sample(x = 7:40, size = 10, replace = TRUE))

bee.data <- rbind(Male, Female) # combining the two data-sets

head(bee.data) # Checking the head
tail(bee.data)

# Normality check

qqnorm(bee.data$abundance)
qqline(bee.data$abundance)

# Normality check using shapiro test
shapiro.test(bee.data$abundance)

# p<a hence we reject the null hypothesis and conclude that the data 
# is no-parametric

# Normality check using Anderson-Darling test
library(nortest) # for running pearson test among other functionalities         

ad.test(bee.data$abundance)
# p>a hence we fail to reject the null hypothesis and conclude that the data 
# is parametric

# Test for equal variance using levene's test
library(car)

leveneTest(bee.data$abundance ~ bee.data$Gender) 

# p>a hence we fail to reject the null hypothesis and conclude that the data 
# have equal variance

# Parametric t-test with equal variance

t.test(abundance ~ Gender,
       data = bee.data,
       alternative = 'two.sided',
       paired = F,
       var.equal = T)

# Non-parametric t-test with equal variance
wilcox.test(abundance ~ Gender,
       data = bee.data,
       alternative = 'two.sided',
       paired = F,
       var.equal = T)
# This is normally used when the data is non parametric, i.e. p<a in case of 
# shapiro.test or ad.test results.

library(mapsf)
library(mapview)
mtq <- mf_get_mtq()
mf_shadow(mtq)
mapview(mf_map(mtq, type = 'choro', var = 'CHOM', add = TRUE))
mapview(mf_shadow(mtq)) + mapview(mf_map(mtq))
#Done