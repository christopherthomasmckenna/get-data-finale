## Getting and Cleaning Data assignment week 3

This doc describes how I got my results.

Here is the data:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

* I unzipped it locally and read thru the files for like an hour and identified how all the pieces fit together.
* My script does the following things:
** It reads all the test and training files into tables(ie subject_, x_, y_ files for the 'test' and 'train' directories
** It merges each of the respective set of files into data.frames so: 
*** subject_test.txt and subject_train.txt become subjects
*** x_test.txt and x_train.txt become readings
*** and y_test.txt and y_train become activities
*** There's dim() code in there commented out to test dimensions and esnure that # of cols or # rows match up


