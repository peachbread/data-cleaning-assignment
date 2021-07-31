###STEP 0###
#set up for data cleanup
#get data

#load any libraries
library(dplyr)
library(data.table)

#download the file
file_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(file_url, "dataset.zip", method="curl")
unzip("dataset.zip")

#read the data and save it into variables
#each file is opened to review the contents of the data
features <- read.table("UCI HAR Dataset/features.txt", col.names=c("num","functions"))
activity_label <- read.table("UCI HAR Dataset/activity_labels.txt", col.names=c("id", "activity"))

subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names="subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", header=FALSE)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "id")

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names="subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", header=FALSE)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names="id")

#bind names to the features
#directly naming col.names adds random periods to the col name
colnames(x_test) <- t(features[2])
colnames(x_train) <- t(features[2])


###########################################################################################
###STEP 1###
#Merges the training and the test sets to create one data set.

#first need to bind all the tables together
subject_all <- rbind(subject_train, subject_test)
features_all <- rbind(x_train, x_test)
activity_all <- rbind(y_train, y_test)

#bind it all together
data_all <- cbind(subject_all, activity_all, features_all)


###########################################################################################
###STEP 2###
#Extracts only the measurements on the mean and standard deviation for each measurement. 

#grab subject id columns with regular expression
mean_std_getid <- grep(".*mean.*|.*std.*", names(data_all), ignore.case=TRUE)

#mean_std_getid still missing columns 1 and 2
mean_std_getid_final <- c(1, 2, mean_std_getid)

#extract data based on above id
mean_std_data_extract <- data_all[mean_std_getid_final]


###########################################################################################
###STEP 3###
#Uses descriptive activity names to name the activities in the data set

#simple replace
mean_std_data_extract$id <- activity_label[mean_std_data_extract$id, 2]


###########################################################################################
###STEP 4###
#Appropriately labels the data set with descriptive variable names. 

#all using gsub
names(mean_std_data_extract)<-gsub("Acc", "Accelerometer", names(mean_std_data_extract))
names(mean_std_data_extract)<-gsub("Gyro", "Gyroscope", names(mean_std_data_extract))
names(mean_std_data_extract)<-gsub("BodyBody", "Body", names(mean_std_data_extract))
names(mean_std_data_extract)<-gsub("Mag", "Magnitude", names(mean_std_data_extract))
names(mean_std_data_extract)<-gsub("tBody", "TimeBody", names(mean_std_data_extract))
names(mean_std_data_extract)<-gsub("-mean()", "Mean", names(mean_std_data_extract), ignore.case = TRUE)
names(mean_std_data_extract)<-gsub("-std()", "STD", names(mean_std_data_extract), ignore.case = TRUE)
names(mean_std_data_extract)<-gsub("-freq()", "Frequency", names(mean_std_data_extract), ignore.case = TRUE)
names(mean_std_data_extract)<-gsub("angle", "Angle", names(mean_std_data_extract))
names(mean_std_data_extract)<-gsub("gravity", "Gravity", names(mean_std_data_extract))
names(mean_std_data_extract)<-gsub("^f", "Frequency", names(mean_std_data_extract))
names(mean_std_data_extract)<-gsub("^t", "Time", names(mean_std_data_extract))

###########################################################################################
###STEP 5###
#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

col_num <- ncol(mean_std_data_extract)

final_tidydata_set <- data.tidy <- aggregate(mean_std_data_extract[,3:col_num], 
                                             list(activity=mean_std_data_extract$id, subject=mean_std_data_extract$subject),
                                             mean)

#write to file
write.table(final_tidydata_set, "final_tidydata_set.txt", row.name=FALSE)
