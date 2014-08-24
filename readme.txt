The script is called : run_analysis.R

To run the script:
 	copy it to your working directory
 	Source the scrip
 	Run the script
 	No arguments are necessary

These are the steps of the script:

#########################################################################
Step 1 : Fetch and download the data
#########################################################################


## Check for the existence of the ./data repository under the user's directory
## creates it if it's not there

## Fetch the data from the specify web address and downloads it
    "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    the name of the file is : UCI HAR Dataset.zip

## Unzip the downloaded file to ./data repository
    All test data files  are in directory ./Data/UCI HAR Dataset/test
    All train data files are in directory ./Data/UCI HAR Dataset/train
    All other data files are in directory ./Data/UCI HAR Dataset



#########################################################################
Step 2 : cleans the informational data associated to the data set
  Directory: ./Data/UCI HAR Dataset 
#########################################################################

## reads the label information from file: activity_labels.txt
## Creates a dataFrame: act_label

## reads the variables column name information from file: features.txt
## Creates a dataFrame: data_feature
    

####################################################
Step 3 :  cleans the data from the training data set
 Directory: ./Data/UCI HAR Dataset/train
#####################################################

## reads the training data  from file: X_train.txt
## Also adds the names of the columns
## Creates a dataFrame: training_data

## reads the activity data  from file: y_train.txt 
## Also adds the name of the columns and add the description of the activity
## Creates a dataFrame: training_act_data

## reads the training data from file: subject_train.txt
## Also adds the name of the columns
## Creates a dataFrame: training_part_data

## Merge the training, activity and participant data
## Creates a dataFrame: merge_training_data


##################################################
Step 4 :  cleans the data from the test data set
 Directory: ./Data/UCI HAR Dataset/test
##################################################

## reads the test data  from file: X_test.txt
## Also adds the names of the columns
## Creates a dataFrame: test_data

## reads the activity data  from file: y_test.txt 
## Also adds the name of the columns and add the description of the activity
## Creates a dataFrame: test_act_data

## reads the training data from file: subject_test.txt
## Also adds the name of the columns
## Creates a dataFrame: test_part_data

## Merge the test, activity and participant data
## Creates a dataFrame: test_training_data

###################################################################################
Step 5 :  merge the data from the training set with the data from the test set
####################################################################################

## Creates a dataFrame: all_data


####################################################################################################
Step 6 :  keeps only the columns for variable having the words "mean" or "mean" in their name
####################################################################################################

##  create Filters that keeps the first 3 columns and all variable with the string mean or std in their name

## Applies the filter on the data set all_data
## Creates a dataFrame: filter_data


####################################################################################################
Step 7 :  aggregates the filtered data set on "Activity" an "Participant"
####################################################################################################

## Aggregates by activity and participant the data set filter_data
## Creates a dataFrame: sum_filter_data

## Create output file called "sum_filter_data_project", 
## Output file is written to the working directory and is comma separated



