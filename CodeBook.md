==================================================================
Human Activity Recognition Using Smartphones Dataset:
tidy_data_set.txt subset and run_analysis.R script
Version 1.0
==================================================================
Donagh Morris, JHU Data Science, Getting and Cleaning Data student
==================================================================

ORIGINAL DATA SET DESCRIPTION:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each original data set record it is provided:
====================================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The original dataset includes the following files:
===================================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes on orignal data set: 
============================
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about the original dataset contact: activityrecognition@smartlab.ws

License regarding original data set:
=====================================
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

run_analysis.R Script
=======================

The script reads in files from the above described original data set in the current
directory of the unzipped archive directory, extracts on the columns with
mean / Mean / std (standard deviation in the column names, prepends the subject and activity
columns, and then subsets the data frame to give the mean of each of the phone movement
data columns for each activity of each subject. 

tidy_data_set.txt  data set
=============================

Thie tidy data set was write with write.table() and so columns are separated by white space.

The column names and units are as follows:

SubjectNumber  subject ID number (1 to 30)
Activity  characters describing activity (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
tBodyAccmeanX   m/s^2
tBodyAccmeanY   m/s^2
tBodyAccmeanZ   m/s^2
tBodyAccstdX   m/s^2
tBodyAccstdY   m/s^2
tBodyAccstdZ   m/s^2
tGravityAccmeanX   g
tGravityAccmeanY   g
tGravityAccmeanZ   g
tGravityAccstdX   g
tGravityAccstdY   g
tGravityAccstdZ   g
tBodyAccJerkmeanX   m/s^2
tBodyAccJerkmeanY   m/s^2
tBodyAccJerkmeanZ   m/s^2
tBodyAccJerkstdX   m/s^2
tBodyAccJerkstdY   m/s^2
tBodyAccJerkstdZ   m/s^2
tBodyGyromeanX　　radians / s^2
tBodyGyromeanY　　radians / s^2
tBodyGyromeanZ　　radians / s^2
tBodyGyrostdX　　radians / s^2
tBodyGyrostdY　　radians / s^2
tBodyGyrostdZ　　radians / s^2
tBodyGyroJerkmeanX　　radians / s^2
tBodyGyroJerkmeanY　　radians / s^2
tBodyGyroJerkmeanZ　　radians / s^2
tBodyGyroJerkstdX　　radians / s^2
tBodyGyroJerkstdY　　radians / s^2
tBodyGyroJerkstdZ　　radians / s^2
tBodyAccMagmean   m/s^2
tBodyAccMagstd   m/s^2
tGravityAccMagmean   g
tGravityAccMagstd   g
tBodyAccJerkMagmean   m/s^2
tBodyAccJerkMagstd   m/s^2
tBodyGyroMagmean   m/s^2
tBodyGyroMagstd   m/s^2
tBodyGyroJerkMagmean　　radians / s^2
tBodyGyroJerkMagstd　　radians / s^2
fBodyAccmeanX   m/s^2
fBodyAccmeanY   m/s^2
fBodyAccmeanZ   m/s^2
fBodyAccstdX   m/s^2
fBodyAccstdY   m/s^2
fBodyAccstdZ   m/s^2
fBodyAccmeanFreqX   mhz
fBodyAccmeanFreqY   mhz
fBodyAccmeanFreqZ   mhz
fBodyAccJerkmeanX   n/s^2
fBodyAccJerkmeanY   n/s^2
fBodyAccJerkmeanZ   n/s^2
fBodyAccJerkstdX   n/s^2
fBodyAccJerkstdY   n/s^2
fBodyAccJerkstdZ   n/s^2
fBodyAccJerkmeanFreqX   mhz
fBodyAccJerkmeanFreqY   mhz
fBodyAccJerkmeanFreqZ   mhz
fBodyGyromeanX   radians / s^2
fBodyGyromeanY   radians / s^2
fBodyGyromeanZ   radians / s^2
fBodyGyrostdX   radians / s^2
fBodyGyrostdY   radians / s^2
fBodyGyrostdZ   radians / s^2
fBodyGyromeanFreqX   mhz
fBodyGyromeanFreqY   mhz
fBodyGyromeanFreqZ   mhz
fBodyAccMagmean   m/s^2
fBodyAccMagstd   m/s^2
fBodyAccMagmeanFreq   mhz
fBodyBodyAccJerkMagmean m/s^2
fBodyBodyAccJerkMagstd m/s^2
fBodyBodyAccJerkMagmeanFreq   m/s~2
fBodyBodyGyroMagmean     radians / s^2
fBodyBodyGyroMagstd     radians / s^2
fBodyBodyGyroMagmeanFreq   mhz
fBodyBodyGyroJerkMagmean     radians / s^2
fBodyBodyGyroJerkMagstd     radians / s^2
fBodyBodyGyroJerkMagmeanFreq   mhz
angletBodyAccMeancommagravity   m\s^2 X g
angletBodyAccJerkMeancommagravityMean  radians / s^2  X  g
angletBodyGyroMeancommagravityMean  radians / s^2  X  g
angletBodyGyroJerkMeancommagravityMean  radians / s^2  X  g
angleXcommagravityMean   g
angleYcommagravityMean   g
angleZcommagravityMean   g


The rows represent:

the mean for each of the phone movement data columns for each activity of each subject. 

