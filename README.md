README 
============================
Getting and Cleaning the Data project
============================
============================
#Introduction

The purpose of this project is to create a tidy data, to be used in later analysis, from raw dataset.
In this repository you can find two files:

1. *run_analysis.R*, is the actual script with all the transformation steps required to clean the raw data and define the required tidy dataset.

2. *CodeBook.md*, is a text file with all the required information regarding the variables, the data and the performed transformations.


#R code
the R code (run_analysis.R) is already quit self-explicative. All the steps have clarifing comments, so that whoever is aware of the assignment of the course project can easily undestand the steps performed.
A more general explaination (with in-depth details) of the transformation steps are included in the CodeBook.md
Here a brief list of the steps included:

1. Load the raw data in R workspace in single, different data.frame object
1. Use Regular Expression to extract the index for the required features
1. Transfor the previous activity name in more clear and meaninful labels
1. Merge the train and test dataset, considering only the required features (outcome of the previous step)
1. Assigning the previously defined activity labels
1. Use descriptive activity names to define the activities in the data set
1. Create the final independent tidy dataset, where data is grouped by subject and activity and summarized with average values. 