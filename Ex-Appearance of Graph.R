library(ggplot2)
attach(mtcars)
mdata <- mtcars
mdata$Transmission <- factor(am, labels = c("manual", "auto"))
p <- ggplot(mdata, aes(x=wt, y=mpg, colour = Transmission)) + geom_point()
p + theme_bw() + theme(legend.position="top", plot.title = element_text(hjust = 0.5)) + 
  ggtitle("Mill per gallon vs weight of car")
