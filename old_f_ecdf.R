

oldf.df <- read.csv("old_faithful.csv", header=FALSE)

oldf.n <- as.numeric(oldf.df$V1) 

oldf.cdf <- ecdf(oldf.n)

plot.ecdf(oldf.n)

max(oldf.n)

oldf.cdf(max(oldf.n))

oldf.cdf(200)

oldf.cdf(min(oldf.n))

