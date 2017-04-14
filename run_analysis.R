# run_analysis.R
# This program performs the following functions
#	Merges the test and training data sets into one file
#	Extracts only the mean and standard deviation data for each observation
#	Creates user-friendly column headers
#	Creates a data set with the merged data and user-frendly column names to summarize the activites
#	Creates a second data set that contains the averages for each activity and subject

library(dplyr)

# Variables
data_path <- "C:\\data"
train_data_path <- "C:\\data\\train"
test_data_path <- "C:\\data\\test"
train_data <- "C:\\data\\train\\X_train.txt"
test_data <- "C:\\data\\test\\X_test.txt"
train_subject <- "C:\\data\\train\\subject_train.txt"
test_subject <- "C:\\data\\test\\subject_test.txt"
features_data <- "C:\\data\\features.txt"
activity_labels <- "C:\\data\\activity_labels.txt"
train_labels <- "C:\\data\\train\\y_train.txt"
test_labels <- "C:\\data\\test\\y_test.txt"


# Get Activities and Features
# Validate file path and read the activity labels and features
    if(!file.exists(data_path)) { return("Invalid directory for activity labels and features") } 

# Read the Features data
    features <- read.table(features_data)

# Read the Activity labels
    activitylabels <- read.table(activity_labels)


# Get Training Data
# Validate file path, read the data, activities, and subjects
    if(!file.exists(train_data_path)) { return("Invalid training directory") } 

# Read the training data
    data1 <- read.table(train_data)


# Read the training labels
    labels1 <- read.table(train_labels)


# Read the training subjects
    subjects1 <- read.table(train_subject)



# Get the Test Data
# Validate file path, read the data, labels, activities, and subjects
    if(!file.exists(test_data_path)) { return("Invalid test directory") } 

# Read the test data
    data2 <- read.table(test_data)


# Read the test labels
    labels2 <- read.table(test_labels)


# Read the test subjects
    subjects2 <- read.table(test_subject)


# Validate length of data files and Merge them
   if(length(data1) != length(data2)) { 
         return("Error: The datasets have different number of columns")
   } 

   all_data <- rbind(data1, data2)


# Validate length of subject files and Merge them
   if(length(subjects1) != length(subjects2)) { 
         return("Error: The subjects datasets have different number of columns")
   } 

   all_subjects <- rbind(subjects1, subjects2)


# Merge the label files

   all_labels <- rbind(labels1, labels2)


# Get the column numbers and names for those that contain mean and std values
# Remove special characters from column names
# Remove columns that are not a mean or standard deviation from data set
   col_nums <- grep("mean|std", features[,2]) 
   col_names <- grep("mean|std", features[,2], value=TRUE)
   col_names <- gsub("[()-]","", col_names) 
   col_names <- gsub("mean", "Mean", col_names)
   col_names <- gsub("std", "Std", col_names)
   all_data <- all_data %>% select("col_numbers"=col_nums)

# Match Activities
   all_labels <- activitylabels[match(all_labels[,1],activitylabels[,1]),2]

# Combine data with the labels to create 
   TotalData <- cbind(all_data, all_labels, all_subjects) 
   names(TotalData) <- c("col_names"=col_names,"activity","subject") 

# Create data set of averages by subject and activity and write file
   SubjectAverages <- TotalData %>% group_by(activity,subject) %>% summarize_all(funs(mean)) 
   write.table(SubjectAverages, file="C:\\data\\subjectaverages.txt", sep="|", eol="\n", row.names=FALSE)
