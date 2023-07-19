x <- matrix(c(1, 2, 3, 2, 3, 4), nrow = 3)
x[x[,2] >= 3,]
copymaj <- function(rw,d) {
  maj <- sum(rw[1:d]) / d
  return(if(maj >0.5) 1
         else 0)
}
