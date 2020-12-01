data("iris")
# Drawing regression line on a plot

teg <-  lm(Sepal.Length ~ Petal.Width, data = iris)
plot(iris$Sepal.Length ~ iris$Petal.Width)
abline(teg, 
       col = "blue", 
       lwd = 3, 
       lty = "dashed",
       v = 1.5,
       h = 7.3)

