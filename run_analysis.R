## You should create one R script called run_analysis.R that does the following.

## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names.
## 5. From the data set in step 4, creates a second, independent tidy data set with the
##    average of each variable for each activity and each subject.


## Download the data and put it into the /ucidat folder
if(!file.exists("./ucidat")){dir.create("./ucidat")}
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
f <- file.path(getwd(), "ucidat", "Dataset.zip")
download.file(fileurl, f, method = "curl")

## Unzip downloaded zip file to /ucidat folder
unzip(zipfile = f, exdir = "./ucidat")

## Check if required packages are installed 
if (!require("reshape2")) {
  install.packages("reshape2")
}
if (!require("data.table")) {
  install.packages("data.table")
}
if (!require("dplyr")) {
  install.packages("dplyr")
}
if (!require("tidyr")) {
  install.packages("tidyr")
}
## Load required packages
library(reshape2)
library(data.table)
library(dplyr)
library(tidyr)

## Path to dataset
path_uci <- file.path(getwd(), "ucidat", "UCI HAR Dataset")

##  List of all files in UCI HAR Dataset folder
all_files <- list.files(path_uci, recursive = TRUE)

## Read Readme.txt which has all needed information on the usable dataset
## features.txt : List of all features with names of all columns to be used.
## activity_labels.txt: Links the class labels with their activity name.

### TRAINING SETS ###
## train/X_train.txt: Training set.
## train/y_train.txt: Training labels.

### TEST SETS ###
## test/X_test.txt: Test set.
## test/y_test.txt: Test labels.

  ## Read features data  
  features <- tbl_df(read.table(file.path(path_uci,  "features.txt")))
  ## str(features)
  ## Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	561 obs. of  2 variables:
  ##  $ V1: int  1 2 3 4 5 6 7 8 9 10 ...
  ##  $ V2: Factor w/ 477 levels "angle(tBodyAccJerkMean,gravityMean)",..: 243 244 245 250 251 252 237 238 239 240 ...

  ## Read activity labels  
  a_l <- tbl_df(read.table(file.path(path_uci, "activity_labels.txt")))
  ## str(a_l)
  ##  Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	6 obs. of  2 variables:
  ##  $ V1: int  1 2 3 4 5 6
  ##  $ V2: Factor w/ 6 levels "LAYING","SITTING",..: 4 6 5 2 3 1
  
  ## Read activity data
  activity_train <- tbl_df(read.table(file.path(path_uci, "train", "X_train.txt")))
  activity_test  <- tbl_df(read.table(file.path(path_uci, "test", "X_test.txt")))
  ## str(ActivityTrain)
  ## Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	7352 obs. of  561 variables:
  ## str(ActivityTest)
  ## Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	2947 obs. of  561 variables:

  ## Read activity class labels  
  class_train <- tbl_df(read.table(file.path(path_uci, "train", "y_train.txt")))
  class_test  <- tbl_df(read.table(file.path(path_uci, "test", "y_test.txt")))
  ## str(ClassTrain)
  ## Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	7352 obs. of  1 variable:
  ##  $ V1: int  5 5 5 5 5 5 5 5 5 5 ...
  ## str(ClassTest)
  ## Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	2947 obs. of  1 variable:
  ##  $ V1: int  5 5 5 5 5 5 5 5 5 5 ...
  
  ## Read subject data
  subject_train <- tbl_df(read.table(file.path(path_uci, "train", "subject_train.txt")))
  subject_test  <- tbl_df(read.table(file.path(path_uci, "test", "subject_test.txt")))
  ## str(SubjectTrain)
  ## Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	7352 obs. of  1 variable:
  ##  $ V1: int  1 1 1 1 1 1 1 1 1 1 ...
  ## str(SubjectTest)
  ## Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	2947 obs. of  1 variable:
  ##  $ V1: int  2 2 2 2 2 2 2 2 2 2 ...
  
  
  ## Bind training and test datasets
  activity <- rbind(activity_train, activity_test)
  class <- rbind(class_train, class_test)
  subject <- rbind(subject_train, subject_test)
  
  
  ## Name variables according to features properties
  setnames(features, names(features), c("feature.no", "feature.name"))
  
  ## Name variables of activity corresponding to features
  colnames(activity) <- features$feature.name
  
  ## Assign names to activity labels
  setnames(a_l, names(a_l), c("activity.no", "activity.name"))
  
   
  ## Assign names to columns in subject and activity class label datasets
  setnames(subject, "V1", "subject")
  setnames(class, "V1", "activity.no")
  
  ## Create one datatset by merging all columns 
  subject_class <- cbind(subject,class)
  subject_class_activity <- cbind(subject_class,activity)
  
  ## Extracts only the measurements on the mean() and std()  for each measurement
  sub_features <- features$feature.name[grep("mean\\(\\)|std\\(\\)",features$feature.name)]
  
  ## Consider only measurements of  the mean and standard deviation and name columns
  features_mean_std <- union(c("subject","activity.no"), sub_features)
  data_tbl <- subset(subject_class_activity, select=features_mean_std)
  
  ## Uses descriptive activity names to name the activities in the data set
  data_tbl <- merge(a_l, data_tbl, by="activity.no", all.x=TRUE) 
  data_tbl$activity.name <- as.character(data_tbl$activity.name)
  data_aggr<- aggregate(. ~ subject - activity.name, data = data_tbl, mean) 
  data_tbl<- tbl_df(arrange(data_aggr,subject,activity.name))
 
  ## Appropriately labels the data set with descriptive variable names 
  names(data_tbl)<-gsub("std()", "SD", names(data_tbl))
  names(data_tbl)<-gsub("mean()", "MEAN", names(data_tbl))
  names(data_tbl)<-gsub("^t", "time", names(data_tbl))
  names(data_tbl)<-gsub("^f", "frequency", names(data_tbl))
  names(data_tbl)<-gsub("Acc", "-Accelerometer", names(data_tbl))
  names(data_tbl)<-gsub("Gyro", "-Gyroscope", names(data_tbl))
  names(data_tbl)<-gsub("Mag", "-Magnitude", names(data_tbl))
  names(data_tbl)<-gsub("BodyBody", "Body", names(data_tbl))
  names(data_tbl)<-gsub("Jerk", "-Jerk", names(data_tbl)) 
  names(data_tbl)<-gsub("Body", "-Body", names(data_tbl))
  names(data_tbl)<-gsub("Gravity", "-Gravity", names(data_tbl))
  
  ## From the data set in previous step, creates a second, independent 
  ## tidy data set with the average of each variable for each activity and each subject
  write.table(data_tbl, "tidy_data.txt", row.name=FALSE)
  
                             