#This readme file will provide you with all of the steps required to clean your data

#Student Details
Project:      Getting and Cleaning Data
Description:  This is the solution for the course Assignment for the
              getting and cleaning data module within the Data Science 
              Specialisation delivered by John Hopkins University, via 
              coursera.org.
Developer:    Dr Paul Fergus
Email:        p.fergus@ljmu.ac.uk

#Pre-Processing

Step 1. Load required libraries. 
Step 2. Set the working directory
Step 3. clean the environment
Step 4. set the data variables to null when run_analysis is first run.

# Description of the function

This is the main function that performs the data cleaning processes. This 
function looks a bit messey - I must admit a started this assignement far
too late. If I had time I would have looked at splitting it into a number
of different functions. I am also pretty sure that I could reduce the
amount of duplicate code through better use of functions :-). 

I also did not get time, but, time permited, I would also change the
names of the features to perhaps be more meaningful. This said, the it is 
pretty easy to understand the descriptors - perhaps because I have 
background knowledge in the use of accelerometers and its use in 
measuring sedentary behaviour. 

#Steps used to clean the dataset, resulting in a tidy dataset.


## 1. Merges the training and the test sets to create one data set.

Step 1.   load and cache training data
Step 2.   if the data has not been previously loaded then load and cache the 
          xTrain data
Step 3.   if the data has not been previously loaded then load and cache the 
          yTrain data
Step 4.   if the data has not been previously loaded then load and cache the 
          xTest data
Step 5.   if the data has not been previously loaded then load and cache the 
          yTest data
Step 6.   Merge the X training and Test data - merge by row not column
Step 7.   Add the feature names to the xMerged data.table
Step 8.   Get and add subject data to merged file
Step 9.   Get the subject information from the training set
Step 10.  Get the subject information from the training set
Step 11.  Row bind the data
Step 12.  Add the subject data to the xMerged data
Step 13.  Merge the Y training and Test data - merge by row not column
Step 14.  Add the label activty_id to the yMerged data.table
Step 15.  Merge the labels and feature data for all observations
  
## 2. Extract only the measurements on the mean and standard deviation for each measurement. 

Step 1.   Use pattern matching (grep) to extract only the mean and standard 
          deviation measurements - results in 81 columns
          
## 3. Uses descriptive activity names to name the activities in the data set

Step 1. Get the activty types
Step 2. Read the activity types into a table
Step 3. Create a list of categories (factors) for the actity types - produces 
        6 levels
  
## 4. Appropriately labels the data set with descriptive variable names. 
Step 1. Add the acity label to the merged data.table - this provides our dataset
        with description values for the activity id, i.e. Standing instead of 5

## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
  
Step 1. Using the ddply function split the data frame activity_label and 
Step 2  activity_id and apply the mean function to each of the split groups. 
Step 3. Note that you must exclude the first two columns as these are descriptive
        values rather than quantative data measurements.
Step 4. Write the data to the file. 
  write.csv(file="./data/tidy_data.csv", x=tidy_data)