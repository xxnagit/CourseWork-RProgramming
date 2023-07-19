setwd("/Users/machikara/Desktop/Application_2017fall/UALR_Courses/IFSC\ 5399/R_Projects")
predb <- function(x,k) {
  n <- length(x)
  k2 <- k/2
  pred <- vector(length=n-k)
  sm <- sum(x[1:k])
  if (sm >= k2) pred[1] <- 1 else pred[1] <- 0
  if (n-k>=2){
    for (i in 2:(n-k)) {
      #we are updating sm, by subtracting the oldest
      #element making up the sum (x[i-1]) and adding
      #the new one (x[i+k-1]).
      sm <- sm + x[i+k-1] - x[i-1]
      if (sm >= k2) pred[i] <- 1 else pred[i] <- 0
    }
  }
  return(mean(abs(pred-x[(k+1):n])))
}
data <- read.delim("weather_data.txt")
data_m <- as.vector(data[,1])
ptm <- proc.time()
pred <- predb(data_m, 1)
pred_k <- 3
n = 30
k_value <- c(1:n)
error_rate <- vector(length=n)
temp <- cbind(k_value,error_rate)
for(k in 1:n) {
  temp[k,2] <- predb(data_m, k)
  if(temp[k,2] < pred) {
    pred_k <- k
    pred <- temp[k,2]
  }
}
proc.time() - ptm

cat(paste0("The best prediction for k in 1:",n," is k = ",pred_k,"\n", "with pred error = ",pred))
library(ggplot2)
temp <- data.frame(temp)
ggplot(temp, aes(x=k_value, y=error_rate)) + geom_line() + geom_point()
