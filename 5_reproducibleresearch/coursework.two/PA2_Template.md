---
title: "Peer Assessment Two"
author: "Dr Paul Fergus"
date: "24/10/2014"
output: html_document
---

##Load the required libraries
```{r}
#ggplo2 is a plotting system for R, based on the grammer of graphics, which tries to take the good parts of base and lattice graphics and none of the bad parts. It takes care of many of the fiddly detials that make plotting a hassele (like drawing legents) as well as providing a powerful model of graphics that makes it each to produce complex multi-layered graphics. 
library(ggplot2)
#The Hmisc package contains many functions useful for data analysis, high-level graphics, utility operations, functions for computing sample size and power, importing datasets, imputing missing values, advanced table making, variable clustering, character string manipulation, conversion of R objects to LaTeX code, and recoding variables. In this project we are utilising this package to impute missing values in our dataset. 
library(Hmisc)
```

##Loading and preprocessing the data
1. Load the data (i.e. read.csv())
This code first checks to see if the csv file exists. If it does not exist then
read the csv from the zip file. 

```{r}
if(!file.exists("./data/repdata-data-StormData.csv")){
  data <- read.table(
    unz("./data/repdata-data-StormData.csv.bz2", 
      "storm.csv"), sep=",", header=T, na.string="NA")
}
```

