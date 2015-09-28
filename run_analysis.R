library(dplyr)

# Load all files file

fileURL <- "./UCI HAR Dataset/train/subject_train.txt"
subject_train <- read.table(fileURL)

fileURL <- "./UCI HAR Dataset/train/y_train.txt"
y_train <- read.table(fileURL)

fileURL <- "./UCI HAR Dataset/train/x_train.txt"
x_train <- read.table(fileURL)

fileURL <- "./UCI HAR Dataset/test/subject_test.txt"
subject_test <- read.table(fileURL)

fileURL <- "./UCI HAR Dataset/test/y_test.txt"
y_test <- read.table(fileURL)

fileURL <- "./UCI HAR Dataset/test/x_test.txt"
x_test <- read.table(fileURL)

fileURL <- "./UCI HAR Dataset/activity_labels.txt"
activities <- read.table(fileURL)

fileURL <- "./UCI HAR Dataset/features.txt"
features <- read.table(fileURL)


# Rename variables in "y" and "subject" tables

y_train <- rename(y_train, y = V1)
y_test <- rename(y_test, y = V1)

subject_train <- rename(subject_train, subject = V1)
subject_test <- rename(subject_test, subject = V1)

# Bind test and train tables - subject + y + x variables

test_total <- cbind(subject_test, y_test, x_test)
train_total <- cbind(subject_train, y_train, x_train)

# Includes a "type" column in each table - indicating if it is a "test" or "train"

test_total$type <- "test"
train_total$type <- "train"

total <- rbind(test_total, train_total)

#include label "activities"

total$activity <- activities[total$y,2]

#Creates summary on "subject" and "activity"

summary <- total %>% group_by(subject,activity) %>% summarise_each(funs(mean))

#Rename columns on "total"

colnames(total)[3:563] <- as.character(features[,2])
colnames(summary)[4:564] <- as.character(features[,2])

write.table(summary,"answer.txt", row.name = FALSE)


