attach(iris)
library("ggplot2")
ggplot(iris, aes(x=Sepal.Width, y=Petal.Width, color=Species)) + geom_line() + geom_point()