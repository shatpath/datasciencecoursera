## This script processes the datasets provided to give an output file 
## Output file contains the processed tidy data 

train_DF<-read.table("./UCI HAR Dataset/train/X_train.txt")
test_DF<- read.table("./UCI HAR Dataset/test/X_test.txt")

features_DF<- read.table("./UCI HAR Dataset/features.txt")
activties_DF<- read.table("./UCI HAR Dataset/activity_labels.txt")


train_ACT_DF<-read.table("./UCI HAR Dataset/train/y_train.txt")
test_ACT_DF<-read.table("./UCI HAR Dataset/test/y_test.txt")

train_SUB_DF<-read.table("./UCI HAR Dataset/train/subject_train.txt")
test_SUB_DF<-read.table("./UCI HAR Dataset/test/subject_test.txt")


##tot_DF below merge the above data frames to create one dataset
tot_DF<- rbind(train_DF,test_DF)
## Assign column name to the resulting dataset
colnames(tot_DF)<-features_DF[,2]

##Extracts only the measurements on the mean and std 
## Figuring out the indexes of  mean and standard deviation columns using grep
meanIndex<-grep("mean",features_DF[,2])
stdIndex<-grep("std",features_DF[,2])
mean_std_Index<-c(meanIndex,stdIndex)


tot_DF<-tot_DF[,mean_std_Index]

##To name activity names 
## merge the  data sets for train and test  for activty
tot_ACT_DF<-rbind(train_ACT_DF,test_ACT_DF)

#Factor of activities
ftot_ACT_DF <-factor(tot_ACT_DF[,1])

##Assigining the string values to levels
levels(ftot_ACT_DF)<-activties_DF[,2]

##created a matrix with 1 column 
act_matrix<-matrix(ftot_ACT_DF,ncol=1)
## assign a name to the column of this act_matrix
colnames(act_matrix)<-"ActivityName"


##Merging the train and test data for Subjects on which the experiment was performed 
tot_SUB_DF<-rbind(train_SUB_DF,test_SUB_DF)
colnames(tot_SUB_DF)<-"SubjectID"


## The merged_DF datset is the merger of the train and test datasets
merged_DF<-cbind(tot_SUB_DF,act_matrix,tot_DF)


## Using the reshape2 package to format the result
library(reshape2)

melted_DF<-melt(merged_DF, id.vars =c("SubjectID","ActivityName"))

## Reshaping the data based on SubjectID, Activity Name and averaging all the variables
tidyDataset_DF<-dcast(melted_DF,SubjectID+ActivityName ~ variable, fun.aggregate = mean)

write.table(tidyDataset_DF,"./UCI HAR Dataset/TidyDataSet.txt",row.name=FALSE )

##Now cleaning all the variables holding the memory by removing them
rm(list=ls())
