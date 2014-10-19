set.seed(12345)
par(mar = rep(0.2,4))
dataMatrix <- matrix(rnorm(400), nrow = 40)


#Add a pattern to the data
set.seed(678910)
for(i in 1:40){
  coinFlip <- rbinom(1, size =1, prob=0.5)
  if(coinFlip){
    dataMatrix[i,] <- dataMatrix[i,] + rep(c(0,3), each = 5)
  }
}

image(1:10,1:40,t(dataMatrix)[, nrow(dataMatrix):1])

heatmap(dataMatrix)
