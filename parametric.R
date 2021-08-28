# Parametric and Non-parametric t-tests in r
# Created on 31st March 2021
# Last modified 28th Aug 2021

# Creating the data-set 

Male <- base::data.frame(Gender = base::rep('Male', 10),
                   abundance = base::sample(x = 7:40, size = 10, replace = TRUE))
Female <- base::data.frame(Gender = base::rep('Female', 10),
                   abundance = base::sample(x = 7:40, size = 10, replace = TRUE))

bee.data <- base::rbind(Male, Female) # combining the two data-sets

utils::head(bee.data) # Checking the head
utils::tail(bee.data)

# Normality check

stats::qqnorm(bee.data$abundance)
stats::qqline(bee.data$abundance)

# Normality check using shapiro test
stats::shapiro.test(bee.data$abundance)

# p<a hence we reject the null hypothesis and conclude that the data 
# is no-parametric

# Normality check using Anderson-Darling test
base::library(nortest) # for running pearson test among other functionalities         

nortest::ad.test(bee.data$abundance)
# p>a hence we fail to reject the null hypothesis and conclude that the data 
# is parametric

# Test for equal variance using levene's test
base::library(car)

car::leveneTest(bee.data$abundance ~ bee.data$Gender) 

# p>a hence we fail to reject the null hypothesis and conclude that the data 
# have equal variance

# Parametric t-test with equal variance

stats::t.test(abundance ~ Gender,
       data = bee.data,
       alternative = 'two.sided',
       paired = F,
       var.equal = T)

# Non-parametric t-test with equal variance
stats::wilcox.test(abundance ~ Gender,
       data = bee.data,
       alternative = 'two.sided',
       paired = F,
       var.equal = T)
# This is normally used when the data is non parametric, i.e. p<a in case of 
# shapiro.test or ad.test results.

base::library(mapsf)
base::library(mapview)
mtq <- mapsf::mf_get_mtq()
mapsf::mf_shadow(mtq)
mapview::mapview(mapsf::mf_map(mtq, type = 'choro', breaks = 'quantile', nbreaks = 5, var = 'MED', add = TRUE))
mapview::mapview(mapsf::mf_shadow(mtq)) + mapview::mapview(mapsf::mf_map(mtq))
#Done