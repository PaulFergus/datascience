#Lower rank matrix
#singular value decomposition
#principle component analysis
set.seed(12345)
par(mar = rep(0.2,4))
dataMatrix <- matrix(rnorm(400), nrow = 40)


#Add a pattern to the data
set.seed(678910)
for(i in 1:40){
  coinFlip1 <- rbinom(1, size =1, prob=0.5)
  coinFlip2 <- rbinom(1, size =1, prob=0.5)
  
  if(coinFlip1){
    dataMatrix[i,] <- dataMatrix[i,] + rep(c(0,5), each = 5)
  }
  
  if(coinFlip2){
    dataMatrix[i,] <- dataMatrix[i,] + rep(c(0,5), 5)
  }
}

hh <- hclust(dist(dataMatrix))
dataMatrixOrdered <- dataMatrix[hh$order,]

svd2 <- svd(scale(dataMatricOrdered))
par(mfrow = c(1,3))
image(t(dataMatrixOrdered)[, nrow(dataMatrixOrdered):1])
plot(rep(c(0,1), each = 5), pch=19, xlab = "Column", ylab = "Pattern 1")
plot(rep(c(0,1),5), pch=19, xlab = "Column", ylab = "Pattern2")