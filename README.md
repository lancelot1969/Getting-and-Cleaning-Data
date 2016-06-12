---
title: "Getting and Cleaning Data"
output: html_document
---

To create tidy data set for wearable data computing by getting and cleaning data. Original source: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. Source to download relevant data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## List of files in the repo  

1. README.md  
2. **run_analysis.R**  
3. CodeBook.md  

## run_analysis.R: summary

* Code merges training and test datasets and creates one dataset  
* Extracts only measurements on the mean and standard deviation for each measurement  
* Uses descriptive activity names to name the activities in the data set  
* Appropriately labels the data set with descriptive variable names. 
* From the data set in previous step, creates a second, independent tidy data set with the average of each variable for each activity and each subject.  

## run_analysis.R: detailed description

* Download required files
* Unzip required files  
* Load required libraries: reshape2, data.table, dplyr, tidyr  
* Read features from features.txt  
* Read activity labels from activity_labels.txt
* Read activity data from train and test datasets respectively X_train.txt and X_test.txt  
* Read activity class labels from y_train.txt and y_test.txt  
* Read subject data subject_train.txt and subject_test.txt  
* Bind training and test datasets by rows  
* Assign names to variables according to features, activity and subject  
* Create one datatset by merging all columns  
* Extracts only the measurements on the mean() and std()  for each measurement  
* Use descriptive activity names to name the activities in the data set  
* Appropriately labels the data set with descriptive variable names  
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject  