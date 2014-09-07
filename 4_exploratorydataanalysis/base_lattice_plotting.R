#############################################################################
# Project:      Exploratory Data Analysis
# Description:  This is the solution for the course Assignment for the
#               getting and cleaning data module within the Data Science 
#               Specialisation delivered by John Hopkins University, via 
#               coursera.org.
# Developer:    Dr Paul Fergus
# Email:        p.fergus@ljmu.ac.uk
#############################################################################

# Load required libraries. 
# Add as needed

#Set the working directory
setwd("~/Google Drive/LJMU6/Research/Git/datascience/4_exploratorydataanalysis")

#clean the environment
rm(list=ls())

x <- rnorm(100)
y <- rnorm(100)

hist(x)
plot(x,y)

library(lattice)
library(datasets)
airquality <- transform(airquality, Month = factor(Month))

xyplot(Ozone ~ Wind|Month, data=airquality, layout= c(5,1))
