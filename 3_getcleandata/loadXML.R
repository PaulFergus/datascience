library(XML)

#Create our data directory
if(!file.exists("data")){
  dir.create("data")
}

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata Fdata Frestaurants.xml"
doc <- xmlTreeParse(fileUrl, useInternal=TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode)

names(rootNode)

rootNode[[1]]

rootNode[[1]][[1]]

xmlSApply(rootNode, xmlValue)

xpathSApply(rootNode, "//name", xmlValue)

xpathSApply(rootNode, "//price", xmlValue)