## Getting and Cleaning Data Assignment

### Introduction

This repo contains Sourcecode written in R and associated documents for the assignment within the John Hopkins DataScience track modul "Getting and Cleaning Data". The purpose of this project is to demonstrate how to collect, manipulate and clean an external available data set.  There are 3 files of interest:

1. `README.md` (this document), gives an overview of the files in this repository which describes the steps used to manipulate raw data into tidy data.

2. `run_analysis.R` contains the source code for this project. It has been developed with Rstudio and may be executed without any parameters.

3. `CodeBook.md` describes the variable names of the data set that results from the source code.

### The data set
The data set "Human Activity Recognition Using Smartphones" has been taken from [UCI's Machine Learning Repository](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

The data set was downloaded and unzipped to its default folder named `UCI HAR Dataset`.

###   Description of `run_analysis.R`:
1. Merge the training set and the test set to create a single data set.
     * Assume the folder "UCI HAR Dataset" is in the working directory (check with getwd())
     * Read all the relevant files into a list of tables. (named RAW)
     * Use 'rbind()' for merging; assure to keep all the data in the same order.
          * Ensure the training data set is above or stands in forefront of the test data set
     for each 'rbind()' call.
          * rbind the data
          * rbind the subjects
          * rbind the activity numbers
2. Extract the measurement on the mean and the standard deviation for
   each measurement.
     * Create a variable for all labels (check features.txt)
     * Search for labels with "`std(`" or "`mean(`" (that way meanFreq is omitted...)
     * Replace all default column names (V1, V2...) with the appropriate labels.
3. Use descriptive activity names to name the activities in the data set.
     * Map the activity numbers to activity names 
     * Ascertain to keep the correct order
4. Appropriately label the data set with descriptive variable names.
     * Remove (gsub) all punctuation
     * Capitalize std and mean
     * Fix the BodyBody to Body (label error)
5. Create a second, independent tidy data set with the average of each
   variable for each activity and for each subject.
     * cbind subjects, activities and data into one data set. 
     * aggregate the data by taking the mean of each column subsetted by the subject and by the activity at second.
     * save the result into a file
     * The data is considered tidy because there is one set of independent measurements for each subject/activity pair.

The result of the execution is a file (`tidy.txt`) storing the data (mean and standard deviation of each measurement per subject/activity) for later analysis.

It can be read in using the R command:<br>
`TIDY <- read.table("TIDY.txt")`
