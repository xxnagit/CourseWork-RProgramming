attach(mtcars)
head(mtcars,15)
library(ggplot2)
#ggplot(mtcars, aes(x=hp, y=mpg, color=wt, size =cyl)) + geom_point(alpha=0.8)
md <- mtcars
md$cylG <- cut(md$cyl, breaks = c(1,4, 6, 8, Inf), labes = c("1-4","5-6", "7-8", ">=9"))
ggplot(md, aes(x=hp, y=mpg, shape=cylG, fill=wt)) + geom_point(size=2.5) +
  scale_shape_manual(values=c(21,22,23,24,25)) + 
  stat_smooth(method=lm, level=0.98)

