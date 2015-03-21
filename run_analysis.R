# Reading the train data
subjectTrain <- read.table("train/subject_train.txt")
xTrain <- read.table("train/X_train.txt")
yTrain <- read.table("train/y_train.txt")

# Reading the test data
subjectTest <- read.table("test/subject_test.txt")
xTest <- read.table("test/X_test.txt")
yTest <- read.table("test/y_test.txt")

# Reading the activity labels and feature text
activityLabels <- read.table("activity_labels.txt")
featureText <- read.table("features.txt")

# Removing underscores from activity label
activityLabels[,2] <- gsub("_", "", activityLabels[,2])

# Merging the subject identifier, the activity identifier, and the actual data into a single file for both the test and the train data
trainData <- cbind(subjectTrain, yTrain, xTrain)
testData <- cbind(subjectTest, yTest, xTest)

# Merging the test and the train data to obtain mergedData
mergedData = rbind(trainData, testData)

# Replacing the activity name identifier with the actual activity name
numRows <- nrow(mergedData)
for (i in seq(1:numRows)){
    index <- mergedData[i,2]
    mergedData[i,2] <- as.character(activityLabels[index,2])
}

# Adding descriptive column names
myColNames <- featureText[,2]
newColNames <- c("subjectid", "activity")
myColNames <- c(newColNames, as.character(myColNames))
colnames(mergedData) <- myColNames

# Parsing mergedData so that it contains only the subject identifier (column 1), the activity identifier (column 2), and the columns
# that have mean or std in its name
index <- c(1, 2, grep("mean", colnames(mergedData)), grep("std", colnames(mergedData)))
mergedData <- mergedData[, index]

# Creating tidy data set that contains the average of each variable for each activity and each subject and writing it to the file name
# tidyData.txt
library(reshape)
mdata <- melt(mergedData, id=c("subjectid","activity"))
tidyData <- cast(mdata, subjectid + activity ~ variable, mean)
write.table(tidyData, file = "tidyData.txt", row.name=FALSE)

