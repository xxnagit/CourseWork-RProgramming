#Function III
ST=c('NAME:Maria /COUNTRY:uruguay /EMAIL:mariaUY@gmail.com','NAME:Paul/COUNTRY:UK /EMAIL:PaulUK@gmail
.com','NAME:Jhon /COUNTRY:USA /EMAIL:JhonUSA@gmail.com','NAME:Carlos /COUNTRY:Spain /EMAIL:CarlosSP@gmail.com')   
GetInfo <- function(ST){
  A=unlist(strsplit(ST,'/'))
  M=rbind(unlist(strsplit(A[1],':')),unlist(strsplit(A[2],':')),unlist(strsplit(A[3],':')))
  return(M)
}

GetInfo2 <- function(input) {
  inputRow <- unlist(strsplit(input, ','))
  result <- cbind(GetInfo(inputRow[1]), GetInfo(inputRow[2]), GetInfo(inputRow[3]), GetInfo(inputRow[4]))
  result <- result[,-3]
  result <- result[,-4]
  result <- result[,-5]
  result
}

GetInfo2(ST)

#Factor Ex1
x <- factor(c("high", "low", "medium", "high", "high", "low", "medium"))
lev <- levels(x)
col2 <- c(1, 2, 3)
df <- data.frame(cbind(lev, col2))
rownames(df) <- c(1, 2, 3)
colnames(df) <- c('levels', 'values')
df

#Ex2
x <- data.frame(q=c(2, 4, 6), p=c("a", "b", "c"))
xCol <- factor(x[,2])
levels(xCol) <- c("fertiliser1", "fertiliser2", "fertiliser3")
x <- data.frame(q=c(2, 4, 6), p=xCol)
x


#Ex3
gender <- c("f", "m ", "male ","male", "female", "FEMALE", "Male", "f", "m")
vetor2factor <- function(vec) {
  result <- tolower(vec)
  result <- trimws(result)
  resultf <- factor(result)
  resultf
  levels(resultf)[levels(resultf) == "f"] <- "Female"
  levels(resultf)[levels(resultf) == "female"] <- "Female"
  levels(resultf)[levels(resultf) == "m"] <- "Male"
  levels(resultf)[levels(resultf) == "male"] <- "Male"
  return(resultf)
}
vetor2factor(gender)
  






