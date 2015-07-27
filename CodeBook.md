## CodeBook
In this file is described:
* the original data set
* transformations by *run_analysis.R*
* definition of new variables in *TidyDataSet.txt*

### Original Data Set
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. The data set used can be downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

A full description of original data set is available here:
<http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.names>

### Transformations
* 'X_train.txt' is read into featuresTrain.
* y_train.txt is read into activityTrain.
* subject_train.txt is read into subjectTrain.
* X_test.txt is read into featuresTest.
* y_test.txt is read into activityTest.
* subject_test.txt is read into subjectTest.
* features.txt is read into featureNames.
*activity_labels.txt is read into activityLabels.
