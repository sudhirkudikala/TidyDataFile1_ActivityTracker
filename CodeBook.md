## CODE BOOK

Code book describes the variables, the data, and any transformations or work that was performed to clean up the data

#### Background: Activity monitors in smart phones are equiped to record reading of accelerometer and gyroscope.
#### Experiment: Activities of daily living while carrying a waist-mounted smartphone with embedded inertial sensors.
#### Number of participants: 30 Persons.
#### Data Source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
#### Activity_Names: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING


### Source Files: 
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'train/subject_train.txt': Each row identifies the subject who performed the activity.

### Variables and related data transformation to tidy data:

Xtrain, Xtest, Xmerge: Training Set data for 561 instances is loaded to first two variables and merged to third

ytrain, ytest, ymerge: Training labels data is loaded to first two variables and merged to third

subject_train, subject_test, subjectmerge: train and test subject information is loaded and merged

features: lists the features recorded for each observation

mean_std_index: Only mean features and standard deviation features are of interest. 
                Be sure to exclude features like meanfreq like features which are not mean

measurements: Shortlist the mean and standard deviation observations for 10299 records

Three data frames of interest training set, training labels, and subjects are updated with appropriate column names

### Variables and related data transformation to find averages:

Task: A table the size of number of unique activities times number of unique subject is created to pupulate the average of each combination

noofVariables: number of mean and standard deviation variables

Varcolumn: the column variable used in for matrix to populate averages

uniquesubjects: number of unique subjects

unique_sub_act: An array used to accumulate all the observations for a unique combination of 
subject and activity





















