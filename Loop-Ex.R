#Loop-Ex1
student.df = data.frame( name = c("Sue", "Eva", "Henry", "Jan"),
                         sex = c("f", "f", "m", "m"),
                         years = c(21,31,29,19))
rows <- nrow(student.df)
male.teen <- c(rep(0, 4))

student.df <- data.frame(student.df, male.teen)

for (i in 1:rows) {
  if (student.df[i,2] == "m" && student.df[i,3] < 20) {
    student.df[i,4] ="T"
  } else {
    student.df[i,4] ="F"
  }
}

student.df

#student.df$male.teen <- ifelse(student.df$sex == "m" & student.df$years <20, "T", "F")

#Ex2
r <- c(rep(0,3))
for (j in 1:3) {
  r[j] <- rnorm(1,1,1)
}
for (i in 1:10) {
  print(r)
}

#Ex3
attach(mtcars)
#a
for (i in 1:nrow(mtcars)) {
  if (mtcars[i,3] >= 160) {
    print(mtcars[i,3])
  }
}
#b
for (i in 1:nrow(mtcars)) {
  if (mtcars[i,3] >= 160) {
    print(mtcars[i,3])
  }
  else {
    break;
  }
}
#Ex4
a <- c(3,7,NA, 9)
b <- c(2,NA,9,3)
f <- c(5,2,5,6)
d <- c(NA,3,4,NA)
mydf <- data.frame(a=a,b=b,f=f,d=d)
mydf <- data.frame(mydf, V5 = c(rep(0,4)))
for (i in 1:nrow(mydf)) {
  if(is.na(mydf[i,1])) {
    mydf[i,5] = mydf[i,2]
  } else if(is.na(mydf[i,2])) {
    mydf[i,5] = mydf[i,4]
  } else {
    mydf[i,5] = mydf[i,3]
  }
}

mydf
#Ex5

vec <- c(3, 9, 13, 19, 23, 29)
x = 0
while (x < 30) {
  x <- x + 1
  if (x %in% vec) {
    
  } else {
  print(x)
  }
}

#Ex6
attach(iris)
cols <- colnames(iris)
for (i in 1:length(cols)) {
  print(paste0(cols[i], " (", nchar(cols[i]), ")"))
}

#Ex7
mat <- matrix(c(rep(0, 25)), nrow = 5, ncol = 5)
for (i in 1:5) {
  for (j in 1:5) {
    mat[i, j] <- abs(i - j)
  }
}
mat