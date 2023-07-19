attach(mtcars)
head(mtcars,15)
library(ggplot2)
ggplot(mtcars, aes(x=mpg, y=..density..)) + geom_histogram(fill="cornsilk", colour="grey60") + 
  geom_density()
?mtcars
mdata <- mtcars
mdata$am <- factor(mdata$am, labels = c("Automatic Transmission", "Manual Transmission"))
ggplot(mdata, aes(x=mpg)) + geom_density() + facet_grid(am ~ .)+theme_grey(base_size = 26)
ggplot(mtcars, aes(x=factor(cyl), y=mpg)) + geom_boxplot()
p <- ggplot(mtcars, aes(x=factor(cyl), y=mpg))
p + geom_violin()


