data("iris")
# Drawing regression line on a plot

Reg <-  lm(Sepal.Length ~ Petal.Width, data = iris)
plot(iris$Sepal.Length ~ iris$Petal.Width, col = "red")
abline(Reg, 
       col = "blue", 
       lwd = 3, 
       lty = "dashed",
       v = 1.6,
       h = 7.3)
