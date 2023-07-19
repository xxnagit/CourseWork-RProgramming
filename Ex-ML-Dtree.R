setwd("/Users/machikara/Desktop/Application_2017fall/UALR_Courses/IFSC\ 5399/R_Projects/")
credit <- read.csv("credit.csv")
str(credit)
table(credit$checking_balance)
set.seed (23456)
credit_rand <- credit[order(runif(1000)), ]
summary(credit$amount)
summary(credit_rand$amount)
credit_train <- credit_rand[1:900, 1:17]
credit_test <- credit_rand[901:1000, 1:17]
prop.table(table(credit_train$default))
prop.table(table(credit_test$default))
#install.packages("C50")
library(C50)
credit_train$default <- as.factor(credit_train$default)
credit_model <- C5.0(credit_train[,-17], credit_train$default)
credit_model
credit_pred <- predict(credit_model, credit_test)

trails = c(3:12)
errate = c(rep(0,10))
j = 1
for (i in trails) {
  credit_boost <- C5.0(credit_train[,-17], credit_train$default,trials = i)
  #summary(credit_boost10)
  pos1 <- gregexpr(pattern ='boost', credit_boost$output)[[1]][1]
  pos2 <- gregexpr(pattern ='<<', credit_boost$output)[[1]][1]
  text <- substr(credit_boost$output, pos1, pos2)
  cat(text)
  pos3 <- gregexpr(pattern ='\\(', text)
  pos4 <- gregexpr(pattern ='%', text)
  text <- substr(text, pos3, pos4)
  errate[j] <- gsub("[^0-9.]", "",  text)
  j = j + 1
}
errate <- as.numeric(errate)
index = which.min(errate)
trails[index]
cat("The best trail among", trails, "is trail=", trails[index], sep = " ")
credit_boost_index <- C5.0(credit_train[,-17], credit_train$default,trials = index)
credit_boost_pred_index <- predict(credit_boost_index, credit_test)
accuracy <- sum(credit_boost_pred_index == credit_test$default)/nrow (credit_test)
accuracy
errors = 1-signif(accuracy , 2)
errors
cat ("The error rate on the test data using boost is ", errors*
       100, "%", sep="")
table(predict = credit_boost_pred_index, true = credit_test$default)
sensitivity <- sum(credit_boost_pred_index == credit_test$default & credit_test$default =="1") / 
  sum(credit_boost_pred_index == "1")
signif(sensitivity , 2)
procificity <- sum(credit_boost_pred_index == credit_test$default & credit_test$default =="2") /
  sum(credit_boost_pred_index == "2")
signif(procificity , 2)