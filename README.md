cleandataproject
================
### Merges the training and the test sets to create one data set.

* loads required data
* binds data into one dataset

### add names to data7

* create names for variable columns

### Convert activityID to readable fields

* create another column that converst activityID to activity names

###Extracts only the measurements on the mean,

* extract mean variables by searching "mean" using the grep function

### Extract the means with a capital "M" in Mean

* extract mean variables by searching "Mean" using the grep function

### Extracts only standard deviation

* extract standard deviation variables by searching "std" using the grep function

### Combines activityID, subjectID, activityName, mean, std

* create new dataframe with only subjectid activityname, means, and standard deviaitons

### fix up the variable names

* removed periods from names
* removed data7 reference from first two variable names
* used the tolower function to create all lowercase variable names


### Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

* Used the reshape2 library
* Used the melt function
* Used the dcast function to seperate mean data of the variables by "subjectid"" and "activityname"
