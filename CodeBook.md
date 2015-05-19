 CodeBook
=============================
Getting and Cleaning the Data project
=============================
=============================
# Introduction
This CodeBook is structured as follows:

1. Brief description of the raw dataset
1. Explanation of the R code
1. Analysis of the newly created tidy dataset
1. Conclusion

# Description of raw dataset
The data provided for this assignment in the *UCI-HAR-Dataset.zip* is split in smaller datasets with different informations.
The datasets used in run_analysis code are the following:

1. *subject_train* and *subject_test*. Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30 (7352 obs. for train and 2947 obs. for test).
1. *X_train* and *X_test*. Each row identifies a unique vector of collected data (561 variables, 7352 obs. for train and 2947 obs. for test)
1. *Y_train* and *Y_test*. Vector of activity class label (7352 obs. for train and 2947 obs. for test)
1.  *activity_label*. Links the class labels with their activity name.
1. *features*. List of all features.

For detailed information regarding the UCI-HAR-Dataset please refer to the README included in the folder.

# Explanation of the R code
Assuming the main folder of the UCI-HAR-Dataset is the working directory of R (in case it is not, integrate the R code with the  function setwd() to set the correct working directory), and loaded the *dplyr* package with command library(), the first step in the run_analysis.R file is to load the features dataset, *features.txt*, and the activity labels, from *activity_labels.txt*

- *features_lab* is a data.frame object with 561 observation of 2 variables, pairing a textual description of each single activity to a key index, useful for matching
- *activity_lab* is a data,frame object with 6 observation of 2 variables, pairing the full activity label to its class (number from 1-6)

Before loading the other datasets, where the actual observed values are, two other useful steps are performed.
First, a numerical vector, called *spec_col* is created by extracting from features_lab the index of the features to be used in the tidy dataset. In fact, as stated in the assignment, the features to be considered should be only the ones representing mean and standard.deviation values.
The vector of indices identifying these features will be used later in the transformation steps.
Second, with the use of Regular Expressions, the character strings in features_lab data.frame are transformed more eloquent labels, with the following steps:
- character "-" is replaced by "_" in every occurrences
- curl brackets are removed by each string, where present
- the character "_" is placed after the first character (f or t), in order to separate these identifiers (explained in details in the last section of this CodeBook) from the actual activity label.

With all the required information it is possible to load the other datasets and merge them to obtain a single data.frame.
First x_train, y_train and subject_train are loaded into R, and merged together (function cbind()). Be aware that the x_train dataset is not merged entirely, but also the required features are included, by selecting the indices extracted in the variable spec_col. Finally the correct column labels for the total train dataset are assigned. The same process is, then, replicated for the test dataset.

In R global environment should be now present, two aggregated data.frames, *test* and *train*, with all the required variable necessary to create the final tidy dataset. Therefore, it is now possible to merge the two data.frame, with rbind(), and obtain the complete dataset (10299 observation of 50 variables).

In the new full dataset is possible to substitute the class of activity with a descriptive activity name using the mapping represented by data.frame activity_lab.

At last step, before the final export of the complete tidy dataset, with the help of functions *group_by(subject, activity)* and *summarize_each(funs(mean))* from dplyr dataset it is possibile to obtain a tidy dataset, with 180 observation (6 activities * 30 subjects) of 50 variables.

Those are the steps required to create this tidy dataset form the row data in the UCI-HAR-Dataset

#Analysis of the newly created tidy dataset
The newly created tidy dataset has 180 observation, one for each combination of activity (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) and subject who performed the activity.
The variables (as column) are 51, where the first 2 are qualitative variables, as follows:
1. *subject*, identifies the subject who performed the activity
1. *activity*, descriptive activity label
The other variables, where the actual average values of the total observation for each activity-subject couple are stored, can be broke down to 8 type of observation, for which are available the mean and the standard deviation for each dimension (X, Y, Z). resulting in 48 different variables.
Before explaining each single type of observation, it may be useful to clarify in advance the meaning of the first character. It can either be:
- t, which stands for *time* domain signal
- f, which stands for *frequency* domain signal
These are the type of observations included in the tidy dataset (recall that each type has 8 variables: mean, std.dev and a value for each dimension X, Y, Z)
1. t_BodyAcc
1. t_GravityAcc
1. t_BodyAccJerk
1. t_BodyGyro_mean
1. t_BodyGyroJerk
1. f_BodyAcc
1. f_BodyAccJerk
1. f_BodyGyro

For explanation on how the single observations were recorded please refer to the file *features_info.txt* in the UCI-HAR-Dataset, which is far more detailed on how the values of each single value was observed 

# Conclusion
This is the detailed explanation of the transformation steps included in the run_analysis.R script and resulting variables in the tidy dataset (tidy_data.txt). 

