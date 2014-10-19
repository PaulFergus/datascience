myplclust <- function(hclust, lab=hclust$labels, lab.col = rep(1, length(hclust$labels)), hang = 0.1, ...){
  y <- rep(hclust$height, 2)
  x <- as.numeric(hclust$merge)
  y <- y[which(x < 0)]
  x <- x[which(x < 0)]
  x <- abs(x)
  y <- y[order(x)]
  x <- x[order(x)]
  plot(hclust, labels = F, hang = hang, ...)
  text(x = x, y = y[hclust$order] - (max(hclust$height) * hang), labels = lab[hclust$order],
       col = lab.col[hclust$order], srt=90, adj = c(1,0.5), xpd=NA, ...)
}

set.seed(1234)
par(mar = c(0,0,0,0))
x <- rnorm(12, mean = rep(1:3, each =4),sd =0.2)
y <- rnorm(12, mean = rep(1,2,1, each =4),sd =0.2)




dataFrame <- data.frame(x=x,y=y)
distxy <- dist(dataFrame)
hClustering <- hclust(distxy)
myplclust(hClustering, lab=rep(1:3, each=4), lab.col = rep(1:3, each=4))
