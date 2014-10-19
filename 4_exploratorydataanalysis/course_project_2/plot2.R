#############################################################################
# Project:      Exploratory Data Analysis
# Description:  This is the solution for course Project 2 (plot 2) for
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
  
  #2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
  #Yes: emissions have decreased in the Baltimore City, Maryland from 1999 to 2008,
  #however, it decreased in 2002 and then increase again in 2005 before decreasing
  #overall in 2008
  baltmarfips <- NEI[NEI$fips=="24510",]
  total_emissions_by_year <<- aggregate(Emissions ~ year, baltmarfips, sum)
  
  #Use the base plotting system to make a plot answering this question.
  png("plot2.png",width=480,height=480, units="px",bg="transparent")
  
  #With is a generic function that evaluates the second parameter (in this case the barplot)
  #in a local environment constructed from the parameter one (in this instance our 
  #data.frame). This is useful for simplifiying code.
  with(total_emissions_by_year, {
    barplot(
      
      (Emissions),
      names.arg=year,
      xlab="Year",
      ylab="PM2.5 Emissions (Tons)",
      main="Total PM2.5 Emissions From all Baltimore City, Maryland Sources"
    )
  })
  
  #returns the number and name of the new active device (after the specified device 
  #has been shut down).
  dev.off()
  
}