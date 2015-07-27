## CodeBook
In this file is described:
* the original data set
* transformations by *run_analysis.R*
* definition of new variables in *TidyDataSet.txt*

### Original Data Set
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. The data set used can be downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

A full description of original data set is available here:
http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.names

### Transformations
* `X_train.txt` is read into `featuresTrain`.
* `y_train.txt` is read into `activityTrain`.
* `subject_train.txt` is read into `subjectTrain`.

* `X_test.txt` is read into `featuresTest`.
* `y_test.txt` is read into `activityTest`.
* `subject_test.txt` is read into `subjectTest`.

* `features.txt` is read into `featureNames`.
* `activity_labels.txt` is read into `activityLabels`.

### Definition of new variables
* The subjects of training and test data set are merged to `subject`.
* The activities of training and test data set are merged to `activity`.
* The features of training and test data set are merged to `features`.
* The name of the features are set into `features` from `featureNames`.
* `features`, `activity` and `subject` are merged to data frame `oneDataSet`.
* Activity, subject and columns that contain std or mean are taken into `meanAndSdColumns` .
* `extractedDataSet` is created with data from columns in `meanAndSdColumns`.
* `Activity` column in `extractedDataSet` is updated with descriptive names of activities taken from `activityNames`.
* Acronyms in variable names of `extractedDataSet` are replaced with descriptive labels (e.g. 'Acc', 'Gyro', 'Mag', 't' and 'f' are replaced to 'Accelerometer', 'Gyroscpoe', 'Magnitude', 'Time' and 'Frequency').
* `tidyDataSet` is created as a data set with average for each activity and subject of `extractedDataSet`. Entries in this data set are ordered based on activity and subject.
* The data from  `TidyDataSet` is written into `TidyDataSet.txt`. This output is a space-delimited value file. The header line contains the names of the variables.
