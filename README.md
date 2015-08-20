##Getting and Cleaning data week 3 assignment

How to make the script work:

  *First grab the samsung phone data from here:
  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
  *unzip the file.
  *move the run_analysis.R script into the main directory of the download(ie UCI HAR Dataset).
  * in RStudio,  setwd() to the main directory of the download.
  * in RSudio, use source("run_analysis.R") command in the Console.
  * After you see the prompt again,  you should see a new file 'data_with_means.txt'.
  * Use d_w_m <- read.table("data_with_means.txt") in R Studio to look at the file.  You will find averages for 66 different standard deviation or mean metrics for 30 subjects for 6 activities.  (data dimensions are 180 rows by 68 columns.66 averages, 1 column labeling subject, 1 column labeling activities.)
  

