setwd("C:/Users/admin/Desktop/Coursera/Assignments/DataCleaning W4/UCI HAR Dataset")


## 1. Merge the training and the test sets to create one data set.


features<-read.table("features.txt")
activity<-read.table("activity_labels.txt")
featuresLabels<-as.character(features$V2)
activityLabels<-as.character(activity$V2)

## a. Prepare train data

    ## a.a Add features labels to column names of X_train
    Xtrain<-read.table("./train/X_train.txt")
    names(Xtrain)<-featuresLabels

    ## a.b Add column label to Y_train, make values as factor 
    ## and allocate activitylabels as factor levels to have text
    Ytrain<-read.table("./train/y_train.txt")
    names(Ytrain)<-"Activity"
    Ytrain$Activity<-as.factor(Ytrain$Activity)
    levels(Ytrain$Activity)<-activityLabels

    ## a.c Add column label to subject_train  and make it a factor
    subjecttrain<-read.table("./train/subject_train.txt")
    names(subjecttrain)<-"Subject"
    subjecttrain$Subject<-as.factor(subjecttrain$Subject)

    ## a.d Combine the three sets to get the train data
    trainData<-cbind(subjectTrain,Ytrain,Xtrain)
    
## b. Prepare test data
    
    ## b.a Add features labels to column names of X_test
    Xtest<-read.table("./test/X_test.txt")
    names(Xtest)<-featuresLabels
    
    ## b.b Add column label to Y_test, make values as factor 
    ## and allocate activitylabels as factor levels to have text
    Ytest<-read.table("./test/y_test.txt")
    names(Ytest)<-"Activity"
    Ytest$Activity<-as.factor(Ytest$Activity)
    levels(Ytest$Activity)<-activityLabels
    
    ## b.c Add column label to subject_test  and make it a factor
    subjecttest<-read.table("./test/subject_test.txt")
    names(subjecttest)<-"Subject"
    subjecttest$Subject<-as.factor(subjecttest$Subject)
    
    ## b.d Combine the three sets to get the test data
    testData<-cbind(subjecttest,Ytest,Xtest)
    
## c. Check the number of rows and columns
    
    nrow(trainData)==nrow(Xtrain)
    ncol(trainData)==ncol(Xtrain)+2
    nrow(testData)==nrow(Xtest)
    ncol(testData)==ncol(Xtest)+2
    
## d. Combine the two datasets
    
    allData<-rbind(testData,trainData)
    ## check
    ## nrow(allData)==nrow(trainData)+nrow(testData)
    
## e. Remove the intermediary data frames
    rm(Xtrain,Xtest,Ytrain,Ytest)
    rm(subjecttest,subjecttrain)
    rm(testData,trainData)
    rm(activity,features)
    
 
## 2. Extract only the measurements on the mean and standard deviation for each measurement.
    
    ## 2.a Create the table
     meanstdData<-allData[(1:2)|grep("mean[^A-Z]|std",names(allData))]
    ## 2. b. check the names
    names(meanstdData)
    ## 2.c Remove the previous table
    rm(allData)
    
## 3. Uses descriptive activity names to name the activities in the data set
    
    ## done in 1.a.b and 1.b.b
    
## 4. Appropriately labels the data set with descriptive variable names.
    
    ## done in 1.a.a and 1.b.a
    
## 5.  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
    
    ## 5.a Create the dataset
    
    library(dplyr)
    avgData<- meanstdData %>%
        group_by(Subject,Activity) %>%
        summarise_each(funs(mean))
    
    ## 5.b. Export the dataset as a txt file
    write.table(avgData,"tidydata.txt")
    
    
