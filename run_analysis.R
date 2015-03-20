rm(list=ls())
ls()

list.files("test/")
list.files("train/")

subjectTrain <- read.table("train/subject_train.txt")
xTrain <- read.table("train/X_train.txt")
yTrain <- read.table("train/y_train.txt")

subjectTest <- read.table("test/subject_test.txt")
xTest <- read.table("test/X_test.txt")
yTest <- read.table("test/y_test.txt")

activityLabels <- read.table("activity_labels.txt")
featureText <- read.table("features.txt")


trainData <- cbind(subjectTrain, yTrain, xTrain)
testData <- cbind(subjectTest, yTest, xTest)


mergedData = rbind(trainData, testData)
ncol(mergedData)
numRows <- nrow(mergedData)

for (i in seq(1:numRows)){
    index <- mergedData[i,2]
    mergedData[i,2] <- toString(activityLabels[index,2])
}

myColNames <- featureText[,2]
newColNames <- c("person", "activity")
myColNames <- c(newColNames, as.character(myColNames))

colnames(mergedData) <- myColNames
names(mergedData)
index <- c(1, 2, grep("mean", colnames(mergedData)), grep("std", colnames(mergedData)))
mergedData <- mergedData[, index]
names(mergedData)

library(reshape)
mdata <- melt(mergedData, id=c("person","activity"))
head(mdata,30)
tidyData <- cast(mdata, person + activity ~ variable, mean)
write.table(tidyData, file = "tidyData.txt", row.name=FALSE)
head(tidyData,30)[1:5]

row.name=FALSE








