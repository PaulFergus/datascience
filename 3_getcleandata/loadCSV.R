#Create our data directory
if(!file.exists("data")){
  dir.create("data")
}

#Download the Baltimore fixed Speed Camera dataset
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
download.file(fileUrl, destfile = "./data/for.csv", method="curl")
list.files("./data")

#Record the date when the dataset was downloaded
dateDownloaded <- date()
dateDownloaded

#Load data
acsData <- read.table("./data/acs.csv", sep=",", header=TRUE)
head(acsData)

