attach(mtcars)
library(ggplot2)
mdata <- mtcars
mdata$Gear <- factor(mdata$am, labels = c("Automatic", "Manual"))
mdata$Displacement <- mdata$disp
p <- ggplot(mdata, aes(x=mpg, y=qsec, size=Displacement,
                         colour=Gear)) + geom_point(alpha=.5)
p + xlab("Miles per Gallon") + ylab("1/4 mile time") + 
  expand_limits(x=c(0,30), y=c(14,24))
attach(iris)
idata <- iris
idata$Species <- factor(iris$Species)
p <- ggplot(idata, aes(x = Petal.Length, y = Petal.Width, 
                      colour = Species)) + geom_point() + facet_grid(.~Species, scales = "free")
p + stat_smooth() + 
   xlab("Petal Length") + ylab("Petal Width") +
  theme(strip.text = element_text(face="bold", color = "white"), 
        strip.background = element_rect(fill="purple")) 
library(grid)
p <- ggplot(idata, aes(x = Petal.Length, y = Petal.Width, 
                      shape = Species, colour = Species)) + geom_point() 
 
p + scale_shape_manual(values=c(15, 17, 16)) + ggtitle("Iris Species") +
  xlab("The length of petal\n(cm)") + ylab("The width of petal\n(cm)") +
  annotate("segment", x = 5.6, xend = 5.2, y = 1.3, yend = 1.55, 
           arrow = arrow( length=unit(0.3,"cm"))) + 
  theme(plot.title=element_text(hjust = 0.5))