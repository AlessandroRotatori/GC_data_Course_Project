 CodeBook
=============================
Getting and Cleaning the Data project
=============================
=============================
# Introduction
This CodeBook is structured as follows:

1. Brief description of the raw dataset
1. Explanation of the R code
1. Analysis of the tidy dataset

# Description of raw dataset
The data provided for this assignment in the *UCI-HAR-Dataset.zip* is split in smaller datasets with different informations.
The dataset use in the run_analysis.R are the following:

1. *subject_train* and *subject_test*. Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30 (7352 obs. for train and 2947 obs. for test).
1. *X_train* and *X_test*. Each row identifies a unique vector of collected data (561 variables, 7352 obs. for train and 2947 obs. for test)
1. *Y_train* and *Y_test*. Vector of activity class label (7352 obs. for train and 2947 obs. for test)
1.  *activity_label*. Links the class labels with their activity name.
1. *features*. List of all features.

# Explanation of the R code
Assuming the the main folder of the UCI-HAR-Dataset is the working directory of R (in case use function setwd()), and loaded the *dplyr* package with command library(), the first step in the run_analysis.R file is to load the features dataset, *features.txt*, and the activity labels, from *activity_labels.txt*