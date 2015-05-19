setwd("/Users/Alessandro/Documents/DataScience/GitHub/GC_data_Course_Project/")
## Loading libraries
library(dplyr)

## Loading data on features, activity conversion table
features_lab <- read.table("UCI HAR Dataset/features.txt",
                       col.names = c("id", "name"))
activity_lab <- read.table("UCI HAR Dataset/activity_labels.txt", col.names=c("id", "activity"))

#select the index of the features to be selected - mean() & std()
spec_col <- grep("-mean\\(\\)-|-std\\(\\)-.", features_lab$name)
## Definition of clear variables name and use in data-set
features_lab$name <- gsub("-", "_", features_lab$name)
features_lab$name <- gsub("\\(|\\)", "", features_lab$name)
features_lab$name <- paste(substr(x = features_lab$name, start = 1, stop = 1), "_", substr(x = features_lab$name, start = 2, stop =nchar(features_lab$name)), sep="")


## Creation of the merged dataset (from TRAIN and TEST dataset)
## 1 - TRAIN
## Loading the complete TRAIN dataset
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
## Loading data on Activities and Subjects for TRAIN dataset
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
## Merging the different datasets in new TRAIN data.frame
train <- cbind(subject_train, y_train, sample = "train", x_train[,spec_col])
colnames(train) <- c("subject", "activity","sample", as.character(features_lab[spec_col, 2]))

## Removing original TRAIN datasets
rm(x_train, y_train, subject_train)

## 2 - TEST
## Loading the complete TEST dataset
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
## Loading data on Activities and Subjects for TEST dataset
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
## Merging the different datasets in new TEST data.frame 
## and applying well-defined variables name
test <- cbind(subject_test, y_test, sample = "test", x_test[,spec_col])
colnames(test) <- c("subject", "activity","sample", as.character(features_lab[spec_col, 2]))

## Removing original TRAIN datasets
rm(x_test, y_test, subject_test)

## 3 - Merge TRAIN and TEST datasets
data <- rbind(train, test)

## POINT 3 - Use descriptive activity names to name the activities in the data set
data$activity <- activity_lab[data$activity, 2]
## POINT 5 - Creation of an independent tidy dataset with averages

data_summary <- data %>%
        group_by(subject, activity) %>%
                summarise_each(funs(mean))
write.table(x = data_summary, file = "tidy_data.txt", row.names = FALSE)
