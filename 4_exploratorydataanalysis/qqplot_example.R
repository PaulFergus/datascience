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
library(ggplot2)

#Set the working directory
setwd("~/Google Drive/LJMU6/Research/Git/datascience/4_exploratorydataanalysis")

#clean the environment
rm(list=ls())

str(mpg)
qplot(displ, hwy, data = mpg, col=drv, geom = c("point", "smooth"))
