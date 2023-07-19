library(gcookbook) # For the data set
?heightweight
library(ggplot2)
str(heightweight)
ggplot (heightweight, aes(x=ageYear, y=heightIn)) + geom_point(shape=21)
ggplot(heightweight, aes(x=ageYear, y=heightIn, colour=sex)) + geom_point()
hw <- heightweight
# Categorize into <100 and >=100 groups
hw$weightGroup <- cut(hw$weightLb, breaks=c(-Inf, 100, Inf),
                      labels=c("< 100", ">= 100"))
head (hw)
?faithful
ggplot(faithful, aes(x=waiting)) + geom_histogram()
ggplot(faithful, aes(x=waiting, y=..density..)) + 
  geom_histogram(fill="cornsilk", colour="grey60") + geom_density() + xlim(35, 105)
library(MASS)
# Make a copy of the data
birthwt1 <- birthwt
# Convert smoke to a factor
birthwt1$smoke <- factor(birthwt1$smoke)
birthwt1$smoke = factor (birthwt1$smoke, labels = c("No Smoke","Smoke"))
ggplot(birthwt1, aes(x=bwt, fill=smoke)) + geom_density(alpha=.3)
ggplot(birthwt1, aes(x=bwt)) + geom_density() + facet_grid(smoke ~ .) + 
  theme_grey(base_size = 26)
library(gcookbook) # For the data set
p <- ggplot(heightweight, aes(x=sex, y=heightIn)) # Base plot
p + geom_violin()
p + geom_violin() + geom_boxplot(width=.1, fill="black", outlier.colour=NA) + 
  stat_summary(fun.y=median, geom="point",fill="white", shape=21, size=2.5)
install.packages("mritc")
??mritc
library(ggplot2)
library(gcookbook)
p <- ggplot(heightweight, aes(x=ageYear, y=heightIn)) + geom_point()
p + ggtitle("Age and Height\nof School children")
p + geom_text(aes(label=weightLb), size=4,
              family="Times", colour="red")
p <- ggplot(heightweight, aes(x=ageYear, y=heightIn, colour = sex)) + geom_point()
p + theme(
  panel.grid.major = element_line(colour="red"),
  panel.grid.minor = element_line(colour="red", linetype="dashed",size=0.2),
  panel.background = element_rect(fill="lightblue"),
  panel.border = element_rect(colour="blue", fill=NA, size=2))
p + ggtitle("Plot title here") +
  theme(axis.title.x = element_text(colour="green", size=14),
        axis.text.x = element_text(colour="blue"),
        axis.title.y = element_text(colour="red", size=14, angle = 90),
        axis.text.y = element_text(colour="yellow"),
        plot.title = element_text(colour="purple", size=20, face="bold"))
p + facet_grid(sex ~ .) + theme(
  strip.background = element_rect(fill="pink"),
  strip.text.y = element_text(size=14, angle=-90, face="bold"))
# strip.text.x is the same, but for horizontal facets
attach(PlantGrowth)
p <- ggplot(PlantGrowth, aes(x=group, y=weight)) + geom_boxplot()
p + ylim(0, max(PlantGrowth$weight))
p + scale_x_discrete(limits=c("ctrl","trt1"))
sp <- ggplot(marathon, aes(x = Half, y = Full)) +geom_point()
sp + coord_fixed()
install.packages("corrplot")
library(corrplot)
mcor <- cor(mtcars)
# Print mcor and round to 2 digits
round(mcor, digits=2)
corrplot(mcor)
corrplot(mcor, method="shade", shade.col=NA, tl.col="black", tl.srt=45)
corrplot(mcor, method="shade", shade.col=NA, tl.col="black", tl.srt=45, addCoef.col="
black", addcolorlabel="no", order="AOE")
install.packages("igraph")
library(igraph)
library(igraph)
library(gcookbook)
str(countries)
c2 <- subset(countries, Year==2009)
c2 <- c2[complete.cases(c2), ]
set.seed(201)
c2 <- c2[sample(1:nrow(c2), 25), ]
rownames(c2) <- c2$Name
c2 <- c2[,4:7]
c3 <- scale(c2)
hc <- hclust(dist(c3))
plot(hc)
plot(hc, hang = -1)





