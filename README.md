README 
============================
Getting and Cleaning the Data project
============================
============================
#Introduction

The assignment of this project is to create a tidy data, to be used in later analysis, from a raw dataset.
In this repository you can find two files:

1. *run_analysis.R*, is the actual R code which assure the replicability of the transformations require to clean the raw dataset and obtain the tidy dataset, as required.

2. *CodeBook.md*, is a text file with all the required information regarding the variables, the data and the performed transformations.

#R code
the R code (run_analysis.R) is already quit self-explicative. All the steps have clarifying comments, so that whoever is aware of the assignment of the course project can easily understand the steps performed.
A more general explanation (with in-depth details) of the transformation steps are included in the CodeBook.md
Here a brief list of the steps included:

1. Load the raw data in R workspace in single, different data.frame object
1. Use Regular Expression to extract the index for the required features
1. Transform the previous activity name in more clear and meaningful labels
1. Merge the train and test dataset, considering only the required features (outcome of the previous step)
1. Assigning the previously defined activity labels
1. Use descriptive activity names to define the activities in the data set
1. Create the final independent tidy dataset, where data is grouped by subject and activity and summarized with average values.

Please refer to the *CodeBook.md* file for all the in-depth details regarding the steps above and for the others required information.