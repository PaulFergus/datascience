#############################################################################
# Project:      Exploratory Data Analysis
# Description:  This is the solution for course Assignment 2 for
#               the exploritory data analysis module within the Data Science 
#               Specialisation delivered by John Hopkins University, via 
#               coursera.org.
# Developer:    Dr Paul Fergus
# Email:        p.fergus@ljmu.ac.uk
#############################################################################

#Set the working directory
setwd("~/Google Drive/LJMU6/Research/Git/datascience/4_exploratorydataanalysis/course_project_2")

#clean the environment
rm(list=ls())

#Set global variables to null
NEI <- NULL
SCC <- NULL

run_analysis <- function(){
  
  #The dataset has 6 million rows and 6 columns. First calculate a rough estimate of 
  #how much memory the dataset will require in memory before reading into R. Make sure 
  #your computer has enough memory (most modern computers should be fine).
  if(is.null(NEI)){
    #Read in the dataset - I am reading the dataset in full as my machine has no 
    #problem dealing with data of this size.
    NEI <<- readRDS("data/summarySCC_PM25.rds")
  }
  
  if(is.null(SCC)){
    #Read in the dataset - I am reading the dataset in full as my machine has no 
    #problem dealing with data of this size.
    SCC <<- readRDS("data/Source_Classification_Code.rds")
  }
  

  
}