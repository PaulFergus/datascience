#Create our data directory
if(!file.exists("data")){
  dir.create("data")
}

#Download the Baltimore fixed Speed Camera dataset
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv "
download.file(fileUrl, destfile = "./data/acs.csv", method="curl")
list.files("./data")

#Record the date when the dataset was downloaded
dateDownloaded <- date()
dateDownloaded

#Load data
acsData <- read.table("./data/acs.csv", sep=",", header=TRUE)
head(acsData)

#Question One
agricultureLogical <- (acsData$ACR %in% 3 & acsData$AGS %in% 6)
head(agricultureLogical)


#Question Two
library(jpeg)
con <- url("https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg")
pic <- readJPEG("getdata-jeff.jpg")


## Question 3
# Getting and Cleaning Data
# Coursera
# John Hopkins University

# Bastiaan Quast
# bquast@gmail.com

# write the file url and file destination to an object
file.url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv'
file.dest <- './data/GDP.csv'

# download from the URL
download.file(file.url, file.dest, method="curl")

# specify the right lines
rowNames <- seq(10,200, 2)

# read the data
gdp <- read.csv('./data/GDP.csv', header=F, skip=5, nrows=190)
View(gdp)

# second data file
file.url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv'
file.dest <- './data/GDP2.csv'

# download from the URL
download.file(file.url, file.dest, method="curl" )

# read second file
fed <- read.csv('./data/GDP2.csv')
View(fed)

# merge datasets
combined <- merge(gdp, fed, by.x='V1', by.y='CountryCode', sort=TRUE)
View(combined)

# Q3.
# sort the data
combined[order(combined$V2,decreasing=TRUE),]

# Q4.
# OECD
mean(combined[combined$Income.Group=='High income: OECD',]$V2)
# non OECD
mean(combined[combined$Income.Group=='High income: nonOECD',]$V2)

# Q5.
# assign quentile values
quentile <- c(0.2,0.4,0.6,0.8,1)
q <- quantile(combined$V2, quentile)
q1 <- combined$V2 <= 38

xtabs(q1 ~ combined$Income.Group)