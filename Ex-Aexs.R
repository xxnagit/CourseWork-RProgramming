attach(mtcars)
mdata <- mtcars
mdata$am <- factor(mdata$am, labels = c("Automatic", "Manual"))
p <- ggplot(mdata, aes(x = am, y = mpg, colour = am )) + geom_boxplot() + coord_flip()
p + xlab("Transmission Type") + ylab("Miles per Gallon") + expand_limits(y=c(0,30)) +
  theme(axis.title.y = element_text(colour = "blue"),
                                      axis.text.y = element_text(colour = "blue"),
                                      legend.position = "none") 