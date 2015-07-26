## Original Data

The data comes from the "Human Activity Recognition Using Smartphones" project at UCI.

The 561 features in the original data come from the accelerometer and gyroscope 3-axial raw signals for acceleration and rotation sampled at 50 Hz and averaged on time windows such that each contains 128 measurements. The data was then filtered and processed to obtain several features, such as 3-axial acceleration, rotation, jerk, gyro-jerk, etc., for each observation of a subject performing an activity, all of which were subsequently labeled manually. Please refer to the raw data documentation (features_info.txt) for more details.

## Transformed Data

The tidy data produced in this Course Project (```output.txt```) contains the average of the Mean and Standard Deviation features in the original data set for each Subject performing each Activity.

## Transformation Steps

The raw data comes split accross various files. First, the data is split into two groups: Training and Test sets. Each set is comprised of three files, namely, "X" files with the observations, "y" files with the labels (numbers corresponding to activities the subject was performing during the observations) and "subject" files with the subject ids.

Two additional files, features.txt and activity_labels.txt, contain the variable names and activity labels respectivelly.

The analysis script performs the following steps:

* Downloads and unzips the raw data.
* Merges Training and Test set files sets into one.
* Merges Subject and Activity columns to the observation data.
* Replaces Activy codes with descriptive activity factors.
* Names the obsersed variables with descriptive variable names.
* Extracts only the columns with the MEANS and STANDARD DEVIATIONS.

**Note:** The project instructions did not provide further detail about which columns should be extracted beyong "mean and standard deviation", so I have extracted every columns containing the strings "mean" or "std" in them.

## Variables

The variables in the tidy data set ```output.txt``` are the **mean values** for all the records in the aggregate Training and Test data sets **grouped by _Subject_ and _Activity_**. Note that the orignal data has contains average sensor readings at 2.56 seconds (128 sensor readings at 50 Hz), which samples the activity data over period of several seconds. The tidy data contains one single global average per Subject per Activity (the usefulness of which is beyond this studend's grasp), so the variable names are still indicative of their content, **provided it is understood the original data contains averages over a certain time window and the tidy data contains averages of those averages**.


