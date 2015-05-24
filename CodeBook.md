## Code Book

The input data provided by the **XXX** project, distributed as a ZIP file, is split into a large number of plain text files with columns delimited by white-space. In addition, many of the observations are split into two sets: test and train, and must be combined to produce a single tidy data set. The ZIP file contains two files: `README.txt` and `features_info.txt` that document the input data set.

The `run_analysis.R` script performs the following steps to transform the data:

1. Creates directories to store both raw input data and the tidy data sets produced
2. Download the ZIP file containing the data files and extracts its contents
3. Creates a data frame to hold data combined from the input files by assigning the Subject.ID to the first column
4. Converts Activity Names, originally stored as numbers, to descriptive words and adds them as the second column
5. Adds columns for all of the Mean and Standard Deviations for the features measured and labels the columns with descriptive variable names
6. Creates a second data set that averages each variable measurement grouped by Subject and Activity
7. Exports the individual measurement data set created in steps 1-5, and the data set created in Step 6, to space-delimited text files

The `run_analysis.R` script contains detailed comments on each step performed. Both tidied datasets are exported to the `output` subdirectory with the following names:

* `tidy-smartphone-data.txt` - a tidy dataset containing individual observations
* `tidy-smartphone-sumdata.txt` - a tidy dataset with variables averaged and grouped by subject and activity

The `run_analysis.R` script has been developed and runs successfully within R-Studio Version 0.98.1102 on Mac OSX using R Version 3.2.0.

The `tidy-smartphone-sumdata.txt` contains the following variables for each measurement:

  * Variable Name: Subject.ID  
Type: Categorical  
Format: Integer  
Description: An idenfier for the individual person holding the measuring device (cellphone)

* Variable Name: Activity.Name  
Type: Categorical  
Format: Character String  
Description: Character script describing one of the activities: WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING

* Variable Names: tBodyAcc.Mean.X, tBodyAcc.Mean.Y, tBodyAcc.Mean.Z  
Type: Continuous  
Format: Numeric  
Description: Average of measurements by Subject and Activity of means of time domain signals for body acceleration in three dimensions (X, Y, Z) as measured by the smartphone accelerometer

* Variable Names: tBodyAcc.SD.X, tBodyAcc.SD.Y, tBodyAcc.SD.Z  
Type: Continuous  
Format: Numeric  
Description: Average of measurements by Subject and Activity of standard deviations of time domain signals for body acceleration in three dimensions (X, Y, Z) as measured by the smartphone accelerometer

* Variable Names: tGravityAcc.Mean.X, tGravityAcc.Mean.Y, tGravityAcc.Mean.Z  
Type: Continuous  
Format: Numeric  
Description: Average of measurements by Subject and Activity of means of time domain signals for gravity acceleration in three dimensions (X, Y, Z) as measured by the smartphone accelerometer

* Variable Names: tGravityAcc.SD.X, tGravityAcc.SD.Y, tGravityAcc.SD.Z  
Type: Continuous  
Format: Numeric  
Description: Average of measurements by Subject and Activity of standard deviations of time domain signals for gravity acceleration in three dimensions (X, Y, Z) as measured by the smartphone accelerometer

* Variable Names: tBodyAccJerk.Mean.X, tBodyAccJerk.Mean.Y, tBodyAccJerk.Mean.Z  
Type: Continuous  
Format: Numeric  
Description: Average of measurements by Subject and Activity of means of time domain signals derived from body linear acceleration and angular velocity in three dimensions (X, Y, Z) as measured by the smartphone accelerometer

* Variable Names: tBodyAccJerk.SD.X, tBodyAccJerk.SD.Y, tBodyAccJerk.SD.Z  
Type: Continuous  
Format: Numeric  
Description: Average of measurements by Subject and Activity of standard deviations of time domain signals derived from body linear acceleration and angular velocity in three dimensions (X, Y, Z) as measured by the smartphone accelerometer

* Variable Names: tBodyGyro.Mean.X, tBodyGyro.Mean.Y, tBodyGyro.Mean.Z  
Type: Continuous  
Format: Numeric  
Description: Average of measurements by Subject and Activity of means of time domain signals for gyroscope positioning in three dimensions (X, Y, Z) as measured by the smartphone gyroscope

* Variable Names: tBodyGyro.SD.X, tBodyGyro.SD.Y, tBodyGyro.SD.Z  
Type: Continuous  
Format: Numeric  
Description: Average of measurements by Subject and Activity of standard deviations of time domain signals for gyroscope positioning in three dimensions (X, Y, Z) as measured by the smartphone gyroscope

* Variable Names: tBodyGyroJerk.Mean.X, tBodyGyroJerk.Mean.Y, tBodyGyroJerk.Mean.Z  
Type: Continuous  
Format: Numeric  
Description: Average of measurements by Subject and Activity of means of time domain signals derived from gyroscope positioning of linear acceleration and angular velocity in three dimensions (X, Y, Z) as measured by the smartphone gyroscope

* Variable Names: tBodyGyroJerk.SD.X, tBodyGyroJerk.SD.Y, tBodyGyroJerk.SD.Z  
Type: Continuous  
Format: Numeric  
Description: Average of measurements by Subject and Activity of standard deviations of time domain signals derived from gyroscope positioning of linear acceleration and angular velocity in three dimensions (X, Y, Z) as measured by the smartphone gyroscope

* Variable Names: tBodyAccMag.Mean  
Type: Continuous  
Format: Numeric  
Description: Average of measurements by Subject and Activity of means of the magnatude of three dimension time domain signals for body acceleration as measured by the smartphone accelerometer

* Variable Names: tBodyAccMag.SD  
Type: Continuous  
Format: Numeric  
Description: Average of measurements by Subject and Activity of standard deviations of the magnatude of three dimension time domain signals for body acceleration as measured by the smartphone accelerometer

* Variable Names: tGravityAccMag.Mean  
Type: Continuous  
Format: Numeric  
Description: Average of measurements by Subject and Activity of means of the magnatude of three dimension time domain signals for gravity acceleration as measured by the smartphone accelerometer

* Variable Names: tGravityAccMag.SD  
Type: Continuous  
Format: Numeric  
Description: Average of measurements by Subject and Activity of standard deviations of the magnatude of three dimension time domain signals for gravity acceleration as measured by the smartphone accelerometer

* Variable Names: tBodyAccJerkMag.Mean  
Type: Continuous  
Format: Numeric  
Description: Average of measurements by Subject and Activity of means of the magnatude of three dimension time domain signals derived from body linear acceleration and angular velocity as measured by the smartphone accelerometer

* Variable Names: tBodyAccJerkMag.SD  
Type: Continuous  
Format: Numeric  
Description: Average of measurements by Subject and Activity of standard deviations of the magnatude of three dimension time domain signals derived from body linear acceleration and angular velocity as measured by the smartphone accelerometer

* Variable Names: tBodyGyroMag.Mean  
Type: Continuous  
Format: Numeric  
Description: Average of measurements by Subject and Activity of means of the magnatude of three dimension time domain signals from gyroscope positioning as measured by the smartphone gyroscope

* Variable Names: tBodyGyroMag.SD  
Type: Continuous  
Format: Numeric  
Description: Average of measurements by Subject and Activity of standard deviations of the magnatude of three dimension time domain signals derived from from gyroscope positioning as measured by the smartphone gyroscope

* Variable Names: tBodyGyroJerkMag.Mean  
Type: Continuous  
Format: Numeric  
Description: Average of measurements by Subject and Activity of means of the magnatude of three dimension time domain signals derived from gyroscope positioning of linear acceleration and angular velocity as measured by the smartphone gyroscope

* Variable Names: tBodyGyroJerkMag.SD  
Type: Continuous  
Format: Numeric  
Description: Average of measurements by Subject and Activity of standard deviations of the magnatude of three dimension time domain signals derived from gyroscope positioning of linear acceleration and angular velocity as measured by the smartphone gyroscope

* Variable Names: fBodyAcc.Mean.X, fBodyAcc.Mean.Y, fBodyAcc.Mean.Z  
Type: Continuous  
Format: Numeric  
Description: Average of measurements by Subject and Activity of means of frequency domain signals for body acceleration in three dimensions (X, Y, Z) as measured by the smartphone accelerometer

* Variable Names: fBodyAcc.SD.X, fBodyAcc.SD.Y, fBodyAcc.SD.Z  
Type: Continuous  
Format: Numeric  
Description: Average of measurements by Subject and Activity of standard deviations of frequency domain signals for body acceleration in three dimensions (X, Y, Z) as measured by the smartphone accelerometer

* Variable Names: fBodyAccJerk.Mean.X, fBodyAccJerk.Mean.Y, fBodyAccJerk.Mean.Z  
Type: Continuous  
Format: Numeric  
Description: Average of measurements by Subject and Activity of means of frequency domain signals derived from body linear acceleration and angular velocity in three dimensions (X, Y, Z) as measured by the smartphone accelerometer

* Variable Names: fBodyAccJerk.SD.X, fBodyAccJerk.SD.Y, fBodyAccJerk.SD.Z  
Type: Continuous  
Format: Numeric  
Description: Average of measurements by Subject and Activity of standard deviations of time domain signals derived from body linear acceleration and angular velocity in three dimensions (X, Y, Z) as measured by the smartphone accelerometer

* Variable Names: fBodyGyro.Mean.X, fBodyGyro.Mean.Y, fBodyGyro.Mean.Z  
Type: Continuous  
Format: Numeric  
Description: Average of measurements by Subject and Activity of means of frequency domain signals for gyroscope positioning in three dimensions (X, Y, Z) as measured by the smartphone gyroscope

* Variable Names: fBodyGyro.SD.X, fBodyGyro.SD.Y, fBodyGyro.SD.Z  
Type: Continuous  
Format: Numeric  
Description: Average of measurements by Subject and Activity of standard deviations of frequency domain signals for gyroscope positioning in three dimensions (X, Y, Z) as measured by the smartphone gyroscope

* Variable Names: fBodyAccMag.Mean  
Type: Continuous  
Format: Numeric  
Description: Average of measurements by Subject and Activity of means of the magnatude of three dimension frequency domain signals for body acceleration as measured by the smartphone accelerometer

* Variable Names: fBodyAccMag.SD  
Type: Continuous  
Format: Numeric  
Description: Average of measurements by Subject and Activity of standard deviations of the magnatude of three dimension frequency domain signals for body acceleration as measured by the smartphone accelerometer

* Variable Names: fBodyBodyAccJerkMag.Mean  
Type: Continuous  
Format: Numeric  
Description: Average of measurements by Subject and Activity of means of the magnatude of three dimension frequency domain signals derived from body linear acceleration and angular velocity as measured by the smartphone accelerometer

* Variable Names: fBodyBodyAccJerkMag.SD  
Type: Continuous  
Format: Numeric  
Description: Average of measurements by Subject and Activity of standard deviations of the magnatude of three dimension frequency domain signals derived from body linear acceleration and angular velocity as measured by the smartphone accelerometer

* Variable Names: fBodyBodyGyroMag.Mean  
Type: Continuous  
Format: Numeric  
Description: Average of measurements by Subject and Activity of means of the magnatude of three dimension frequency domain signals from gyroscope positioning as measured by the smartphone gyroscope

* Variable Names: fBodyBodyGyroMag.SD  
Type: Continuous  
Format: Numeric  
Description: Average of measurements by Subject and Activity of standard deviations of the magnatude of three dimension frequency domain signals derived from from gyroscope positioning as measured by the smartphone gyroscope

* Variable Names: fBodyBodyGyroJerkMag.Mean  
Type: Continuous  
Format: Numeric  
Description: Average of measurements by Subject and Activity of means of the magnatude of three dimension frequency domain signals derived from gyroscope positioning of linear acceleration and angular velocity as measured by the smartphone gyroscope

* Variable Names: fBodyBodyGyroJerkMag.SD  
Type: Continuous  
Format: Numeric  
Description: Average of measurements by Subject and Activity of standard deviations of the magnatude of three dimension frequency domain signals derived from gyroscope positioning of linear acceleration and angular velocity as measured by the smartphone gyroscope
