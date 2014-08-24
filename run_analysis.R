####################################################################
#########  geting and cleaning data : course project  ##############
####################################################################

##  Install Package read.table
## Load package read.table

## All test data files in directory ./Data/UCI HAR Dataset/test
## All train data files in directory ./Data/UCI HAR Dataset/train
## All other data files in directory ./Data/UCI HAR Dataset

## Working directory is user's directory
## Operating system OS X (10.9.4)

## Check for the existence of the data repository under user
## creates it if it<s not there

if(!file.exists("Data")) {
      dir.create("Data")
}

## Fetch the data from the specify web address and downloads it
fileUrl <-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./Data/UCI HAR Dataset.zip", method = "curl") 

##Unzip the downloaded file
setwd("./Data/")
unzip("UCI HAR Dataset.zip")
setwd("..")


#########################################################################
## this section cleans the informational data associated to the data set
#########################################################################

## reads the label information
act_label <- read.table("./Data/UCI HAR Dataset/activity_labels.txt", header = FALSE, stringsAsFactors = FALSE, col.names = c("act_id","act_desc"))

## reads the variables column name information
data_feature <- read.table("./Data/UCI HAR Dataset/features.txt", header = FALSE, stringsAsFactors = FALSE)

####################################################
## this section cleans the data from the training set
#####################################################

## reads the training data also add the names of the columns
training_data <- read.table("./Data/UCI HAR Dataset/train/X_train.txt", header = FALSE, colClasses = "numeric", stringsAsFactors = FALSE, col.names = data_feature[,2])

## reads the activity data, add the name of the columns and add the description of the activity
training_act_data <- read.table("./Data/UCI HAR Dataset/train/y_train.txt", header = FALSE, colClasses = "numeric", stringsAsFactors = FALSE,col.names = c("act_id"))
training_act_data <- merge(training_act_data, act_label)

## reads the participant data and add the name of the columns
training_part_data <- read.table("./Data/UCI HAR Dataset/train/subject_train.txt", header = FALSE, colClasses = "numeric", stringsAsFactors = FALSE, col.names = c("part_id"))

## Merge the training, activity and participant data
merge_training_data <- cbind(training_part_data, training_act_data, training_data)

##################################################
## this section cleans the data from the test set
##################################################

## reads the test data also add the names of the columns
test_data <- read.table("./Data/UCI HAR Dataset/test/X_test.txt", header = FALSE, colClasses = "numeric", stringsAsFactors = FALSE, col.names = data_feature[,2])

## reads the activity data, add the name of the columns and add the description of the activity
test_act_data <- read.table("./Data/UCI HAR Dataset/test/y_test.txt", header = FALSE, colClasses = "numeric", stringsAsFactors = FALSE, col.names = c("act_id"))
test_act_data <- merge(test_act_data, act_label)

## reads the participant data and add the name of the columns
test_part_data <- read.table("./Data/UCI HAR Dataset/test/subject_test.txt", header = FALSE, colClasses = "numeric", stringsAsFactors = FALSE, col.names = c("part_id"))

## Merge the test, activity and participant data
merge_test_data <- cbind(test_part_data, test_act_data, test_data)

###################################################################################
## this section merge the data from the training set with the data from the test set
####################################################################################
all_data <- rbind(merge_training_data, merge_test_data)



####################################################################################################
## this section keeps only the columns for variable having the words "mean" or "mean" in their name
####################################################################################################

## Filters that keeps the first 3 columns and all variable with the string mean or std in their name
filter<- grep("act_id|act_desc|part_id|mean|std",names(merge_test_data),ignore.case = TRUE, value = TRUE)

## Applies the filter on the data set
filter_data <- all_data[,filter]

## Only for debugging purpose
##write.table(filter_data, file = "Data_project", append = FALSE, sep = ",",row.name = FALSE )
##write.csv(filter_data, file = "Data_project2")


####################################################################################################
## this section aggregates the filtered data set on "Activity" an "Participant"
####################################################################################################

## Aggregates by activity and participant
sum_filter_data <- aggregate(x = filter_data[,4:89], by = list(filter_data[,3],filter_data[,2],filter_data[,1]) , FUN = mean, na.rm=TRUE)

## the output file is call "sum_filter_data_project", is written to the working directory and is comma separated
write.table(sum_filter_data, file = "sum_filter_data_project.txt", append = FALSE, sep = ",",row.name = FALSE)