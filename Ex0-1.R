vals <- c("m", "l", "h","l")
vals_fct <- factor(vals, levels = c("l","m","h"), ordered =T)
vals_fct[1]
vals_fct[3]
t = (vals_fct[1] > vals_fct[3]); t
x <- c(6, 1:3, NA, 12)
x[x > 5]
subset(x, x > 5)
which(x*x > 8)
lst <- list(
  x = c(-5, 2), 
  y = c(TRUE, FALSE), 
  z = c("a", "b")
)
lst[[1]]
# Create speed_vector
speed_vector <- c("medium", "slow", "slow", "medium", "fast")

# Convert speed_vector to ordered factor vector
factor_speed_vector <- factor(speed_vector, ordered = TRUE, levels = c("slow", "medium", "fast"))

# Print factor_speed_vector
speed_vector
factor_speed_vector
summary(factor_speed_vector)