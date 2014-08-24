install.packages("data.table", dependencies=TRUE)
library(data.table)

DF <- data.frame(x=rnorm(9),y=rep(c("a","b","c"), each=3), z=rnorm(9))

head(DF,3)

system.time(tapply(DT$pwgtp15,DT$SEX,mean))
system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))
system.time(mean(DT[DT$SEX==1,]$pwgtp15)); system.time(mean(DT[DT$SEX==2,]$pwgtp15))
system.time(DT[,mean(pwgtp15),by=SEX])
system.time(rowMeans(DT)[DT$SEX==1]); system.time(rowMeans(DT)[DT$SEX==2]))
system.time(mean(DT$pwgtp15,by=DT$SEX))