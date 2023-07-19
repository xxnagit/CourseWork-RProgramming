attach(iris)
head(iris,5)
library(class)
irisTrain <- iris[1:33,]
irisTrain <- rbind(irisTrain, iris[51:84,])
irisTrain <- rbind(irisTrain, iris[101:133,])
irisTest <- iris[34:50,]
irisTest <- rbind(irisTest, iris[85:100,])
irisTest <- rbind(irisTest, iris[134:150,])
irisTrain_labels <- irisTrain[,5]
irisTest_labels <- irisTest[,5]
irisTrain <- irisTrain[,-5]
irisTest <- irisTest[,-5]
irisTest_pred <- knn(irisTrain, irisTest, irisTrain_labels, k=11)
table(irisTest_pred, true = irisTest_labels)
accuracy <- sum(irisTest_pred == irisTest_labels)/nrow (irisTest)
accuracy = signif(accuracy,2)
accuracy