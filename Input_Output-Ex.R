setwd("/Users/machikara/Desktop/Application_2017fall/UALR Courses/IFSC 5399/R Projects")
con <- file("z.txt", "r")

lin <-readLines(con)
for (i in 1:(length(lin)+1)){
  if(i <= length(lin)) {
    print(lin[i])
  }else {
    print("reach the end")
  }
}

#Ex1
a = c("Tom Hastings", "Brian Wall", "Sue Klark")
b = c(T, F, T)
c = rnorm(3)
stringdf <- data.frame(Names = a, Indicator = b, Measurement = c)
nameVec <- as.vector(stringdf$Names)
nameSplit <- unlist(strsplit(nameVec, split= " "))
namedf <- data.frame(FirstName = c(nameSplit[1], nameSplit[3], nameSplit[5]), 
                     LastName = c(nameSplit[2], nameSplit[4], nameSplit[6]))

