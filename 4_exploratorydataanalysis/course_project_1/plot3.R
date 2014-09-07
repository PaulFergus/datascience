#############################################################################
# Project:      Exploratory Data Analysis
# Description:  This is the solution for course Assignment 1 (plot 3) for
#               the exploritory data analysis module within the Data Science 
#               Specialisation delivered by John Hopkins University, via 
#               coursera.org.
# Developer:    Dr Paul Fergus
# Email:        p.fergus@ljmu.ac.uk
#############################################################################

#Set the working directory
setwd("~/Google Drive/LJMU6/Research/Git/datascience/4_exploratorydataanalysis/course_project_1")

#clean the environment
rm(list=ls())

#Set global variables to null
data <- NULL
sub_data <- NULL

run_analyse <- function(){
  
  #Do not unzip and load the data everyting the function is called - it is too slow.
  #The dataset has 2,075,259 rows and 9 columns. First calculate a rough estimate of 
  #how much memory the dataset will require in memory before reading into R. Make sure 
  #your computer has enough memory (most modern computers should be fine).
  if(is.null(data)){
    #Read in the dataset - I am reading the dataset in full as my machine has no 
    #problem dealing with data of this size. If it is an issue then you can use
    #the following code rm(data) - this will free up some memory. Note, that this 
    #should only be performed after you have obtained your sub_set data (see below.)
    data <<- read.table(
      unz("./data/exdata-data-household_power_consumption.zip", 
          "household_power_consumption.txt"), sep=";", header=T, na.string="?")
  }
  
  #We will only be using data from the dates 2007-02-01 and 2007-02-02. One alternative 
  #is to read the data from just those dates rather than reading in the entire dataset 
  #and subsetting to those dates.
  #First convert the date column to a Date class
  data$Date <- as.Date(data$Date, format="%d/%m/%Y")
  #Extract the subset of data
  sub_data <<- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
  
  #At this point you can remove the full data set to save on memory as it is not needed
  #after this point. 
  #rm(data)
  
  #You may find it useful to convert the Date and Time variables to Date/Time classes 
  #in R using the strptime() and as.Date() functions.
  sub_data$DateTime <<- paste(sub_data$Date, sub_data$Time)
  sub_data$DateTime <<- strptime(sub_data$DateTime, format="%Y-%m-%d %H:%M:%S")
  
  #Plot 3
  #Construct the plot and save it to a PNG file with a width of 480 pixels and a 
  #height of 480 pixels.
  png(filename="plot3.png", width = 480, height=480, units="px", bg="white")
  
  #We can leave the margins with the default values. If you do want to change then 
  #then use the par(mar = c()) function. 
  
  #Create the line plot
  plot(
    sub_data$DateTime, sub_data$Sub_metering_1, xaxt=NULL, 
    xlab = "", ylab = "Energy sub metering", type="n")
  
  #Add the data lines to the plot
  lines(sub_data$DateTime, sub_data$Sub_metering_1, col = "black", type="S")
  lines(sub_data$DateTime, sub_data$Sub_metering_2, col = "red", type="S")
  lines(sub_data$DateTime, sub_data$Sub_metering_3, col = "blue", type="S")
  
  #Add a legend to the plot
  legend("topright", lty = c(1,1), lwd = c(1,1,1), col = c("black", "red", "blue"), 
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  #returns the number and name of the new active device (after the specified device has been shut down)
  dev.off()
  
}