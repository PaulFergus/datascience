#############################################################################
# Project:      Exploratory Data Analysis
# Description:  This is the solution for course Project 2 (plot 1) for
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
total_emissions_by_year <- NULL

#This function runs the analysis
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
    #Read in the dataset
    SCC <<- readRDS("data/Source_Classification_Code.rds")
  }
  
  #1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
  #Yes: emissions have decreased in the US from 1999 to 2008
  total_emissions_by_year <<- aggregate(Emissions ~ year, NEI, sum)
  #Using the base plotting system, make a plot showing the total PM2.5 emission from all 
  #sources for each of the years 1999, 2002, 2005, and 2008.
  png("plot1.png",width=480,height=480, units="px",bg="transparent")
  
  #With is a generic function that evaluates the second parameter (in this case the barplot)
  #in a local environment constructed from the parameter one (in this instance our 
  #data.frame). This is useful for simplifiying code.
  with(total_emissions_by_year, {
    barplot(
      # reduct the size of the emissions value so that it can be read on graph
      (Emissions)/10^6, 
      names.arg=year,
      xlab="Year",
      ylab="PM2.5 Emissions (10^6 Tons)",
      main="Total PM2.5 Emissions From All US Sources"
    )
  })
  
  #returns the number and name of the new active device (after the specified device 
  #has been shut down).
  dev.off()
  
}