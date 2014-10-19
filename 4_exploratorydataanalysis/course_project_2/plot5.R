#############################################################################
# Project:      Exploratory Data Analysis
# Description:  This is the solution for course Project 2 (plot 5) for
#               the exploritory data analysis module within the Data Science 
#               Specialisation delivered by John Hopkins University, via 
#               coursera.org.
# Developer:    Dr Paul Fergus
# Email:        p.fergus@ljmu.ac.uk
#############################################################################

#Set the working directory
setwd("~/Google Drive/LJMU6/Research/Git/datascience/4_exploratorydataanalysis/course_project_2")

#Include required libraries
library("ggplot2")
library("plyr")

#clean the environment
rm(list=ls())

#Set global variables to null
NEI <- NULL
SCC <- NULL
coal.matches <- NULL
coal.matches.data <- NULL
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
    #Read in the dataset.
    SCC <<- readRDS("data/Source_Classification_Code.rds")
  }
  
  
  #5. How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
  #Yes they significantly reduced in 2002 then leveled off until they decreased again in 2008
  #Filter the data to only include observations for Baltimore City and motor vehicle sources
  baltmarfips <- subset(NEI, fips =="24510" & type=="ON-ROAD")
  total_emissions_by_year <<- aggregate(Emissions ~ year, baltmarfips, sum)
  
  #Change the column names
  colnames(total_emissions_by_year) <- c("year", "Emissions")
  
  #Use the ggplot plotting system to make a plot answering this question.
  png("plot5.png",width=480,height=480, units="px",bg="transparent")
  
  ggp <- ggplot(data=total_emissions_by_year, aes(x=year, y=Emissions)) + 
    geom_line(aes(group=1, col=Emissions)) + 
    geom_point(aes(size=2, col=Emissions)) + 
    ggtitle("Total PM2.5 Motor Vehicle Emissions by Year") + 
    ylab("PM2.5 Emissions (Tons)") + 
    geom_text(aes(label=round(Emissions,digits=2), size=2, hjust=1.5, vjust=1.5)) + 
    theme(legend.position='none') + scale_colour_gradient(low='black', high='red')
  
  #Draw plot on current graphics device. In this case it prints the graph to our 
  #png file. 
  print(ggp)
  
  #returns the number and name of the new active device (after the specified device 
  #has been shut down).
  dev.off()
}