run_analysis <- function(){

#Merges the training and the test sets to create one data set.

activity <- read.table("UCI HAR Dataset/activity_labels.txt")
names(activity) <- c("activityID", "activityName")
features <- read.table("UCI HAR Dataset/features.txt")
data1 <- read.table("UCI HAR Dataset/test/X_test.txt")
data2 <- read.table("UCI HAR Dataset/test/Y_test.txt")
names(data2) <- "activityID"
subjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt")
names(subjectTest) <- "subjectID"
data3 <- read.table("UCI HAR Dataset/train/X_train.txt")
data4 <- read.table("UCI HAR Dataset/train/Y_train.txt")
names(data4) <- "activityID"
subjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt")
names(subjectTrain) <- "subjectID"

data5 <- cbind(data1, data2, subjectTest)
data6 <- cbind(data3, data4, subjectTrain)
data7 <- rbind(data5, data6)

#add names to data7
x <- (c(as.character(features$V2), "activityID", "subjectID"))
names(data7) <- x

#Convert activityID to readable fields

data7$activityName <- factor(data7$activityID)
levels(data7$activityName) <- activity$activityName

#Extracts only the measurements on the mean,

meanCols1 <- grep("mean", names(data7))

meanCols2 <- data7[,meanCols1]

#Extract the means with a capital "M" in Mean

meanCols3 <- grep("Mean", names(data7))

meanCols4 <- data7[,meanCols3]


#Extracts only standard deviation

stdCols1 <- grep("std", names(data7))

stdCols2 <- data7[,stdCols1]

#Combines activityID, subjectID, activityName, mean, std

allData <- data.frame(data7$subjectID, data7$activityName, meanCols2, meanCols4, stdCols2)

#fix up the variable names

names(allData) <- gsub("[.]", "", names(allData))
names(allData) <- gsub("data7","", names(allData))
names(allData) <- tolower(names(allData))

#Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

library(reshape2)
meltData <- melt(allData, id = c(1,2), measure.vars = c(3:88))
cleanData <- dcast(meltData, subjectid + activityname ~ variable, mean)
cleanData

}