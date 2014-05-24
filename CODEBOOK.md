Getting and Cleaning Data - Course Project Codebook
===================================

## Study Design

This data was downloaded from:

* Data: [UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

Within there are `README.txt` and `features_info.txt` describing study design and feature selection.

Study design is described as follows:

"
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details."

## Code Book

### Variables

Observations are organized, accordingly to `README.txt`, as:

"For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment."

For more information concerning features, refer to ``features_info.txt` included in this repository.

The following variables were used :

* features : The feature names from `features.txt`. A string vector.

* activities : The activity names from `activity_labels.txt`. A string vector.

* trainX : Training records from `X_train.txt`. Data frame of 7352 feature vectors of length 561, all normalized and bounded within [-1,1].
* trainY : Training labels from `y_train.txt`. Data frame of 7352 labels, each ranging from 1 to 6.
* trainS : Training subjects from `subject_train.txt`. Data frame of 7352 subjects, ranging from 1 to 30.

* testX : Test records from `X_test.txt`. Like trainX, but of size 2947.
* testY : Test labels from `y_test.txt`. Like trainY, but of size 2947.
* testS : Test subjects from `subject_test.txt`. Like trainS, but of size 2947.

* train : Complete training set, where trainY and trainS are appended to trainX. Data frame of features, labels and subjects.

* test : Complete test set, where to testX are appended testY and testS. Data frame of features, labels and subjects.

* featureNames : Feature names were processed in order to avoid illegality in R and aid readability. Parentheses and hyphens were removed, commas were substituted by dots. A string vector.

* names : The result of appending to featureNames the labels `label` and `subject`, a string vector.

* match : String vector used to subset into the desired columns. Features which contain `mean` or `std` in their name were kept, while others were dropped. Features containing `meanFreq` were kept as we interpreted a slight ambiguity  in the statement "Extracts only the measurements on the mean and standard deviation for each measurement." and therefore chose the more general option of including them, as they are averages although dependent on other features.

* data : The result of binding, by rows, the training and test sets while subsetting into the target features. Data frame of features, labels and subjects.

* tidy : The result of aggregating means of the `data` data frame by label and subject pairs. A final column of factors was appended, a factor on the labels column, as to assign descriptive english names to labeled activities. A data frame of features, labels, subjects and activities. Furthermore, an error in feature names was corrected, apparently a result of human error, a few features had names of `fBodyBody` which is inconsistent with the given `features_info.txt`.
