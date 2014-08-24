#############################################################################
# Project:      Getting and Cleaning Data
# Description:  This is the solution for the course Assignment for the
#               getting and cleaning data module within the Data Science 
#               Specialisation delivered by John Hopkins University, via 
#               coursera.org.
# Developer:    Dr Paul Fergus
# Email:        p.fergus@ljmu.ac.uk
#############################################################################

# Load required libraries. 
library(plyr)

#Set the working directory
setwd("~/Google Drive/LJMU6/Research/Git/datascience/3_getcleandata/courseproject")

#clean the environment
rm(list=ls())
#set the data variables to null when run_analysis is first run.
xTrain <- xTest <-yTrain <- yTest <- NULL
xMerged <- yMerged <- merged <- descriptive_merged <- NULL
features <- NULL
tidy_data <- NULL

# This is the main function that performs the data cleaning processes. This 
# function looks a bit messey - I must admit a started this assignement far
# too late. If I had time I would have looked at splitting it into a number
# of different functions. I am also pretty sure that I could reduce the
# amount of duplicate code through better use of functions :-). 

# I also did not get time, but, time permited, I would also change the
# names of the features to perhaps be more meaningful. This said, the it is 
# pretty easy to understand the descriptors - perhaps because I have 
# background knowledge in the use of accelerometers and its use in 
# measuring sedentary behaviour. 
runAnalysis <- function() {
  ###########################################################################
  # 1. Merges the training and the test sets to create one data set.
  ###########################################################################
  #load and cache training data
  #if the data has not been previously loaded then load and cache the 
  #xTrain data
  if(is.null(xTrain)){
    xTrain <<- read.table(
      "./data/train/X_train.txt", 
        header=FALSE)
    
  }
  #if the data has not been previously loaded then load and cache the 
  #yTrain data
  if(is.null(yTrain)){
    yTrain <<- read.table(
      "./data/train/y_train.txt", 
        header=FALSE)
  }
  #if the data has not been previously loaded then load and cache the 
  #xTest data
  if(is.null(xTest)){
    xTest <<- read.table(
      "./data/test/X_test.txt", 
        header=FALSE)
  }
  #if the data has not been previously loaded then load and cache the 
  #yTest data
  if(is.null(yTest)){
    yTest <<- read.table(
      "./data/test/y_test.txt", 
        header=FALSE)
  }

  #Merge the X training and Test data - merge by row not column
  xMerged <<- rbind(xTrain, xTest)

  #Add the feature names to the xMerged data.table
  features <<- read.table("./data/features.txt")
  names(xMerged) <<- features[,2]
  
  #Get and add subject data to merged file
  #Get the subject information from the training set
  subjectTrain <<- read.table(
    "./data/train/subject_train.txt", 
      header=FALSE)
  
  colnames(subjectTrain) <- ("subject")
  
  #Get the subject information from the training set
  subjectTest <- read.table(
    "./data/test/subject_test.txt", 
      header=FALSE)
  
  colnames(subjectTest) <- c("subject")
  
  #Row bind the data
  subjects <- rbind(subjectTrain, subjectTest)
  
  #Add the subject data to the xMerged data
  xMerged <<- cbind(subjects, xMerged)

  #Merge the Y training and Test data - merge by row not column
  yMerged <<- rbind(yTrain, yTest)
  
  #Add the label activty_id to the yMerged data.table
  names(yMerged) <<- c("activity_id")

  #Merge the labels and feature data for all observations
  merged <<- cbind(yMerged, xMerged)
  
  #############################################################################
  # 2. Extract only the measurements on the mean and standard deviation for 
  #    each measurement. 
  #############################################################################

  # Use pattern matching (grep) to extract only the mean and standard 
  # deviation measurements - results in 81 columns
  sub1_merged <- merged[,c(1,
    grep("std", colnames(merged)), 
      grep("mean", 
        colnames(merged)))]
  
  #############################################################################
  # 3. Uses descriptive activity names to name the activities in the data set
  #############################################################################

  #Get the activty types
  # Read the activity types into a table
  activity_types <<- read.table(
    "./data/activity_labels.txt")
  
  # Create a list of categories (factors) for the actity types - produces 
  # 6 levels
  activity_label <<- factor(merged[,1], 
      levels=activity_types$V1, 
        labels=activity_types$V2)
  
  #############################################################################
  # 4. Appropriately labels the data set with descriptive variable names. 
  #############################################################################
  
  # Add the acity label to the merged data.table - this provides our dataset
  # with description values for the activity id, i.e. Standing instead of 5
  descriptive_merged <<- cbind(
    activity_label, 
      merged)

  #############################################################################
  # 5. Creates a second, independent tidy data set with the average of each 
  #    variable for each activity and each subject. 
  #############################################################################
  
  # Using the ddply function split the data frame activity_label and 
  # activity_id and apply the mean function to each of the split groups. 
  # Not that you musch exclude the first two columns as these are descriptive
  # values rather than quantative data measurements.
  tidy_data <<- ddply(descriptive_merged, 
    .(activity_id, subject), 
      .fun=function(x){
        colMeans(x[,-c(1:2)])})
  
  #Write the data to the file. 
  write.csv(file="./data/tidy_data.csv", x=tidy_data)
}