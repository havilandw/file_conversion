library(ggplot2)

timber <- read.csv("timber.csv")
head(timber)

timber <- timber[2:3]

ggplot(data=timber) + geom_point(aes(x=density, y=hardness))

cor(timber$density, timber$hardness)

ggplot(data=timber) + 
  geom_point(aes(x=density, y=hardness)) +
  geom_smooth(aes(x=density, y=hardness), color = "orange")


ggplot(data=timber) + 
  geom_point(aes(x=density, y=hardness)) +
  geom_smooth(aes(x=density, y=hardness), 
              color = "orange", method = "lm")


