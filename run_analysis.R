####You should create one R script called run_analysis.R that does the following. 
##Steps
####1.Merges the training and the test sets to create one data set.
####starts in the directory above 'test' & 'train'  rbinds subject files, readings(x files), and activity(y files) lookups across the two directories

##table the test stuff
test_subject<-read.table("test/subject_test.txt")
test_subject_x<-read.table("test/X_test.txt")
test_subject_y<-read.table("test/y_test.txt")
##check test things
##dim(test_subject)   ##2947r1c
##dim(test_subject_x) ##2947r561c
##dim(test_subject_y) ##2947r1c
##table the train stuff
train_subject<-read.table("train/subject_train.txt")
train_subject_x<-read.table("train/X_train.txt")
train_subject_y<-read.table("train/y_train.txt")
##check training things
##dim(train_subject)  ##7352r1c
##dim(train_subject_x)  ##7352r651c
##dim(train_subject_y)  ##7352r1c
##col and row counts all match. I didn't screw this up.awesome.

##combine the test and training tables
subjects<-rbind(test_subject,train_subject)
readings<-rbind(test_subject_x,train_subject_x)
activities<-rbind(test_subject_y,train_subject_y)
##test again
##dim(subjects)  ##10299r1c
##dim(readings)  ##10299r561c
##dim(activities)##10299r1c     1
##combined test & training. solid row and column counts.

####2.Extracts only the measurements on the mean and standard deviation for each measurement. 

##put into table the features lists.  or future readings column headers
features <- read.table("features.txt")
##check features out
##dim(features) ##561r2c.  
##create a list of the stds and means
features_mean_std_index <- grep("mean\\(|std\\(",features[,2])
##how many?
##length(features_stds_index) ##66

##reduce activities table to just the stds and means cols
mean_std_readings <- readings[,features_mean_std_index]
##did it work?
##dim(mean_std_readings) ##10299r 66c.  yup.

##add labels from the mean and std labels. 
names(mean_std_readings)<-features[features_mean_std_index,2]
#remove some junk, make labels somewhat more human readable
names(mean_std_readings)<-gsub("-","",names(mean_std_readings))
names(mean_std_readings)<-gsub("\\(\\)","",names(mean_std_readings))

###3.Uses descriptive activity names to name the activities in the data set

##read in table activity_labels.txt
the_labels<-read.table("activity_labels.txt")
##remove some junk
the_labels[,2]<-tolower(gsub("_"," ",the_labels[,2]))
##swap out numbers for names in activities
fixed_labels <- the_labels[activities[,1],2]
activities[,1]<- fixed_labels

##label col2 as 'activities'
names(activities)<-"Activity"


##4.Appropriately labels the data set with descriptive variable names. 
##activites & mean_std_readings are done, subjects not done

names(subjects)<- "Subject"

##generate a data set

subjects_activities_readings_A <- cbind(subjects,activities,mean_std_readings)
##did it work?
##dim(subjects_activities_readings) 10299r68c.  yup.


###5.From the data set in step 4, creates a second, 
###independent tidy data set with the average of each 
###variable for each activity and each subject.

##set up a data frame to capture output from a for loop
number_of_subjects<- 30
number_of_activities <- 6 
number_of_columns<-dim(subjects_activities_readings_A)[2]
output <- matrix(NA,nrow=number_of_subjects*number_of_activities,ncol=number_of_columns)
output <- as.data.frame(output)
##give it the right column names
colnames(output)<- colnames(subjects_activities_readings_A)

row<-1
for(i in 1:number_of_subjects){
    for(j in 1:number_of_activities){
      output[row,1]<- sort(unique(subjects)[,1])[i]
      output[row,2]<- the_labels[j,2]
      check1 <- i == subjects_activities_readings_A$Subject ##find the right subject
      check2 <- the_labels[j,2] == subjects_activities_readings_A$Activity ##find the right activity
      output[row,3:number_of_columns]<-colMeans(subjects_activities_readings_A[check1&check2, 3:number_of_columns]) ##average this subject for this activity and write a row
      row <- row+1
          }
}
head(output)
write.table(output, "data_with_means.txt") # tidyed up second data set
