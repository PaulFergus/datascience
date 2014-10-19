#############################################################################
# Project:      Exploratory Data Analysis
# Description:  This is the solution for course Project 2 (plot 6) for
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
baltmarfips.emis <- NULL
losangfips.emis <- NULL
df <- NULL

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
  
  #6. Compare emissions from motor vehicle sources in Baltimore City with emissions from 
  #motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city 
  #has seen greater changes over time in motor vehicle emissions?
  baltmarfips <- subset(NEI, fips =="24510" & type=="ON-ROAD")
  losangfips <- subset(NEI, fips=="06037" & type=="ON-ROAD")
  
  #Calculate the emissions
  baltmarfips.emis <<- aggregate(Emissions ~ year, baltmarfips, sum)
  baltmarfips.emis$City <<- paste(rep('BCM',4))
  losangfips.emis <<- aggregate(Emissions ~ year, losangfips, sum)
  losangfips.emis$City <<- paste(rep('LAC',4))
  
  #Combine the data
  df <<- as.data.frame(rbind(baltmarfips.emis, losangfips.emis))
  
  #Use the ggplot plotting system to make a plot answering this question.
  png("plot6.png", width=480,height=480, units="px",bg="transparent")
   
  ggp <- ggplot(df, aes(factor(year), Emissions, fill=year)) +
    geom_bar(stat="identity") +
    theme_bw() + guides(fill=FALSE)+
    facet_grid(.~City) +
    labs(x="Year", y="PM2.5 Emissions (Tons)") +
    labs(title="Total PM2.5 Emissions Comparison of Motor Vehicle Sources for\n Baltimore City (Maryland) and Los Angeles (California")
  
  #Draw plot on current graphics device. In this case it prints the graph to our 
  #png file. 
  print(ggp)
  
  #returns the number and name of the new active device (after the specified device 
  #has been shut down).
  dev.off()
}