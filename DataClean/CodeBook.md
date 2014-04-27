Code Book for Human Activity Recognition Using Smartphones Data Set
===================================================================
Prepared for Coursera Getting & Cleaning Data Course Peer Review Project
------------------------------------------------------------------------
by Mort Goldman 
---------------

Note this work derives from the work of:

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

This study aggregated the results of the prior study, producing a file containing averages of mean and standard deviation variables in the original study by Subject and Activity. 

License:
--------
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

******
Data Collection Description
---------------------------
Please review the original study description for full details of the data collection process.  Specifically refer to http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones which states:

> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

> The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

> Check the README.txt file for further details about this dataset.


> Attribute Information:

> For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The current study simply aggregates the features provided in the original study that are means or standard deviations.
*****
Attribute Description
---------------------

As stated in the feature_list.txt document in the original study, 
> The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

> Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

> Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

> These signals were used to estimate variables of the feature vector for each pattern:  
> '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

> tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

> The set of variables that were estimated from these signals are: 

> mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

> Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

> gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

For the current study we selected the estimated mean and standard deviation measures, and calculated means for each of these variables per Subject and Activity.  Measures included in this study are shown in the following table:

Variable Name | Values or Explanation
------------- | ---------------------
Subject| The identifier for a Subject.  Subject Ids range from 1 - 30.
Activity | There are 6 types of Activities.
         | 1 = WALKING
         | 2 = WALKING UPSTAIRS
         | 3 = WALKING_DOWNSTAIRS
         | 4 = SITTING
         | 5 = STANDING
         | 6 = LAYING
tBodyAcc-mean()-X            | Mean value normalized and bounded within [-1,1]
tBodyAcc-mean()-Y           | Mean value normalized and bounded within [-1,1]
tBodyAcc-mean()-Z            | Mean value normalized and bounded within [-1,1]
tGravityAcc-mean()-X         | Mean value normalized and bounded within [-1,1]
tGravityAcc-mean()-Y         | Mean value normalized and bounded within [-1,1]
tGravityAcc-mean()-Z        | Mean value normalized and bounded within [-1,1]
tBodyAccJerk-mean()-X        | Mean value normalized and bounded within [-1,1]
tBodyAccJerk-mean()-Y        | Mean value normalized and bounded within [-1,1]
tBodyAccJerk-mean()-Z        | Mean value normalized and bounded within [-1,1]
tBodyGyro-mean()-X          | Mean value normalized and bounded within [-1,1]
tBodyGyro-mean()-Y           | Mean value normalized and bounded within [-1,1]
tBodyGyro-mean()-Z           | Mean value normalized and bounded within [-1,1]
tBodyGyroJerk-mean()-X       | Mean value normalized and bounded within [-1,1]
tBodyGyroJerk-mean()-Y      | Mean value normalized and bounded within [-1,1]
tBodyGyroJerk-mean()-Z       | Mean value normalized and bounded within [-1,1]
tBodyAccMag-mean()           | Mean value normalized and bounded within [-1,1]
tGravityAccMag-mean()        | Mean value normalized and bounded within [-1,1]
tBodyAccJerkMag-mean()      | Mean value normalized and bounded within [-1,1]
tBodyGyroMag-mean()          | Mean value normalized and bounded within [-1,1]
tBodyGyroJerkMag-mean()      | Mean value normalized and bounded within [-1,1]
fBodyAcc-mean()-X            | Mean value normalized and bounded within [-1,1]
fBodyAcc-mean()-Y           | Mean value normalized and bounded within [-1,1]
fBodyAcc-mean()-Z            | Mean value normalized and bounded within [-1,1]
fBodyAccJerk-mean()-X        | Mean value normalized and bounded within [-1,1]
fBodyAccJerk-mean()-Y        | Mean value normalized and bounded within [-1,1]
fBodyAccJerk-mean()-Z       | Mean value normalized and bounded within [-1,1]
fBodyGyro-mean()-X           | Mean value normalized and bounded within [-1,1]
fBodyGyro-mean()-Y           | Mean value normalized and bounded within [-1,1]
fBodyGyro-mean()-Z           | Mean value normalized and bounded within [-1,1]
fBodyAccMag-mean()          | Mean value normalized and bounded within [-1,1]
fBodyBodyAccJerkMag-mean()   | Mean value normalized and bounded within [-1,1]
fBodyBodyGyroMag-mean()      | Mean value normalized and bounded within [-1,1]
fBodyBodyGyroJerkMag-mean()  | Mean value normalized and bounded within [-1,1]
tBodyAcc-std()-X            | Mean value normalized and bounded within [-1,1]
tBodyAcc-std()-Y             | Mean value normalized and bounded within [-1,1]
tBodyAcc-std()-Z             | Mean value normalized and bounded within [-1,1]
tGravityAcc-std()-X          | Mean value normalized and bounded within [-1,1]
tGravityAcc-std()-Y         | Mean value normalized and bounded within [-1,1]
tGravityAcc-std()-Z          | Mean value normalized and bounded within [-1,1]
tBodyAccJerk-std()-X         | Mean value normalized and bounded within [-1,1]
tBodyAccJerk-std()-Y         | Mean value normalized and bounded within [-1,1]
tBodyAccJerk-std()-Z        | Mean value normalized and bounded within [-1,1]
tBodyGyro-std()-X            | Mean value normalized and bounded within [-1,1]
tBodyGyro-std()-Y            | Mean value normalized and bounded within [-1,1]
tBodyGyro-std()-Z            | Mean value normalized and bounded within [-1,1]
tBodyGyroJerk-std()-X       | Mean value normalized and bounded within [-1,1]
tBodyGyroJerk-std()-Y        | Mean value normalized and bounded within [-1,1]
tBodyGyroJerk-std()-Z        | Mean value normalized and bounded within [-1,1]
tBodyAccMag-std()            | Mean value normalized and bounded within [-1,1]
tGravityAccMag-std()        | Mean value normalized and bounded within [-1,1]
tBodyAccJerkMag-std()        | Mean value normalized and bounded within [-1,1]
tBodyGyroMag-std()           | Mean value normalized and bounded within [-1,1]
tBodyGyroJerkMag-std()       | Mean value normalized and bounded within [-1,1]
fBodyAcc-std()-X            | Mean value normalized and bounded within [-1,1]
fBodyAcc-std()-Y             | Mean value normalized and bounded within [-1,1]
fBodyAcc-std()-Z             | Mean value normalized and bounded within [-1,1]
fBodyAccJerk-std()-X         | Mean value normalized and bounded within [-1,1]
fBodyAccJerk-std()-Y        | Mean value normalized and bounded within [-1,1]
fBodyAccJerk-std()-Z         | Mean value normalized and bounded within [-1,1]
fBodyGyro-std()-X            | Mean value normalized and bounded within [-1,1]
fBodyGyro-std()-Y            | Mean value normalized and bounded within [-1,1]
fBodyGyro-std()-Z           | Mean value normalized and bounded within [-1,1]
fBodyAccMag-std()            | Mean value normalized and bounded within [-1,1]
fBodyBodyAccJerkMag-std()    | Mean value normalized and bounded within [-1,1]
fBodyBodyGyroMag-std()       | Mean value normalized and bounded within [-1,1]
fBodyBodyGyroJerkMag-std() | Mean value normalized and bounded within [-1,1]
