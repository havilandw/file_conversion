# simple file 

library(ggplot2)
m <- .8
b <-  1
x <- seq(from = .7, to = 30, by = 1.2)
s <- 3
e <- s*rnorm(length(x))

y <- m*x + b + e

# this line was written in test
# this is a second line 

dat <- as.data.frame(cbind(x,y))

# this line was added under master

p <- ggplot(data=dat, aes(x,y)) 

p + geom_point(color="red", size=2)

