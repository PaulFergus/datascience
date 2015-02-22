library(kernlab)
data(spam)
head(spam)
plot(density(spam$your[spam$type=="nonspam"]), col="blue", main="", xlab="Frquency of 'your'")
lines(density(spam$your[spam$type=="spam"]), col="red")

