CodeBook  
This file has the description of the variables as well as a description of the manipulation done over the original data.  

ORIGINAL DATA  
The original data came from a research from UCI, here you can find more info about the project and the data   
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.   
Here is a short description of the data given by the authors “The experiments have been carried out with a group of 30 volunteers within 
an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING,  
LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial   
linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data  
manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the   
training data and 30% the test data”  

VARIABLES  
ID  -> A number that identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.  
Activity -> This indicate the activity that was done by the subject when the data was collected, it can be   
1 WALKING  
2 WALKING UPSTAIRS  
3 WALKING DOWNSTAIRS  
4 SITTING  
5 STANDING  
6 LAYING  

These signals were used to estimate variables of the feature vector for each pattern:  '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.  
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
The set of variables that were estimated and keeping from these signals are:   
mean(): Mean value  
std(): Standard deviation  

DATA MANIPULATION  
It was done several manipulations over the original data, to see the process you can check the script in the file run_analysis.R. First,  
it was merge the data from the test and training sets and created one data frame. Then, it was keeping only the variables that have mean   
and standard deviations, this was indicated by the names of the variables. Finally, it was group the data by the ID of the subject and   
the activity variable and calculated the mean for the variables that was keeping.   
