load("data/face.rda")
image(t(faceData)[, nrow(faceData):1])
svd1 <- svd(scale(faceData))

#Extract first component
approx1 <- svd1$u[, 1] %*% t(svd1$v[, 1]) * svd1$d[1]
#Extract the first five components
approx5 <- svd1$u[,1:5] %*% diag(svd1$d[1:5]) %*% t(svd1$v[,1:5])
#Extract the first ten components
approx10 <- svd1$u[,1:10] %*% diag(svd1$d[1:10]) %*% t(svd1$v[,1:10])


par(mfrow=c(1,4))

image(t(approx1)[,nrow(approx1):1],main="(a)")
image(t(approx5)[,nrow(approx5):1],main="(b)")
image(t(approx10)[,nrow(approx10):1],main="(c)")
image(t(faceData)[,nrow(faceData):1],main="(d)")

#plot(svd1$d^2/sum(svd1$d^2), pch=19,xlab="Singular Vectro", ylab="Variance explained")
