## READ_ME
#### This read me explains how all of the scripts work and how they are connected
#### Background: Activity monitor data from wearable gadgets in desperate files is transformed to tidy data using R.
#### Purpose:  Extract, load and transform to obtain tidy data. Calculate desired averages of mean and standard devation observations
                 
                 
#### Number of Script segments: 5

### First Segment: Merges the training and the test sets to create one data set.

- The training sets for train and test data sets are loaded to tables and merged
- The training labels for train and test data sets are loaded to tables and merged
- The subjects in train and test data sets are loaded to tables and merged

### Second Segment: Extracts only the measurements on the mean and standard deviation for each measurement. 

- Features are loaded to a table and grep command is used to identify mean and standard deviation features
- The shortlist excludes features that look like mean but are not, example, meanfreq


### Third Segment: Uses descriptive activity names to name the activities in the data set
- Update TRAINING LABELS dataset with names like STANDING, WALKING etc instead of number


### Fourth Segment: Appropriately labels the data set with descriptive variable names. 
- Appropriately label Training set column
- Appropriately label Subject data set column
- Appropriately label TRAINING LABELS data set column
- Merge the three above three table to obtain tidy data with observations for mean and standard deviaiton
- The first column is Subject Number, second column is activity
- Remaining columns are feature names in upper case

### Fifth Segment: Creates a second, independent tidy data set with the average of each variable for each activity and each subject
                   
- A table the size of number of unique activities times number of unique subject is created to pupulate the average of     each combination
- The averages table has same number of columns as the tidy data table
- A nested for loop for the cartesian production of number of unique activities and unique subjects is initiated
- Each iteration accumulates and finds mean of all observations for a unique combination of subject and activity



