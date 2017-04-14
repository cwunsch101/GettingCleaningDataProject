# Assumptions for the run_analysis.R project

	1.  The data set has been downloaded from the web site:
		https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
	2.  The data has been unzipped and placed in the "C:\data" folder


# Program Variables
data_path - Directory for features and activity labels files(C:\data)
train_data_path - Directory for training data (C:\data\train)
test_data_path - Directory for testing data (C:\data\test)
train_data - Full path of training data file (C:\data\train\X_train.txt)
test_data - Full path of testing data file (C:\data\test\X_test.txt)
train_subject - Full path of training subject file (C:\data\train\subject_train.txt)
test_subject - Full path of test subject file (C:\data\test\subject_test.txt)
features_data - Full path of features data file (C:\data\features.txt)
activity_labels - Full path of activity label files (C:\data\activity_labels.txt)
train_labels - Full path of training label file (C:\data\train\y_train.txt)
test_labels - Full path of test label file (C:\data\test\y_test.txt)


# Internal data sets
features - features data frame
activitylabels - activity labels data frame
data1 - training data data frame
labels1 - training labels data frame
subjects1 - training subject data frame
data2 - test data data frame
labels2 - test labels data frame
subjects2 - test subject frame


# Transformations
all_data - merged data set of testing and training data (data1, data2). Mean and standard deviation fields only
all_subjects - merged data set of testing and training subjects (subjects1, subjects2)
all_labels - merged data set of testing and training labels (labels1, labels2)
TotalData - final tidy data set of all testing and training observations 
SubjectAverages - final tidy data set of averages by subject and activity from TotalData data set