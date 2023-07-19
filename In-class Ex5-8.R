#Ex5
a = c(1, 5, 3, 8)
DIGITS <- function (input) {
  out <- c(0:9)
  input <- sort(input)
  output <- out[ -which(out %in% input)]
  return(output)
}
DIGITS(a)

#Ex6
b = c(1, 2, 3, 4, 2, 7)
C = C(1, 2, 5, "MA")
Occurence <- function(input, data) {
  if (is.numeric(input)) {
    id = which(input == data)
    return(length(id))
  }
  else {
    print("Please enter a numeric vector")
  }
}
Occurence(b, 2)
Occurence(b, 9)
Occurence(c, 5)
#Ex7
vec <- c("the", "have", "go", "go", "the", "the", 3, 8)
uniquef <- function(input) {
  vecf <- as.factor(input)
  lev = levels(vecf)
  return(lev)
}
uniquef(vec)
#Ex8
ST = 'NAME: Maria /COUNTRY: uruguay /EMAIL: mariaUY@gmail.com'
GetInfo <- function(inputSt) {
  rows <- strsplit(inputSt, "[/]" )[[1]] #get the content in row order
  numCol = lengths(regmatches(inputSt, gregexpr("[/]", ST))) #get the col number of the final matrix
  numRow = lengths(regmatches(inputSt, gregexpr("[:]", ST))) #get the row number of the final matrix
  content <- strsplit(rows[1], "[:]")[[1]]
  for(i in 2:numRow) {
    contentRow <- strsplit(rows[i], "[:]")[[1]]
    content <- rbind(content, contentRow)
    rownames(content) <- NULL
  }
  return(content)
}
M = GetInfo(ST)
M



