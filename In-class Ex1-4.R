#Ex1
Id = c(1:10)
Age = c(14, 12, 15, 10, 23, 21, 41, 56, 78, 12)
Sex = c('F', 'M', 'M', 'F', 'M', 'F', 'M', 'M', 'F', 'M')
Code = letters[1:10]
df = data.frame(Id, Age, Sex, Code)
df
change <- function(dataframe_a, a, b) {
  
  temp <- dataframe_a$Code[a]
  dataframe_a$Code[a] <- dataframe_a$Code[b]
  dataframe_a$Code[b] <- temp
  return(dataframe_a)
}

df = change(df, 1, 3)
df = change(df, 7, 2)
df = change(df, 5, 10)
df
#Ex2
A = c(1:10)
B = seq(100, 10, -10)
H = seq(-200, -50, along.with = B)
df = data.frame(A, B, H)
df
NEWDF <- function(dfInput, x, y) {
  data <- c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
  for (i in 1:10) {
    data[i] = sum(x*dfInput[1:i,1]) + sum(y*dfInput[1:i,2])
  }
  dfInput <- cbind(dfInput, data)
  colnames(dfInput)[4] <- paste("SUM",x,y, sep = "_")
  return(dfInput)
}
NEWDF(df, 3, 6)
NEWDF(df, 7, 5)
#Ex3
v = c(2, 4, 1, 7, 3, 2, 7, 9)
FUNVector1 <- function(vectorInput) {
  vec <- sort(vectorInput)
  vec <- vec*2
  return (vec)
}
FUNVector1(v)
#Ex4
a = c('a', 'v', 4, 7, 'q')

FUNVector2 <- function(vectorInput) {

  a <- gsub("[^[:digit:]]","",vectorInput)
  a <- as.numeric(a)
  a <- a[!is.na(a)]
  out <- FUNVector1(a)
  return(out)
}

a = FUNVector2(a)

a
b = c(LETTERS[1:23], 10:1, LETTERS[24:26], 11:22)
b = FUNVector2(b)
b
#Another slower way

# FUNVector2 <- function (vectorInput) {
#   len <- length(vectorInput)
#   for (i in 1:len) {
#     if ((vectorInput[i] >= "a" && vectorInput[i] <= "z") || (vectorInput[i] >= "A" && vectorInput[i] <= "Z")) {
#       vectorInput[i] = NA
#     }
#   }
#   v <- as.numeric(vectorInput)
#   out <- FUNVector1(v)
#   return(out)
#}
