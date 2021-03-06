#Global settings
library(plyr)
setwd("/home/sascha/Dokumente/Coursera/Getting and cleaning data/Course Project/UCI HAR Dataset") #set working directory

#Common data
activity_labels=read.table("./activity_labels.txt",header=FALSE,col.names = c("ID","ActivityLabel"),stringsAsFactors = FALSE) #load activity_labels.txt file for activity labels
features=read.table("./features.txt",stringsAsFactors = FALSE) #load features.txt file for column names
xlabels<-features[,2] #load feature names into vector for column names of x_train data

#Training data
subject_train=read.table("./train/subject_train.txt",header=FALSE,col.names = "Subject") #load subject_train.txt file
y_train=read.table("./train/y_train.txt",header=FALSE,col.names = "Activity") #load y_train.txt file
x_train=read.table("./train/X_train.txt",header=FALSE,col.names = xlabels) #load x_train.txt file
combinedTable_train<-cbind(subject_train,y_train,x_train) #create complete table with subject, activity and measurements
combinedTable_train=merge(combinedTable_train,activity_labels,by.x="Activity",by.y="ID") #add activity labels by merging
combinedTable_train$Source<-"Train"
rm(list=c("y_train","x_train","subject_train")) #object not needed anymore are removed from memory

#Test data
subject_test=read.table("./test/subject_test.txt",header=FALSE,col.names = "Subject") #load subject_test.txt file
y_test=read.table("./test/y_test.txt",header=FALSE,col.names = "Activity") #load y_test.txt file
x_test=read.table("./test/X_test.txt",header=FALSE,col.names = xlabels) #load x_test.txt file
combinedTable_test<-cbind(subject_test,y_test,x_test) #create complete table with subject, activity and measurements
combinedTable_test=merge(combinedTable_test,activity_labels,by.x="Activity",by.y="ID") #add activity labels by merging
combinedTable_test$Source<-"Test"
rm(list=c("y_test","x_test","subject_test")) #object not needed anymore are removed from memory

#Combined training and test data
combinedTable=rbind(combinedTable_test,combinedTable_train)
combinedTable=combinedTable[c(2,564,3:563)] #Resort columns
selectedColumns<-combinedTable[,c(1:4,grep("mean|MEAN|std",colnames(combinedTable)))] #Select columns 1-3 and columns with either mean, Mean or std in the column name

#Column means of data grouped by subject and activity
GroupedColMeans<-ddply(selectedColumns, .(Subject, ActivityLabel), colwise(mean)) #group by subject and activity and calculate the mean for each remaining column
rm(list=c("activity_labels","combinedTable","combinedTable_train","combinedTable_test","features","xlabels")) #object not needed anymore are removed from memory

#Create output file
write.table(GroupedColMeans, file="/home/sascha/Dokumente/Coursera/Getting and cleaning data/Course Project/Solution/tidy_dataset.txt", row.name=FALSE)
