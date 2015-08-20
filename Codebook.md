## Getting and Cleaning Data assignment week 3

This doc describes how I got my results. * I unzipped it locally and read thru the files for like an hour and identified how all the pieces fit together. Kind of key first step. imo.

Here is the data:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 



* My script does the following things:
## Part 1 - loads all the observations in.
*   It reads all the test and training files into tables(ie subject_, x_, y_ files for the 'test' and 'train' directories
*   It merges each of the respective set of files into data.frames 
*   subject_test.txt and subject_train.txt become 'subjects'
*   x_test.txt and x_train.txt become 'readings'
*   and y_test.txt and y_train become 'activities'
*   left in dim() commands commented out + notes on rows and cols lining up here.

## Part 2 - pulls out the relavant readings. IE all the standard devations and all the means
* It reads in the features.txt file, (becomes 'features')
* creates an index of columns(features_mean_std_index) that include std(standard deviation) or mean(mean) readings.
* uses features_mean_std_index to reduce 'readings' at 561 columns to 'mean_std_readings' at 66 columns
* renames mean_std_readings column names with names from features

## Part 3 - changes Activities entries from numbers to useful labels

* reads in "activity_labels.txt" to variable 'the_labels'
* swaps in activity names in for activity numbers in 'activities'

## Part 4 - adds useful column names to look up files

* makes the column name for 'subjects' "Subject"
* makes the column name for 'activities' "Activity"

## Part 4A - merges 'subjects' 'activites' and 'mean_std_readings' into 'subjects_activities_readings_A

* 10299 rows, 68 columns.
* Subject, Activity, then 66 std, and mean readings
* 
## Part 5 - Creates a final tiday data set with the average of each variable for each activity for each subject
* generates a data set of the average for each subject for each activity.  so 30 subjects w 6 activities = 180 rows by 66 columns
* 







