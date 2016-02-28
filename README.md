# Getting and Cleaning Data

## Introduction
 
This repository contains the R code for the final project of the Getting And Cleaning Data course of the Data Science Specialization of Coursera. 

The project consists on take the data collected from the accelerometers from the Samsung Galaxy S smartphone ([more information here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)) and do the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.



## Steps to work on this course project

1. Download [the data source](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and put it into your R Working Directory.
2. Download ```run_analysis.R``` and put it in your R Working directory
3. Run ```source("run_analysis.R")```.
4. The script will create the file ```tiny_data.txt``` and put it in your R working directory.

