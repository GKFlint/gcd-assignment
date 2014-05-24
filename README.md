Getting and Cleaning Data - Course Project
==============

## Introduction

In order to demonstrate our ability to prepare a tidy data set, this project makes use of data collected from accelerometers of Samsung Galaxy S smartphones.

## Data

The data for this project can be downloaded from:

* Dataset: [UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

And is described fully at the site where it was obtained:

* Repository: [UCI Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The data includes `README.txt` and `features_info.txt` files describing the variables included within and study design. These were included in this repository for reference. It has a total of 10,299 observations of 561 features, divided between training and test sets.

## Assignment

To Submit:

* A tidy data set as described below.
 
* A link to a Github repository with your script for performing the analysis, and.

* A code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

 To create one R script was created called `run_analysis.R` that does the following:
 
* Merges the training and the test sets to create one data set.

* Extracts only the measurements on the mean and standard deviation for each measurement. 

* Uses descriptive activity names to name the activities in the data set

* Appropriately labels the data set with descriptive activity names. 

* Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### Execution

We'll assume that the data has been previously downloaded, unzipped and the working directory contains a `UCI HAR Dataset` folder.

We initially load the relevant, separated variables (observations, labels and subjects for both test and training sets, along with activity and feature names) then bind label and subject columns to their respective sets.

Afterwards we process feature names to avoid illegal or unreadable names and assign them to the feature vectors.

Feature names are used to subset only the features related to mean or standard deviation measures (refer to `CODEBOOK.md` for more information) and merge training and test sets.

Finally, we create a second data set by averaging each feature for activity and subject pairs, append an additional column for activity names then print the data set to a `tidydata.txt` file.
