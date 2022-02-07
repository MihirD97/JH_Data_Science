## Assignment C2 Week 3

##Quiz 


#Load Iris dataset

library(datasets)
data(iris)
?iris
head(iris)
vir_mean <- mean(iris[iris$Species == 'virginica',]$Sepal.Length)

apply(iris[, 1:4], 2, mean)

# Load mtcars
library(datasets)
data(mtcars)

head(mtcars)

mean(mtcars[mtcars$cyl == 4,]$hp) - mean(mtcars[mtcars$cyl == 8,]$hp)

debug(ls)
ls()
