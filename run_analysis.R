#Read in the X_test data and the X_train
xtest <- read.table("test/X_test.txt")
xtrain <- read.table("train/X_train.txt")

#Read in the activities data and the subject for both test and train
ytest <- read.table("test/y_test.txt")
subjecttest <- read.table("test/subject_test.txt")

ytrain <- read.table("train/y_train.txt")
subjecttrain <- read.table("train/subject_train.txt")

# Prepend the activities column and subject column in that order for both test and train
#(Therefore activities data is in second column and subject data goes in as first column)
testdatawithy <- cbind(ytest, xtest)
testdata <- cbind(subjecttest, testdatawithy)

traindatawithy <- cbind(ytrain, xtrain)
traindata <- cbind(subjecttrain, traindatawithy)

# Append the full train rows to the full test rows creating the full single data set
data <- rbind(testdata, traindata)

# Read in the features table
features <- read.table("features.txt")

# Find the positions of the features with mean or std text in the feature name
meanstdcols <- grep("mean|std", features[,2], ignore.case=TRUE)

# Increment positions by 2 because data has subject and activity in first two columns
for (i in 1:length(meanstdcols)) {
   meanstdcols[i] <- meanstdcols[i]+2
}

# Prepend cols 1 and 2 to the numeric vector meantstdcols created above
# This will give all the column numbers for the subset we want
subdatacols <- c(1, 2, meanstdcols)

# Create the subset calling it subdata
subdata <- data[subdatacols]

## Create the tidy data set of the means for each subject and activity

# Firstly create the tidy data frame namely the column names more appropriately
# (removing commas, "()", etc.
tidydata <- data.frame(
SubjectNumber=numeric(),
Activity=character(),
tBodyAccmeanX=numeric(),
tBodyAccmeanY=numeric(),
tBodyAccmeanZ=numeric(),
tBodyAccstdX=numeric(),
tBodyAccstdY=numeric(),
tBodyAccstdZ=numeric(),
tGravityAccmeanX=numeric(),
tGravityAccmeanY=numeric(),
tGravityAccmeanZ=numeric(),
tGravityAccstdX=numeric(),
tGravityAccstdY=numeric(),
tGravityAccstdZ=numeric(),
tBodyAccJerkmeanX=numeric(),
tBodyAccJerkmeanY=numeric(),
tBodyAccJerkmeanZ=numeric(),
tBodyAccJerkstdX=numeric(),
tBodyAccJerkstdY=numeric(),
tBodyAccJerkstdZ=numeric(),
tBodyGyromeanX=numeric(),
tBodyGyromeanY=numeric(),
tBodyGyromeanZ=numeric(),
tBodyGyrostdX=numeric(),
tBodyGyrostdY=numeric(),
tBodyGyrostdZ=numeric(),
tBodyGyroJerkmeanX=numeric(),
tBodyGyroJerkmeanY=numeric(),
tBodyGyroJerkmeanZ=numeric(),
tBodyGyroJerkstdX=numeric(),
tBodyGyroJerkstdY=numeric(),
tBodyGyroJerkstdZ=numeric(),
tBodyAccMagmean=numeric(),
tBodyAccMagstd=numeric(),
tGravityAccMagmean=numeric(),
tGravityAccMagstd=numeric(),
tBodyAccJerkMagmean=numeric(),
tBodyAccJerkMagstd=numeric(),
tBodyGyroMagmean=numeric(),
tBodyGyroMagstd=numeric(),
tBodyGyroJerkMagmean=numeric(),
tBodyGyroJerkMagstd=numeric(),
fBodyAccmeanX=numeric(),
fBodyAccmeanY=numeric(),
fBodyAccmeanZ=numeric(),
fBodyAccstdX=numeric(),
fBodyAccstdY=numeric(),
fBodyAccstdZ=numeric(),
fBodyAccmeanFreqX=numeric(),
fBodyAccmeanFreqY=numeric(),
fBodyAccmeanFreqZ=numeric(),
fBodyAccJerkmeanX=numeric(),
fBodyAccJerkmeanY=numeric(),
fBodyAccJerkmeanZ=numeric(),
fBodyAccJerkstdX=numeric(),
fBodyAccJerkstdY=numeric(),
fBodyAccJerkstdZ=numeric(),
fBodyAccJerkmeanFreqX=numeric(),
fBodyAccJerkmeanFreqY=numeric(),
fBodyAccJerkmeanFreqZ=numeric(),
fBodyGyromeanX=numeric(),
fBodyGyromeanY=numeric(),
fBodyGyromeanZ=numeric(),
fBodyGyrostdX=numeric(),
fBodyGyrostdY=numeric(),
fBodyGyrostdZ=numeric(),
fBodyGyromeanFreqX=numeric(),
fBodyGyromeanFreqY=numeric(),
fBodyGyromeanFreqZ=numeric(),
fBodyAccMagmean=numeric(),
fBodyAccMagstd=numeric(),
fBodyAccMagmeanFreq=numeric(),
fBodyBodyAccJerkMagmean=numeric(),
fBodyBodyAccJerkMagstd=numeric(),
fBodyBodyAccJerkMagmeanFreq=numeric(),
fBodyBodyGyroMagmean=numeric(),
fBodyBodyGyroMagstd=numeric(),
fBodyBodyGyroMagmeanFreq=numeric(),
fBodyBodyGyroJerkMagmean=numeric(),
fBodyBodyGyroJerkMagstd=numeric(),
fBodyBodyGyroJerkMagmeanFreq=numeric(),
angletBodyAccMeancommagravity=numeric(),
angletBodyAccJerkMeancommagravityMean=numeric(),
angletBodyGyroMeancommagravityMean=numeric(),
angletBodyGyroJerkMeancommagravityMean=numeric(),
angleXcommagravityMean=numeric(),
angleYcommagravityMean=numeric(),
angleZcommagravityMean=numeric(),
stringsAsFactors=FALSE
)


# Now populate the tidydata data frame with the means for each activity per each subject
# Replace the activity number with the activity text at the same time

# Read in the activities list
activities <- read.table("activity_labels.txt")

row <- 1

for (i in 1:30) {
    for (j in 1:6) {

       tidydata[row,] <- colMeans( subdata[((subdata[,1] = 1)&&(subdata[,2] = j)), ] )  
       tidydata[row, 2] <- as.character(activities[j, 2])
    row <- row + 1
    }
}

# Write out the tidydata to tidy_data_set.txt
write.table(tidydata, "tidy_data_set.txt")
