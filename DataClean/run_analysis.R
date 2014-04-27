## Coursera -- Getting and Cleaning Data
## Peer Assignment
## Mort Goldman
## 
##############################################################################################
#  The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. 
#  The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers 
#  on a series of yes/no questions related to the project. You will be required to submit: 
#    1)  a tidy data set as described below, 
#    2)  a link to a Github repository with your script for performing the analysis, and 
#    3a) a code book that describes the variables, the data, and any transformations or work 
#        that you performed to clean up the data called CodeBook.md. 
#    3b) You should also include a README.md in the repo with your scripts. This repo explains 
#        how all of the scripts work and how they are connected.
##############################################################################################
#  You should create one R script called run_analysis.R that does the following. 
#  1.  Merges the training and the test sets to create one data set.
#  2.  Extracts only the measurements on the mean and standard deviation for each measurement. 
#  3.  Uses descriptive activity names to name the activities in the data set
#  4.  Appropriately labels the data set with descriptive activity names. 
#  5.  Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
##############################################################################################
## Step -1:  clear workspace and set working directory
rm(list=ls())
getwd()
setwd("UCI HAR Dataset")
dir()   # make sure this directory holds the source data files

## Step 0:  Read in source files

##    First we have two "reference tables"

##    Actvity labels:
activities <- read.csv("activity_labels.txt", col.names=c("ActivityID","ActivityName"),sep=" ", header=FALSE)

##    and list of column names used in thr "X" tables
XColumnNames <- read.table("features.txt", header=FALSE, sep=" ", stringsAsFactors=FALSE) 
XColumnNames = XColumnNames[,2]   #  ## keeping just the Names

##    Next we have the observations split into Train and Test datasets that capture:
##        "X"       -- 561 features for each observation
##        "Y"       -- the activity code for each observation
##        "Subject" -- the subject id for each observation

##    Note there are 7,352 training observations and 2,947 test observations

## the "X" files contain 561 columns each of type numeric (16 bytes) 
xTest  = read.table("test/x_test.txt",col.names=XColumnNames,comment.char="",stringsAsFactors=FALSE)
xTrain = read.table("train/x_train.txt",col.names=XColumnNames,comment.char="",stringsAsFactors=FALSE)

## reset the column names as they appear to be elided:
names(xTest) <- XColumnNames
names(xTrain) <- XColumnNames

## the "Y" files contain the  single column of the ActivityLabel for each observation
yTest  = read.table("test/y_test.txt",  col.names=c("ActivityID"),colClasses=c("factor"),comment.char="",stringsAsFactors=FALSE)
yTrain = read.table("train/y_train.txt",col.names=c("ActivityID"),colClasses=c("factor"),comment.char="",stringsAsFactors=FALSE)

## the Subject files consist of a single column "SubjectID"
subjTest  = read.table("test/subject_test.txt",  col.names=c("SubjectID"),comment.char="",stringsAsFactors=FALSE)
subjTrain = read.table("train/subject_train.txt",  col.names=c("SubjectID"),comment.char="",stringsAsFactors=FALSE)

## Step 1:  Merge the training and the test sets to create one data set.
xAll <- rbind(xTrain,xTest)
yAll <- rbind(yTrain,yTest)
subjAll <- rbind(subjTrain,subjTest)

## Step 2:  Extract only the measurements on the mean and standard deviation for each measurement. 

## Hope I understand spec correctly -- I am finding any features / column names that 
## include "mean()" or "std()" in their name.
muXColIds <- grep("mean\\(\\)",XColumnNames)
sdXColIds <- grep("std\\(\\)", XColumnNames)
xAllMuSigma <- xAll[,c(muXColIds, sdXColIds)]

## Step 3:  Use descriptive activity names to name the activities in the data set
yAll$ActivityLabel <- factor(yAll$ActivityID, levels=c(1,2,3,4,5,6),labels=activities$ActivityName)


## Step 4:  Appropriately label the data set with descriptive activity names. 
##          I am confused by this step -- didn't I already accomplish this with Step 3?


## Step 5.  Create a second, independent tidy data set with the average of each variable for each activity and each subject.
subjXYAll <- cbind(subjAll,yAll,xAllMuSigma)
aggData <- aggregate(subjXYAll, by=list(subjXYAll$SubjectID,subjXYAll$ActivityLabel), FUN=mean, na.rm=TRUE)

## drop the extra copies of activity and subject columns
aggData <- aggData[ -c(3:5)]

## and rename grouping columns
library(plyr)
aggData <- rename(aggData, c("Group.1"="Subject","Group.2"="Activity"))

## run a few tests just to check that results seem ok:
## note I manually compared a handful of means, but should probably add more automated unit tests
aggData[aggData$Subject == 1,c(1:3) ]
mean(subjXYAll[subjXYAll$SubjectID == 1 & subjXYAll$ActivityID == 1, c(4)], na.rm = TRUE)
mean(subjXYAll[subjXYAll$SubjectID == 1 & subjXYAll$ActivityID == 2, c(4)], na.rm = TRUE)
mean(subjXYAll[subjXYAll$SubjectID == 1 & subjXYAll$ActivityID == 3, c(4)], na.rm = TRUE)
mean(subjXYAll[subjXYAll$SubjectID == 1 & subjXYAll$ActivityID == 4, c(4)], na.rm = TRUE)
mean(subjXYAll[subjXYAll$SubjectID == 1 & subjXYAll$ActivityID == 5, c(4)], na.rm = TRUE)
mean(subjXYAll[subjXYAll$SubjectID == 1 & subjXYAll$ActivityID == 6, c(4)], na.rm = TRUE)

## Step 6:  write out results
write.csv(aggData, file="tidyData.csv")

