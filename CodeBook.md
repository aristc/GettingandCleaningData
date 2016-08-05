#CodeBook of run_analysis.r

## Raw Data

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

View READ ME for more information on this dataset.

## Instructions

You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Variables created

activityLabels : characters extracted from activity_labels.txt
featuresLabels : characters extracted from features.txt

## Data tables created

allData : combines test and training data sets 
meanstdData: allData filtered with columns containing only "mean" and "std"
avgData : meanstdData summarised by subject and activity

## Intermediary tables (do not appear in final results)

1. to build labels
activity : reads "activity_labels.txt"
features : reads "features.txt"

2. to build allData
Xtest : reads "X_test.txt"
Ytest: reads "y_test.txt"
subjecttest : reads "subject_test.txt"

Xtrain: reads "X_train.txt"
Ytrain : reads "y_train.txt"
subjecttrain : reads "subject_train.txt"

testData : cbind(Xtest,Ytest,subjecttest)
trainData : cbind(Xtrain,Ytrain,subjectrain)

allData : rbind(testData,trainData)

