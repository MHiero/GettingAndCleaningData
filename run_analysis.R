###################################################################################
##
## DESCRIPTION:
## 1. Merge training set and test set to create one set of data.
## 2. Use descriptive activity names to name the activities in the data set.
## 3. Extract measurements on the mean and standard deviation for each measurement.
## 4. Label the data set with descriptive variable names.
## 5. Create a second, tidy data set with the average of each variable for each 
##    activity and each subject.
##
## DEVELOPER : MHiero
## $DATE : Wed Aug 20 10:38:30 2014
## REVISION : 0.99 
## IDE : Rstudio, Version 0.98.1017
##     : R version 3.1.0 (2014-04-10) "Spring Dance"
## Copyrights : Copyright (c) 2014 E. J. Hopkins
## FILENAME : run_analysis.R
## OUTPUT   : TIDY.txt
## DEPENDENCIES : Folder 'UCI HAR Dataset' 
## 
##################################################################################
## BEGIN CODE
#PREREQUISITE: "./UCI HAR Dataset" is in the working directory
data_directory <- "UCI HAR dataset"
if (!file.exists(data_directory)){
  error_message <- paste("There is no directory called ", data_directory)
  print(error_message)
}

##Import data

FILES <- list("UCI HAR Dataset/train/X_train.txt", # RAW[1], data
              "UCI HAR Dataset/test/X_test.txt", # RAW[2], data
              "UCI HAR Dataset/features.txt", # RAW[3], data labels
              "UCI HAR Dataset/activity_labels.txt", # RAW[4]
              "UCI HAR Dataset/train/subject_train.txt", # RAW[5], subjects
              "UCI HAR Dataset/test/subject_test.txt", # RAW[6], subjects
              "UCI HAR Dataset/train/y_train.txt", # RAW[7], activities
              "UCI HAR Dataset/test/y_test.txt") # RAW[8], activities
RAW <- sapply(FILES,read.table,simplify=FALSE) # Read in all files

###################################################################################
## 1. Merge the training and the test sets to create one data set.
allDATA <- rbind(RAW[[1]],RAW[[2]]) 
Subject <- rbind(RAW[[5]],RAW[[6]]) 
ActNumber <- rbind(RAW[[7]],RAW[[8]]) 

###################################################################################
##2. Use descriptive activity names to name the activities in the data set.
ActNumFact <- as.factor(ActNumber$V1) # to rename, must be factor
# Rename Activity levels (keep correct order)
levels(ActNumFact) <- as.vector(RAW[[4]]$V2)

###################################################################################
## 3. Extract only the measurements on the mean and standard deviation for each
## measurement.
VarNames <- RAW[[3]]$V2 # Create a variable containing labels
# Use "(" as part of the search so it doesn't find meanFreq
Nidx <- grep("(mean\\(|std\\())",VarNames)
names(allDATA)[Nidx] <- as.character(VarNames[Nidx]) # replace column names
tmpDATA <- allDATA[Nidx] # New data set with only "std()" and "mean()" columns

###################################################################################
## 4. Appropriately label the data set with descriptive variable names.
VarNAMES <- names(tmpDATA)
VarNAMES <- gsub("[[:punct:]]","",VarNAMES) # Remove punctuation
VarNAMES <- gsub("std","Std",VarNAMES) # Capitalize std
VarNAMES <- gsub("mean","Mean",VarNAMES) # Capitalize mean
VarNAMES <- gsub("BodyBody","Body",VarNAMES) # Fix typo of "BodyBody" to "Body"
names(tmpDATA) <- VarNAMES
DATA <- cbind(Subject,ActNumFact,tmpDATA) # This is the working data set.
rm(list=setdiff(ls(),"DATA")) # Remove all other variables
names(DATA)[[1]] <- "Subject" # Name the 1st and 2nd columns
names(DATA)[[2]] <- "Activity"

##################################################################################
## 5. Create a second, independent tidy data set with the average of each
## variable for each activity and each subject.
TIDY <- aggregate(DATA[,-1:-2],list(Subject=DATA$Subject,
                                    Activity=DATA$Activity),mean)
write.table(TIDY,file="TIDY.txt", row.name=FALSE)

## END CODE
##################################################################################




                                                                                                            #MH#
