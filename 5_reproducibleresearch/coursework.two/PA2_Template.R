if(!file.exists("./data/repdata-data-StormData.csv")){
  data <- read.table(
    bzfile("./data/repdata-data-StormData.csv.bz2", 
           "repdata-data-StormData.csv"), sep=",", header=T, na.string="NA")
}


head(data, n=1)

dim(data)

length(unique(data$EVTYPE))

data$EVTYPE

library(plyr)

casulties <- ddply(data, .(EVTYPE), summarize, 
                   fatalities = sum(FATALITIES),
                   injuries = sum(INJURIES))

fatal.events <- head(casulties[order(casulties$fatalities, decreasing=TRUE), ], 10)