library(jsonlite)

#Create our data directory
if(!file.exists("data")){
  dir.create("data")
}

jsonData <- fromJSON("https://api.github.com/users/jtleek/repos")

names(jsonData)

names(jsonData$owner)

names(jsonData$owner$login)

jsonData$owner$login

myjson <- toJSON(iris,pretty=TRUE)
iris2 <- fromJSON(myjson)
head(iris2)
