# You should create one R script called run_analysis.R that does the following. 
## 1. Merges the training and the test sets to create one data set.

Xtrain <- read.table("train/X_train.txt")
Xtest <- read.table("test/X_test.txt")
Xmerge <- rbind(Xtrain,Xtest)

ytrain <- read.table("train/y_train.txt")
ytest <- read.table("test/y_test.txt")
ymerge <- rbind(ytrain,ytest)

subject_train <- read.table("train/subject_train.txt")
subject_test <- read.table("test/subject_test.txt")
subjectmerge <- rbind(subject_train,subject_test)
	
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

features <- read.table("features.txt")
# exclude features like fBodyAcc-meanFreq()-X
#mean_index <- grep("-mean\\(\\)", features[,2])
#std_index <- grep("-std\\(\\)", features[,2])
#mean_measurements <- Xmerge[,mean_index]
#std_measurements <- Xmerge[,std_index]
#both_measurements <- cbind(mean_measurements, std_measurements) # std and mean as seperate blocks

# be sure to exclude features like fBodyAcc-meanFreq()-X, which is not a mean() feature
mean_std_index <- grep("-mean\\(\\)|-std\\(\\)", features[,2])
measurements <- Xmerge[, mean_std_index]

## 3. Uses descriptive activity names to name the activities in the data set
# Update TRAINING LABELS dataset with names like STANDING, WALKING etc instead of number
activity_name <- read.table("activity_labels.txt")
ymerge[,1] = activity_name[ymerge[,1],2]


## 4. Appropriately labels the data set with descriptive variable names. 
# appropriately label Training set column
names(measurements) = toupper(features[mean_std_index,2])
# appropriately label Subject data set column
names(subjectmerge) <- "Subject_Number"
# appropriately label TRAINING LABELS data set column
names(ymerge) <- "Activity_Name"

firstoutput <- cbind(subjectmerge, ymerge, measurements)
write.table(firstoutput, "tidydatafile1.txt")

# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
## A table the size of number of unique activities times number of unique subject is created to pupulate the average of each combination
noofVariables     = length(mean_std_index)
Varcolumn        = noofVariables + 2
uniquesubjects = unique(firstoutput$Subject_Number)
noofuniqueS     = length(uniquesubjects)
noofActivities    = length(activity_name[,1])
## create a table to populate second output
secondoutput   = firstoutput[1: (noofuniqueS * noofActivities),]

rowcount = 1
for(sub in 1: noofuniqueS){
	for(act in 1: noofActivities){
		secondoutput[rowcount, 1] = uniquesubjects[sub]
		secondoutput[rowcount, 2] = activity_name[act, 2]
		unique_sub_act <- firstoutput[firstoutput$Subject_Number == sub & firstoutput$Activity_Name == activity_name[act,2],]
		secondoutput[rowcount, 3:Varcolumn] <- colMeans(unique_sub_act[, 3:Varcolumn])
		rowcount = rowcount + 1
	}
}
write.table(secondoutput, "averagesfile2.txt")	
 
