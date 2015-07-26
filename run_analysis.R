# Reading files
      featuresNames <- read.table("./UCI HAR Dataset/features.txt")
      activityNames <- read.table("./UCI HAR Dataset/activity_labels.txt")

      subjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
      activityTrain <- read.table("./UCI HAR Dataset/train/y_train.txt")
      featuresTrain <- read.table("./UCI HAR Dataset/train/X_train.txt")

      subjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
      activityTest <- read.table("./UCI HAR Dataset/test/y_test.txt")
      featuresTest <- read.table("./UCI HAR Dataset/test/X_test.txt")

# 1. Merges the training and the test sets to create one data set.
      subject <- rbind(subjectTrain, subjectTest)
      activity <- rbind(activityTrain, activityTest)
      features <- rbind(featuresTrain, featuresTest)

      colnames(features) <- t(featuresNames[2])
      colnames(activity) <- "Activity"
      colnames(subject) <- "Subject"

oneDataSet <- cbind(activity, subject, features)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
      meanAndSdColumns <- grep(pattern = "mean|std", x = names(oneDataSet), ignore.case=TRUE)

extractedDataSet <- oneDataSet[, c(1, 2, meanAndSdColumns)]

# 3. Uses descriptive activity names to name the activities in the data set
      for (i in 1:nrow(extractedDataSet)) {
            j <- extractedDataSet$Activity[i]
            extractedDataSet$Activity[i] <- as.character(activityNames[j, 2])
      }

# 4. Appropriately labels the data set with descriptive variable names. 
names(extractedDataSet) <- gsub("^t", "Time", names(extractedDataSet))
names(extractedDataSet) <- gsub("^f", "Frequency", names(extractedDataSet))
names(extractedDataSet) <- gsub("Mag", "Magnitude", names(extractedDataSet))
names(extractedDataSet) <- gsub("angle", "Angle", names(extractedDataSet))
names(extractedDataSet) <- gsub("Gyro", "Gyroscope", names(extractedDataSet))
names(extractedDataSet) <- gsub("Acc", "Accelerometer", names(extractedDataSet))
names(extractedDataSet) <- gsub("tBody", "TimeBody", names(extractedDataSet))
names(extractedDataSet) <- gsub("gravity", "Gravity", names(extractedDataSet))
names(extractedDataSet) <- gsub("-mean()", "Mean", names(extractedDataSet), ignore.case = TRUE)
names(extractedDataSet) <- gsub("-std()", "STD", names(extractedDataSet), ignore.case = TRUE)
names(extractedDataSet) <- gsub("-freq()", "Frequency", names(extractedDataSet), ignore.case = TRUE)
names(extractedDataSet) <- gsub("Freq()", "Frequency", names(extractedDataSet), ignore.case = TRUE)
names(extractedDataSet) <- gsub("BodyBody", "Body", names(extractedDataSet))

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
      newTable <- aggregate(. ~Activity + Subject, extractedDataSet, mean)

TidyDataSet <- arrange(newTable, Activity, Subject)
write.table(TidyDataSet, file = "TidyDataSet.txt", row.names = FALSE)
