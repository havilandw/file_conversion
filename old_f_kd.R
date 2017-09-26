library(ggplot2)
library(graphics)

# make sure you have run DKLM_ch15.R -- 
# that is the applicaton that produces 
# the "old_faithful.csv"data file
#
oldf <- read.csv("old_faithful.csv", header = FALSE)


plot(density(c(-20, rep(0,98), 20)), xlim = c(-4, 4)) # IQR = 0
# The Old Faithful geyser data
d <- density(oldf$V1, bw = "sj")
d
plot(d)
plot(d, type = "h")
polygon(d, col = "wheat")

p <- ggplot(data=oldf, aes(V1))

p + geom_histogram()

p + geom_density(bw = "sj", fill="wheat")

hist(oldf$V1)

# kernel, window
# a character string giving the smoothing kernel to be used. 
# This must partially match one of 
# "gaussian", "rectangular", "triangular", 
# "epanechnikov", "biweight", "cosine" or "optcosine", 
# with default "gaussian", and may be abbreviated 
# to a unique prefix (single letter).

# bw choices
#
# "nrd0", "nrd", "ucv", "bcv", "SJ-ste", "SJ-dpi"
#
#  Kernel density estimates depend on the selection of the 
#  kernel and bw (bandwidth)
#  Different selections are show below.
#

ggplot(data=oldf, aes(V1)) + 
  geom_density(bw = "nrd", kernel="epanechnikov",fill="wheat")

ggplot(data=oldf, aes(V1)) + 
  geom_density(bw = "nrd", kernel="rectangular",fill="wheat")

ggplot(data=oldf, aes(V1)) + 
  geom_density(bw = "nrd", kernel="triangular",fill="wheat")

ggplot(data=oldf, aes(V1)) + 
  geom_density(bw = "sj", kernel="triangular",fill="wheat")

ggplot(data=oldf, aes(V1)) + 
  geom_density(bw = "nrd", kernel="triangular",fill="wheat")

ggplot(data=oldf, aes(V1)) + 
  geom_density(bw = "nrd", kernel="biweight",fill="wheat")


#####################################################
#The plots below provide a comparison of bw selections.
#The data are precipitation data


plot(density(precip, n = 1000))
rug(precip)
lines(density(precip, bw = "nrd"), col = 2)
lines(density(precip, bw = "ucv"), col = 3)
lines(density(precip, bw = "bcv"), col = 4)
lines(density(precip, bw = "SJ-ste"), col = 5)
lines(density(precip, bw = "SJ-dpi"), col = 6)
legend(55, 0.035,
       legend = c("nrd0", "nrd", "ucv", "bcv", "SJ-ste", "SJ-dpi"),
       col = 1:6, lty = 1)

