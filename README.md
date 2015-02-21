## Getting-Cleaning-Data-Project
This repository holds the files associated with the class project for the Coursera Course, "Getting and Cleaning Data"

The assignment asks the student to practice skills necessary in getting and cleaning data to be used in future data analysis.
The directions for the project and as follows:

##PURPOSE

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

##FILE ARCHIVES USED

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

##DIRECTIONS FOR ASSIGNMENT

 You should create one R script called run_analysis.R that does the following. 
Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement. 
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names. 
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##  EXPLANATION OF run.analysis.R

###Part 1. Merge the training and the test sets to create one data set.

A. First the test data sets and the train datasets are read from the working directory which must be set to the correct file location. The following 3 files are read and bound by column into a data table named "TrainData":

-subject_train.txt

-x_train.txt

-y_train.txt

B. Next the following 3 files are read and bound by column into a data table named "TestData":

-subject_test.txt

-x_test.txt

-y_test.txt

C. Column Names are assigned to the data as derived from the following file: (Project Objective 3)

-features.txt

D. The train files and the test files are then bound by row to make a data set named "ProjectData". (Project Objective 1)

E. Descriptive activity names are applied to "ProjectData from the following file: (Project Objective 4)

-activities_label.txt

###Part 2.

A. Extract only the measurements on the mean and standard deviation for each measurement. (Project Objective 2) 

B. Tidy the dataset such that each variable is a column, each observation is a row, and each type of observational unit is a table. 

C. The resulting data set is named "TidyMeanSD".

###Part 3. Create a second, independent tidy data set with the average of each variable for each activity and each subject.
                  This dataset is saved as "TidyDataSet.txt"

