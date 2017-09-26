library(ggplot2)
library(xlsx)
library(stringr)


#### Data from DKLM Chap 15

# The data for tables 15.1, 15.3, 15.4, and 15.5 were scraped 
# from softcopies of the book (pdf and Kindle), and then
# converted, and plotted.  The plots are included as 
# illustrations or initial plots and as confirmations that 
# the file is producing consistent results.

########### Table 1.5 old faithful data

# Text from the Kindle version of the text was copied
# and pasted into Excel.  The data came in as a single row.
# The data were transposed and saved as a csv file.


oldf <- read.csv("old_faithful.csv")
colnames(oldf) <- "duration"
ggplot(data=oldf, aes(x=duration)) + geom_histogram()


################################################### Table 15.3
#############
#### In order to demonstrate xlsx reading, Table 15.3 was
##   copied into excel two columns at a time and saved

interfail <- unlist(read.xlsx("table15-3 interfailure times.xlsx", 
                       sheetIndex = 1,
                       header = FALSE))

interfail <- as.data.frame(interfail)


ggplot(data=interfail, aes(x=interfail)) + geom_histogram()


############  Table 15.4

################ two lines used to read data from the clipboard
## Table 15.4 was copied to the clipboard from a PDF
## of the text book and read into R
## directly from the clipboard and saved to an rds file.

##  mining <- readClipboard()
##  saveRDS(mining, "mining.rds")
##  Now the rds file is read -- to preserve the data
##  as it was loaded from the clipboard

mining <- readRDS(file="mining.rds")

## used to test conversion ideas
## the three command below are included here to provide
## a demonstration of how the r commands work
## 
# v <- str_split(mining[1]," ")
# v1 <- lapply(v,as.numeric)
# v2 <- unlist(v1)

## note that both bb and ww must be initialized as a NULL
## before they are used 

vv <- NULL
for(i in 1:40){vv[i] <- str_split(mining[i], " ")}
ww <- NULL
for(i in 1:40){ww[i] <- lapply(vv[i],as.numeric)}

## unlist removes the structuon of ww so that 
## a vector remains that can be reshaped into a dataframe

xx <- unlist(ww)

data <- as.data.frame(matrix(data = xx,ncol = 6,byrow = TRUE))


data1 <- data[,4:6]
data <- data[,1:3]

colnames(data1) <- colnames(data) <- c("depth", "wet", "dry")

drill.time <- rbind(data,data1)

write.csv(drill.time, "mine_dat.csv")

ggplot(data=drill.time) +
  geom_point(aes(x=depth, y=wet),color="blue") +
  geom_point(aes(x=depth, y=dry),color="red")

## #############################################

##########table 15.5

## Australian timber data
#  read from Kindle -- came in as a single  string of numbers
#  aloong with other data which was not data from the table.
#  As before the data fromt he clipboard was saved as
#  a RDS file right away to preserve the data in the form and
#  format that was converted.
###

# timber <- readClipboard()
# saveRDS(timber, "timber.rds")

timber <- readRDS("timber.rds")

timber <- timber[1]

#note that it is a single string

length(timber)

t1 <- str_split(timber, " ")
t2 <- lapply(t1, as.numeric)
t3 <- unlist(t2)

timber <- as.data.frame(matrix(t3,ncol = 6,byrow = TRUE))
t1 <- timber[1:2]
t2 <- timber[3:4]
t3 <- timber[5:6]
colnames(t1) <- colnames(t2) <- colnames(t3) <- c("density","hardness")

timber <- rbind(t1,t2,t3)

write.csv(timber, "timber.csv")

ggplot(data=timber) + geom_point(aes(x=density, y=hardness))

