attach(mtcars)
datam <- mtcars[,1:6]
datam <- datam[,-2]
datam_sc <- scale(datam)
hc <- hclust(dist(datam_sc))
plot(hc, hang = -1)
