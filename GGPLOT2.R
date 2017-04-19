install.packages("ggplot2")
library("ggplot2")
attach(iris)
##First 6 rows
head(iris)
## How to set number of rows to display
head(iris, n=10)
#Plot Sepal length vs Petal Length
qplot(Sepal.Length, Petal.Length, data = iris)
##Add color to the basic plot
qplot(Sepal.Length, Petal.Length, data = iris, color = Species)
##Add petal width variability
qplot(Sepal.Length, Petal.Length, data = iris, color = Species, size = Petal.Width)
##Add an alpha value in order to reduce to the effects of overplotting
qplot(Sepal.Length, Petal.Length, data = iris, color = Species, size = Petal.Width, alpha = I(0.7))
##Add title and axis labels
qplot(Sepal.Length, Petal.Length, data = iris, color = Species, xlab = "Sepal Length", ylab = "Petal Length",
      main = "Sepal vs. Petal Length in Fisher's Iris data")