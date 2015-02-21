###### Getting & Cleaning Data - Class Project
### Please read notes!!

#### Open the library packages needed for the analysis
library(dplyr)
library(tidyr)

####   Object: Merge the Training and Testing Datasets
####   In order to do this I set the correct working directory for the files to be read.  I then use a "for loop"
####     to read the files and bind them.  I like this method because it can be useful for instances when there are
####     a large number of files and it would be tedious to list them out one by one.  First I read and bind the train 
####     data by column, then I read and bind the test data by column. 

## Train Data
## Sets working directory and makes a list of the files contained for the Training set

setwd("/Users/cda3/GCD Project/Project Datasets/Train")
file_list <- list.files()

##   Reads the training files, binds them by column into a tbl_df called "TrainData"
for (file in file_list){
  
  # if the merged dataset doesn't exist, create it
  if (!exists("TrainData")){
    TrainData <- read.table(file, header=FALSE)
  }
  
  # if the merged dataset does exist, append to it
  if (exists("TrainData")){
    temp_dataset <-read.table(file, header=FALSE)
    TrainData<-cbind(TrainData, temp_dataset)
    rm(temp_dataset)
  }  
}
TrainData <- tbl_df(TrainData)

### Test Data  
### Repeats the procedure for the Test Data sets.
##  Reads the test files, binds them by column into a tbl_df called "TestData"

setwd("/Users/cda3/GCD Project/Project Datasets/Test")
file_list <- list.files()

for (file in file_list){
  
  # if the merged dataset doesn't exist, create it
  if (!exists("TestData")){
    TestData <- read.table(file, header=FALSE)
  }
  
  # if the merged dataset does exist, append to it
  if (exists("TestData")){
    temp_dataset <-read.table(file, header=FALSE)
    TestData<-cbind(TestData, temp_dataset)
    rm(temp_dataset)
  }  
}
TestData <- tbl_df(TestData)

### The Data sets have not yet been bound.  I will work out of order from the assignment steps with rationalle to follow.  
###  Before binding, I complete step 3 of the assignment: 
###  3. Uses descriptive activity names to name the activities in the data set and  
###  Rationalle: By naming the columns first, the bind_row function of dplyr ensures that the rows match precisely
###              when bound.

##  Read the label files 
setwd("/Users/cda3/GCD Project/UCI HAR Dataset")
features<- as.character(read.table("features.txt")[,2])
activity_labels <- read.table("activity_labels.txt")[,2]

##  Label the columbs with descriptive activity names
colnames(TrainData) <- c(list("subjectID","subjectID"),as.vector(features),list("activityID"))
colnames(TestData) <-  c(list("subjectID","subjectID"),as.vector(features),list("activityID"))

#### Bind the Train and Test Data together. This completes step 1 of the assignment:
###   1. Merges the training and the test sets to create one data set.
ProjectData <- bind_rows(TrainData,TestData)


###  Step 3: Uses descriptive activity names to name the activities in the data set
####  This is also out of order from the project directions but does no harm and allows me to
####       examine the dataset more accurately.

## Build a look-up table for activity values.  This correlates the number with the activity.
lutTemp<- as.character(activity_labels)
lut<- c("1"=lutTemp[1],"2"=lutTemp[2],"3"=lutTemp[3],"4"=lutTemp[4],"5"=lutTemp[5],"6"=lutTemp[6])

###  Assign descriptive activity names to the activities completing Step 3.
ProjectData$activityID <- lut[ProjectData$activityID]


#####  I now complete step 2:
####   Extract only the measurements on the mean and standard deviation for each measurement from Projectdata. 
####   I include the activityID and subjectID for ease in completing step 5.
####   Note that columns have already been named and the activities labeled.
####      tidyMeanSD  cleans the data set by putting one variable in every column ad one value in every row. 
####      tidyMeanSD is a 4 column data table.

MeanSD <- select(ProjectData,subjectID,activityID,contains("mean"), contains("std"),-contains("meanFreq"))
tidyMeanSD<- MeanSD %>% gather(activity,value,-subjectID,-activityID)


####  Step 5: From the data set in step 4, creates a second, independent tidy data set 
####          with the average of each variable for each activity and each subject.
####          The result is a dataframe with 4 columns named "TidyDataSet"


TidyDataSet <- tidyMeanSD %>% group_by(subjectID, activityID, activity) %>% summarize(avgActivity=mean(value))


### Write TidyDataSet to file
write.table(TidyDataSet, file= "TidyDataSet.txt", sep=" ", row.name=FALSE)
