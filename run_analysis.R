setwd("UCI HAR Dataset/")

##Load the relevant variables

features <- read.table("features.txt", stringsAsFactors = FALSE)

activities <- read.table("activity_labels.txt")

trainX <- read.table("train/X_train.txt")
trainY <- read.table("train/y_train.txt")
trainS <- read.table("train/subject_train.txt")

testX <- read.table("test/X_test.txt")
testY <- read.table("test/y_test.txt")
testS <- read.table("test/subject_test.txt")

##Append label and subject columns to the feature vectors

test <- cbind(testX, testY, testS)

train <- cbind(trainX, trainY, trainS)

##Process feature names so we don't have illegal or untidy names

featureNames <- gsub("\\(|\\)|\\-","",features[,2])

featureNames <- gsub("\\,", ".", featureNames)

##Finish and assigns names to test and training data

names <- c(featureNames, "label", "subject")

names(test) <- names

names(train) <- names

##Select only the features dealing with mean or standar deviation

match <- c(grep("mean|std", featureNames, value = TRUE), "label", "subject")

##Join train and test sets

data <- rbind( train[,match], test[,match])

##Aggregate by subject, label activities accordingly then print as file

tidy <- aggregate(. ~ subject + label, data, mean)

tidy$activity <- factor(tidy$label, labels = activities[,2])

names(tidy) <- gsub("BodyBody", "Body", names(tidy))

write.table(tidy, file = "tidydata.txt", sep = "\t")