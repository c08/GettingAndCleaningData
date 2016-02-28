#Script to download and clean the data collected from the accelerometers from the Samsung Galaxy S smartphone.
#Steps:
#1:Merges the training and the test sets to create one data set.
#2:Extracts only the measurements on the mean and standard deviation for each measurement.
#3:Uses descriptive activity names to name the activities in the data set
#4:Appropriately labels the data set with descriptive variable names.
#5:From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject


library(data.table)

#Download the data
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "Data.zip", method = "curl")
unzip("Data.zip")

#Read the data
testSubjectData<-read.table("./UCI HAR Dataset/test/subject_test.txt")
testXData<-read.table("./UCI HAR Dataset/test/X_test.txt")
testYData<-read.table("./UCI HAR Dataset/test/y_test.txt")

trainSubjectData<-read.table("./UCI HAR Dataset/train/subject_train.txt")
trainXData<-read.table("./UCI HAR Dataset/train/X_train.txt")
trainYData<-read.table("./UCI HAR Dataset/train/y_train.txt")

labels<-read.table("./UCI HAR Dataset/activity_labels.txt")
features<-read.table("./UCI HAR Dataset/features.txt")

#Change the colName of the data
colnames(testXData)<-features$V2
colnames(trainXData)<-features$V2
colnames(testSubjectData)<-"subject"
colnames(trainSubjectData)<-"subject"
colnames(testYData)<-"activity"
colnames(trainYData)<-"activity"


#Merges the training and the test sets to create one data set.
totalData<-rbind(testXData,trainXData)


#Extracts only the measurements on the mean and standard deviation for each measurement.
extract_features <- grep("mean|std", features[,2])
MeanStdData <- totalData[, extract_features]

#Uses descriptive activity names to name the activities in the data set
testYData[, 1] <- labels[testYData[, 1], 2]
trainYData[, 1] <- labels[trainYData[, 1], 2]

#Merge all data
finalData<-cbind(MeanStdData, rbind(testYData,trainYData),rbind(testSubjectData,trainSubjectData))

#Creates a second, independent tidy data set with the average of each variable for each activity and each subject
DT <- data.table(finalData)
tidy<-DT[,lapply(.SD,mean),by="activity,subject"]


#Write the tidy data in a file
write.table(tidy, file = "./tidy_data.txt", row.names=FALSE)

