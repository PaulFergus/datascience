#############################################################################
# Project:      Exploratory Data Analysis
# Description:  This is the solution for course Project 2 (plot 3) for
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
  
  #3. Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) 
  #variable, which of these four sources have seen decreases in emissions from 1999–2008 
  #for Baltimore City? 
  #By and large the nonpoint, non-road and on-road sources have seen decreases
  #in emissions between 1999 and 2008. While the point type show increases between
  #1999 and 2005, followed by a sharp drop on emissions in 2008.
  baltmarfips <- NEI[NEI$fips=="24510",]
  
  #Use the ggplot2 plotting system to make a plot answering this question.
  png("plot3.png",width=480,height=480, units="px",bg="transparent")
  
  ggp <- ggplot(baltmarfips, aes(factor(year), Emissions, fill=type)) +
    geom_bar(stat="identity") +
    theme_bw() + guides(fill=FALSE)+
    facet_grid(.~type,scales="free", space="free") +
    labs(x="Year", y="PM2.5 Emissions (Tons)") +
    labs(title="PM2.5 Emissions, Blatimore City 1999-2008 by Source Type")
  
  #Draw plot on current graphics device. In this case it prints the graph to our 
  #png file. 
  print(ggp)
  
  #returns the number and name of the new active device (after the specified device 
  #has been shut down).
  dev.off()
  
}