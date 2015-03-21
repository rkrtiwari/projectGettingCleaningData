## Getting and Cleaning Data Course Project

### input data
The input data are in two folders: 1) test and 2) train. Both the folders contain 3 files: 1) subject\_??.txt 2) X\_??.txt and 3)
y\_??.txt, where ?? represents the corresponding folder name. As the name suggests, the two folders test and train provide test and training data. The data pertains to various pre-processed sensor signals (accelerometer and gyroscope) recorded by smartphones of 30 volunteers for 6 different activities. The actual data is in the file X\_??.txt. The file subject\_??.txt and y_??.txt contain identifier for the subjects who carried out the experiments and their corresponding activity, respectively. 

The test and train folders also contain another folder named Inertial Signals. The contents of this folder is not useful for our case.

### Output data
The output data is contained in the file tidyData.txt. The output file contains the average of the means and the standard deviations of all the variables for each activity and each subject (It is to be noted that there are multiple observations of means and standard deviations of a given activity done by a given subject. 

There is just a single output file that aggregates the results of both test and train folders. Additionally, in the output file the subject and the activity identifiers have been included. Also, the activity identifier contains the actual activity name in place of a numeric value.  


### Description of the steps to obtain the output file


1. It merged the subject identifier, the activity identifier, and the actual data into a single file for both the test and the train data.

2. The test and the train data obtained after merging in step 1 are merged together to obtain mergedData.

3. The identifier for the activity label is replaced with the actual activity name. It is to be noted that the activity labels here does not have any underscore as suggested in one of the lectures <https://github.com/rkrtiwari/courses/blob/master/03_GettingData/04_01_editingTextVariables/index.md>

4. The descriptive column name is added.

5. mergedData is parsed so that it contains only the subject identifier, the activity identifier, and the columns that has mean or std in its name.

5. Finally, it creates a tidy data set that contains the average of each variable for each activity and each subject and write it to the file tidyData.txt. 

