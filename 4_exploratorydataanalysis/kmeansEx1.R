set.seed(1234)
par(mar = c(0.2,4))
x <- rnorm(12, mean = rep(1:3, each =4),sd =0.2)
y <- rnorm(12, mean = rep(1,2,1, each =4),sd =0.2)


dataFrame <- data.frame(x=x,y=y)
kmeansObj <- kmeans(dataFrame, centers=3)

plot(x,y,col=kmeansObj$cluster, pch =19, cex =2)
points(kmeansObj$centers, col = 1:3, pch=3,cex=3, lwd=3)
