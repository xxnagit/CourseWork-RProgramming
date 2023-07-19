attach(iris)
library(corrplot)
irisCor <- cor(iris[,-5])
corrplot(irisCor, method="shade", shade.col=NA, tl.col="blue", tl.srt=45,type = "up",
         addCoef.col="black", order="hclust")
