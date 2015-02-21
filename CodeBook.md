## Code Book
## Getting and Cleaning Data Class Project


### Data Description 
The data for this project comes from the UCI Maching Learning Repository. Extenxive information about the variables used and their measurement can be found at (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

"Data Set Information:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain."
The source data can be found here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


### Attribute Information
For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

### Data Transformation and Cleaning

## Part 1. Merge the training and the test sets to create one data set.

A.  First the test data sets and the train datasets are read from the working directory which must be set to the correct file location.
The following 3 files are read and bound by column into a data table named "TrainData":
- subject_train.txt
- x_train.txt
- y_train.txt

B.  Next the following 3 files are read and bound by column into a data table named "TestData":
- subject_test.txt
- x_test.txt
- y_test.txt

C.  Column Names are assigned to the data as derived from the following file: (Project Objective 3)
- features.txt
  

D. The train files and the test files are then bound by row to make a data set named "ProjectData". (Project Objective 1)

E.  Descriptive activity names are applied to "ProjectData from the following file:  (Project Objective 4)
- activities_label.txt

## Part 2. 
A. Extract only the measurements on the mean and standard deviation for each measurement. (Project Objective 2)
B. Tidy the dataset such that each variable is a column, each observation is a row, and each type of observational unit
is a table.
C. The resulting data set is named "TidyMeanSD".

## Part 3. Create a second, independent tidy data set with the average of each variable for each activity and each subject. 
            This dataset is saved as "TidyDataSet.txt"
