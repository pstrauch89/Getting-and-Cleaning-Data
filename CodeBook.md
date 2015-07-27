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
* The features of training and test data sete merged to `features`.

* The name of the features are set in `features` from `featureNames`.
* `features`, `activity` and `subject` are merged to form `completeData`.
* Indices of columns that contain std or mean, activity and subject are taken into `requiredColumns` .
* `extractedData` is created with data from columns in `requiredColumns`.
* `Activity` column in `extractedData` is updated with descriptive names of activities taken from `activityLabels`. `Activity` column is expressed as a factor variable.
* Acronyms in variable names in `extractedData`, like 'Acc', 'Gyro', 'Mag', 't' and 'f' are replaced with descriptive labels such as 'Accelerometer', 'Gyroscpoe', 'Magnitude', 'Time' and 'Frequency'.
* `tidyData` is created as a set with average for each activity and subject of `extractedData`. Entries in `tidyData` are ordered based on activity and subject.
* Finally, the data in `tidyData` is written into `Tidy.txt`.

##Output Data Set

The output data `Tidy.txt` is a a space-delimited value file. The header line contains the names of the variables. It contains the mean and standard deviation values of the data contained in the input files. The header is restructued in an understandable manner. 
