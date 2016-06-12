---
title: "**CodeBook.md**"
author: "**Arman Kirakosyan**"
date: "June 6, 2016"
output: html_document
---

## **Codebook for Getting and Cleaning Data Course Project**

This codebook emphasizes the importance of splitting data into training and test datasets. It also provides  the variables, the data and its subsequent manipulations to clean the data and bring it to comprehensible tidy form.

### Instructions for the project

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called **CodeBook.md**. You should also include a **README.md** in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this [article](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/). Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

Here are the data for the project:

<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

You should create one R script called **run_analysis.R** that does the following.

1. Merges the training and the test sets to create one data set.  
2. Extracts only the measurements on the mean and standard deviation for each measurement.  
3. Uses descriptive activity names to name the activities in the data set.  
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.  

### Traning and test datasets

Training set is a set of data used to discover potentially predictive relationships. A test set is a set of data used to assess the strength and utility of a predictive relationship. Test and training sets are used in intelligent systems, machine learning, genetic programming and statistics. 

Training sets are used to produce the model, while the test sets are for validation of the model. Data points in the training sets are usually excluded from the test sets to be able to validate the model built. 

### Description of the experimental data

The experiments have been carried out with a group of 30 volunteers (**subjects**) within an age bracket of 19-48 years. Each person performed six **activities** (*WALKING*, *WALKING_UPSTAIRS*, *WALKING_DOWNSTAIRS*, *SITTING*, *STANDING*, *LAYING*) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See '*features_info.txt*' for more details.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ  
tGravityAcc-XYZ  
tBodyAccJerk-XYZ  
tBodyGyro-XYZ  
tBodyGyroJerk-XYZ  
tBodyAccMag  
tGravityAccMag  
tBodyAccJerkMag  
tBodyGyroMag  
tBodyGyroJerkMag  
fBodyAcc-XYZ  
fBodyAccJerk-XYZ  
fBodyGyro-XYZ  
fBodyAccMag  
fBodyAccJerkMag  
fBodyGyroMag  
fBodyGyroJerkMag  

The set of variables that were estimated from these signals are: 

mean(): Mean value  
std(): Standard deviation  
mad(): Median absolute deviation   
max(): Largest value in array  
min(): Smallest value in array  
sma(): Signal magnitude area  
energy(): Energy measure. Sum of the squares divided by the number of values.  
iqr(): Interquartile range  
entropy(): Signal entropy  
arCoeff(): Autorregresion coefficients with Burg order equal to 4  
correlation(): correlation coefficient between two signals  
maxInds(): index of the frequency component with largest magnitude  
meanFreq(): Weighted average of the frequency components to obtain a mean frequency  
skewness(): skewness of the frequency domain signal   
kurtosis(): kurtosis of the frequency domain signal   
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.  
angle(): Angle between to vectors.  

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:


gravityMean  
tBodyAccMean  
tBodyAccJerkMean  
tBodyGyroMean  
tBodyGyroJerkMean  


### Files to be used in the project

1. features.txt: A 561-feature vector with time and frequency domain variables.  
2. activity_labels.txt: Links the class labels with their activity name, listed are six activities.  
3. Activity datasets
 + test/X_test.txt
 + train/X_train.txt
4. Activity class label datasets
+ test/y_test.txt
+ train/y_train.txt
5. Subject datasets: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.  
+ test/subject_test.txt  
+ train/subject_train.txt  

### Reading datasets to create data tables
`` path_uci <- file.path(getwd(), "ucidat", "UCI HAR Dataset") ``  

*# Read features data*  
``features <- tbl_df(read.table(file.path(path_uci,  "features.txt")))``

*# Read activity labels*  
``ActivityLabels <- tbl_df(read.table(file.path(path_uci,  "activity_labels.txt")))``

*# Read activity data*  
``ActivityTrain <- tbl_df(read.table(file.path(path_uci, "train", "X_train.txt")))``
``ActivityTest  <- tbl_df(read.table(file.path(path_uci, "test", "X_test.txt")))``

*# Read activity class labels data*  
``ClassTrain <- tbl_df(read.table(file.path(path_uci, "train", "y_train.txt")))``
``ClassTest  <- tbl_df(read.table(file.path(path_uci, "test", "y_test.txt")))``

*# Read subject data*  
``SubjectTrain <- tbl_df(read.table(file.path(path_uci, "train", "subject_train.txt")))``
``SubjectTest  <- tbl_df(read.table(file.path(path_uci, "test", "subject_test.txt")))``

### Properties of the variables
``str(features)``  
``561 obs. of  2 variables:``  
``$ V1: int  1 2 3 4 5 6 7 8 9 10 ...``  
``$ V2: Factor w/ 477 levels "angle(tBodyAccJerkMean,gravityMean)",..: 243 244 245 250 251 252 237 238 239 240 ...``

``str(ActivityLabels)``  
``6 obs. of  2 variables:``  
``$ V1: int  1 2 3 4 5 6``  
``$ V2: Factor w/ 6 levels "LAYING","SITTING",..: 4 6 5 2 3 1``

``str(ActivityTrain)``  
``7352 obs. of  561 variables:``  
``str(ActivityTest)``  
``2947 obs. of  561 variables:``  

``str(ClassTrain)``  
``7352 obs. of  1 variable:``  
``str(ClassTest)``  
``2947 obs. of  1 variable:``  

``str(SubjectTrain)``  
``7352 obs. of  1 variable:``  
``str(SubjectTest)``  
``2947 obs. of  1 variable:`` 

## Step 1. Merging the training and the test sets to create one data set.  

### Bind training and test datasets.  
``activity <- rbind(activity_train, activity_test)``   
``class <- rbind(class_train, class_test)``     
``subject <- rbind(subject_train, subject_test)``  

### Name variables according to features properties  
``setnames(features, names(features), c("feature.no", "feature.name"))``  

### Name variables of activity corresponding to features
``colnames(activity) <- features$feature.name``
  
### Assign names to activity labels  
``setnames(a_l, names(a_l), c("activity.no", "activity.name"))``  
  
### Assign names to columns in subject and activity class label datasets  
``setnames(subject, "V1", "subject")``  
``setnames(class, "V1", "activity.no")``  

### Create one datatset by merging all columns  
``subject_class <- cbind(subject,class)``
``subject_class_activity <- cbind(subject_class,activity)``  

## Step 2. Extracts only the measurements on the mean() and std()  for each measurement  
``sub_features <- features$feature.name[grep("mean\\(\\)|std\\(\\)",features$feature.name)]``  

### Consider only measurements of  the mean and standard deviation and name columns
``features_mean_std <- union(c("subject","activity.no"), sub_features)``  
``data_tbl <- subset(subject_class_activity, select=features_mean_std)``  

## Step 3. Uses descriptive activity names to name the activities in the data set  
``data_tbl <- merge(a_l, data_tbl, by="activity.no", all.x=TRUE)``  
``data_tbl$activity.name <- as.character(data_tbl$activity.name)``  
``data_aggr<- aggregate(. ~ subject - activity.name, data = data_tbl, mean)``  
``data_tbl<- tbl_df(arrange(data_aggr,subject,activity.name))``  
 
## Step 4. Appropriately labels the data set with descriptive variable names  
``names(data_tbl)<-gsub("std()", "SD", names(data_tbl))`` ``names(data_tbl)<-gsub("mean()", "MEAN", names(data_tbl))``    
``names(data_tbl)<-gsub("^t", "time", names(data_tbl))``  
``names(data_tbl)<-gsub("^f", "frequency", names(data_tbl))``  
``names(data_tbl)<-gsub("Acc", "-Accelerometer", names(data_tbl))``  
``names(data_tbl)<-gsub("Gyro", "-Gyroscope", names(data_tbl))``  
``names(data_tbl)<-gsub("Mag", "-Magnitude", names(data_tbl))``  
``names(data_tbl)<-gsub("BodyBody", "Body", names(data_tbl))``  
``names(data_tbl)<-gsub("Jerk", "-Jerk", names(data_tbl))``  
``names(data_tbl)<-gsub("Body", "-Body", names(data_tbl))``  
``names(data_tbl)<-gsub("Gravity", "-Gravity", names(data_tbl))``  
  
## Step 5. From the data set in previous step, creates a second, independent tidy data set with the average of each variable for each activity and each subject  
``write.table(data_tbl, "tidy_data.txt", row.name=FALSE)``    

``str(data_tbl)``  
``Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	180 obs. of  69 variables:``  
``$ subject                                           : int  1 1 1 1 1 1 2 2 2 2 ...``
``$ activity.name                                     : chr  "LAYING" "SITTING" "STANDING" "WALKING" ...``  
`` $ activity.no                                       : num  6 4 5 1 3 2 6 4 5 1 ...``  
`` $ time-Body-Accelerometer-MEAN()-X                  : num  0.222 0.261 0.279 0.277 0.289 ...``  
`` $ time-Body-Accelerometer-MEAN()-Y                  : num  -0.04051 -0.00131 -0.01614 -0.01738 -0.00992 ...``  
`` $ time-Body-Accelerometer-MEAN()-Z                  : num  -0.113 -0.105 -0.111 -0.111 -0.108 ...``  
 ``$ time-Body-Accelerometer-SD()-X                    : num  -0.928 -0.977 -0.996 -0.284 0.03 ...``  
 ``$ time-Body-Accelerometer-SD()-Y                    : num  -0.8368 -0.9226 -0.9732 0.1145 -0.0319 ...``  
 ``$ time-Body-Accelerometer-SD()-Z                    : num  -0.826 -0.94 -0.98 -0.26 -0.23 ...``  
 ``$ time-Gravity-Accelerometer-MEAN()-X               : num  -0.249 0.832 0.943 0.935 0.932 ...``  
`` $ time-Gravity-Accelerometer-MEAN()-Y               : num  0.706 0.204 -0.273 -0.282 -0.267 ...``  
`` $ time-Gravity-Accelerometer-MEAN()-Z               : num  0.4458 0.332 0.0135 -0.0681 -0.0621 ...``  
`` $ time-Gravity-Accelerometer-SD()-X                 : num  -0.897 -0.968 -0.994 -0.977 -0.951 ...``    
`` $ time-Gravity-Accelerometer-SD()-Y                 : num  -0.908 -0.936 -0.981 -0.971 -0.937 ...``  
`` $ time-Gravity-Accelerometer-SD()-Z                 : num  -0.852 -0.949 -0.976 -0.948 -0.896 ...``  
`` $ time-Body-Accelerometer-Jerk-MEAN()-X             : num  0.0811 0.0775 0.0754 0.074 0.0542 ...``  
`` $ time-Body-Accelerometer-Jerk-MEAN()-Y             : num  0.003838 -0.000619 0.007976 0.028272 0.02965 ...``  
`` $ time-Body-Accelerometer-Jerk-MEAN()-Z             : num  0.01083 -0.00337 -0.00369 -0.00417 -0.01097 ...``  
`` $ time-Body-Accelerometer-Jerk-SD()-X               : num  -0.9585 -0.9864 -0.9946 -0.1136 -0.0123 ...``  
`` $ time-Body-Accelerometer-Jerk-SD()-Y               : num  -0.924 -0.981 -0.986 0.067 -0.102 ...``  
`` $ time-Body-Accelerometer-Jerk-SD()-Z               : num  -0.955 -0.988 -0.992 -0.503 -0.346 ...``  
`` $ time-Body-Gyroscope-MEAN()-X                      : num  -0.0166 -0.0454 -0.024 -0.0418 -0.0351 ...``  
`` $ time-Body-Gyroscope-MEAN()-Y                      : num  -0.0645 -0.0919 -0.0594 -0.0695 -0.0909 ...``  
`` $ time-Body-Gyroscope-MEAN()-Z                      : num  0.1487 0.0629 0.0748 0.0849 0.0901 ...``  
`` $ time-Body-Gyroscope-SD()-X                        : num  -0.874 -0.977 -0.987 -0.474 -0.458 ...``  
`` $ time-Body-Gyroscope-SD()-Y                        : num  -0.9511 -0.9665 -0.9877 -0.0546 -0.1263 ...``  
`` $ time-Body-Gyroscope-SD()-Z                        : num  -0.908 -0.941 -0.981 -0.344 -0.125 ...``  
`` $ time-Body-Gyroscope-Jerk-MEAN()-X                 : num  -0.1073 -0.0937 -0.0996 -0.09 -0.074 ...``  
`` $ time-Body-Gyroscope-Jerk-MEAN()-Y                 : num  -0.0415 -0.0402 -0.0441 -0.0398 -0.044 ...``  
`` $ time-Body-Gyroscope-Jerk-MEAN()-Z                 : num  -0.0741 -0.0467 -0.049 -0.0461 -0.027 ...``  
`` $ time-Body-Gyroscope-Jerk-SD()-X                   : num  -0.919 -0.992 -0.993 -0.207 -0.487 ...``  
`` $ time-Body-Gyroscope-Jerk-SD()-Y                   : num  -0.968 -0.99 -0.995 -0.304 -0.239 ...``  
`` $ time-Body-Gyroscope-Jerk-SD()-Z                   : num  -0.958 -0.988 -0.992 -0.404 -0.269 ...``  
`` $ time-Body-Accelerometer-Magnitude-MEAN()          : num  -0.8419 -0.9485 -0.9843 -0.137 0.0272 ...``  
`` $ time-Body-Accelerometer-Magnitude-SD()            : num  -0.7951 -0.9271 -0.9819 -0.2197 0.0199 ...``  
`` $ time-Gravity-Accelerometer-Magnitude-MEAN()       : num  -0.8419 -0.9485 -0.9843 -0.137 0.0272 ...``  
`` $ time-Gravity-Accelerometer-Magnitude-SD()         : num  -0.7951 -0.9271 -0.9819 -0.2197 0.0199 ...``  
`` $ time-Body-Accelerometer-Jerk-Magnitude-MEAN()     : num  -0.9544 -0.9874 -0.9924 -0.1414 -0.0894 ...``  
`` $ time-Body-Accelerometer-Jerk-Magnitude-SD()       : num  -0.9282 -0.9841 -0.9931 -0.0745 -0.0258 ...``  
`` $ time-Body-Gyroscope-Magnitude-MEAN()              : num  -0.8748 -0.9309 -0.9765 -0.161 -0.0757 ...``  
`` $ time-Body-Gyroscope-Magnitude-SD()                : num  -0.819 -0.935 -0.979 -0.187 -0.226 ...``  
`` $ time-Body-Gyroscope-Jerk-Magnitude-MEAN()         : num  -0.963 -0.992 -0.995 -0.299 -0.295 ...``  
`` $ time-Body-Gyroscope-Jerk-Magnitude-SD()           : num  -0.936 -0.988 -0.995 -0.325 -0.307 ...``  
`` $ frequency-Body-Accelerometer-MEAN()-X             : num  -0.9391 -0.9796 -0.9952 -0.2028 0.0382 ...``  
`` $ frequency-Body-Accelerometer-MEAN()-Y             : num  -0.86707 -0.94408 -0.97707 0.08971 0.00155 ...``  
`` $ frequency-Body-Accelerometer-MEAN()-Z             : num  -0.883 -0.959 -0.985 -0.332 -0.226 ...``  
`` $ frequency-Body-Accelerometer-SD()-X               : num  -0.9244 -0.9764 -0.996 -0.3191 0.0243 ...``  
`` $ frequency-Body-Accelerometer-SD()-Y               : num  -0.834 -0.917 -0.972 0.056 -0.113 ...``  
`` $ frequency-Body-Accelerometer-SD()-Z               : num  -0.813 -0.934 -0.978 -0.28 -0.298 ...``  
`` $ frequency-Body-Accelerometer-Jerk-MEAN()-X        : num  -0.9571 -0.9866 -0.9946 -0.1705 -0.0277 ...``  
`` $ frequency-Body-Accelerometer-Jerk-MEAN()-Y        : num  -0.9225 -0.9816 -0.9854 -0.0352 -0.1287 ...``  
`` $ frequency-Body-Accelerometer-Jerk-MEAN()-Z        : num  -0.948 -0.986 -0.991 -0.469 -0.288 ...``  
`` $ frequency-Body-Accelerometer-Jerk-SD()-X          : num  -0.9642 -0.9875 -0.9951 -0.1336 -0.0863 ...``  
`` $ frequency-Body-Accelerometer-Jerk-SD()-Y          : num  -0.932 -0.983 -0.987 0.107 -0.135 ...``  
`` $ frequency-Body-Accelerometer-Jerk-SD()-Z          : num  -0.961 -0.988 -0.992 -0.535 -0.402 ...``  
`` $ frequency-Body-Gyroscope-MEAN()-X                 : num  -0.85 -0.976 -0.986 -0.339 -0.352 ...``  
`` $ frequency-Body-Gyroscope-MEAN()-Y                 : num  -0.9522 -0.9758 -0.989 -0.1031 -0.0557 ...``  
`` $ frequency-Body-Gyroscope-MEAN()-Z                 : num  -0.9093 -0.9513 -0.9808 -0.2559 -0.0319 ...``  
`` $ frequency-Body-Gyroscope-SD()-X                   : num  -0.882 -0.978 -0.987 -0.517 -0.495 ...``  
`` $ frequency-Body-Gyroscope-SD()-Y                   : num  -0.9512 -0.9623 -0.9871 -0.0335 -0.1814 ...``  
`` $ frequency-Body-Gyroscope-SD()-Z                   : num  -0.917 -0.944 -0.982 -0.437 -0.238 ...``  
`` $ frequency-Body-Accelerometer-Magnitude-MEAN()     : num  -0.8618 -0.9478 -0.9854 -0.1286 0.0966 ...``  
`` $ frequency-Body-Accelerometer-Magnitude-SD()       : num  -0.798 -0.928 -0.982 -0.398 -0.187 ...``  
`` $ frequency-Body-Accelerometer-Jerk-Magnitude-MEAN(): num  -0.9333 -0.9853 -0.9925 -0.0571 0.0262 ...``  
`` $ frequency-Body-Accelerometer-Jerk-Magnitude-SD()  : num  -0.922 -0.982 -0.993 -0.103 -0.104 ...``  
`` $ frequency-Body-Gyroscope-Magnitude-MEAN()         : num  -0.862 -0.958 -0.985 -0.199 -0.186 ...``  
`` $ frequency-Body-Gyroscope-Magnitude-SD()           : num  -0.824 -0.932 -0.978 -0.321 -0.398 ...``  
`` $ frequency-Body-Gyroscope-Jerk-Magnitude-MEAN()    : num  -0.942 -0.99 -0.995 -0.319 -0.282 ...``  
`` $ frequency-Body-Gyroscope-Jerk-Magnitude-SD()      : num  -0.933 -0.987 -0.995 -0.382 -0.392 ...``  


