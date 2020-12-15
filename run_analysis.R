library(dplyr)

#1. Merges the training and the test  sets to create one data set.

## load training files
train_data<- read.table("C:/Users/user/Desktop/run_analysis/UCI HAR Dataset/train/X_train.txt")
train_labels <-read.table("C:/Users/user/Desktop/run_analysis/UCI HAR Dataset/train/y_train.txt")
subject_ID_train<- read.table("C:/Users/user/Desktop/run_analysis/UCI HAR Dataset/train/subject_train.txt")

##load test files
test_data <- read.table("C:/Users/user/Desktop/run_analysis/UCI HAR Dataset/test/X_test.txt")
test_labels <-read.table("C:/Users/user/Desktop/run_analysis/UCI HAR Dataset/test/y_test.txt")
subject_ID_test<-read.table("C:/Users/user/Desktop/run_analysis/UCI HAR Dataset/test/subject_test.txt")

features_labels<-read.table("C:/Users/user/Desktop/run_analysis/UCI HAR Dataset/features.txt")

## merge train and test data sets
data_all <-rbind(test_data, train_data)
activity <-rbind(train_labels,test_labels)
subject_ID <-rbind(subject_ID_train, subject_ID_test)

## name variables with labels their labels
colnames(data_all) <- features_labels[,2] 

## create one dataframe with all data
merge_data<- cbind(subject_ID, activity, data_all)


####### 2. Extracts only the measurements on the mean and standard deviation for each measurement.

##look for variables names with the words "mean" or "std" and extract them
col_ok<-grep("mean|std",names(merge_data))
new_data<-merge_data[,c(1,2,col_ok)]


####### 3. Uses descriptive activity names to name the activities in the data set

## give descriptive labels for all levels of activity variable
new_data[,2] <-cut(new_data[,2], 6,labels = c("WALKING", "WALKING UPSTAIRS", "WALKING DOWNSTAIRS", 
                                                     "SITTING", "STANDING", "LAYING" ))


####### 4. Appropriately labels the data set with descriptive variable names.

## rename id and activity variables
new_data<-rename(new_data, "ID" = V1, "Activity" = V1.1 )

## remove () in the variables names
colnames(new_data)<-gsub("\\()", "", colnames(new_data))


####### 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

data_tidy <- new_data%>%
  group_by(ID, Activity)%>%
  summarise_all(mean)

## finally we crated a file with the final tidy data

write.table(data_tidy, file="tidy_data.txt", row.names = FALSE)

