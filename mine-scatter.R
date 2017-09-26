
library(ggplot2)

mining <- read.csv("mine_dat.csv", header=TRUE)

head(mining)
 
drill.time <- mining[2:4]

ggplot(data=drill.time) +
  geom_point(aes(x=depth, y=wet),color="blue") +
  geom_point(aes(x=depth, y=dry),color="red") +
  geom_smooth(aes(x=depth, y=wet), color="blue") +
  geom_smooth(aes(x=depth, y=dry),color="red")




ggplot(data=drill.time) +
  geom_point(aes(x=depth, y=wet),color="blue") +
  geom_point(aes(x=depth, y=dry),color="red") +
  geom_smooth(aes(x=depth, y=wet), color="blue", method="lm") +
  geom_smooth(aes(x=depth, y=dry),color="red", method="lm")

