# Load libraries.
library("plyr")

if( ! file.exists("rawdata.zip") )
{
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileUrl, destfile = "rawdata.zip", method = "curl")
}

if( ! file.exists("UCI HAR Dataset"))
{
    unzip("rawdata.zip")
}



# For testing...
rows <- 1000000;

# Load training data.
X_train <- read.table("UCI HAR Dataset/train/X_train.txt", nrows=rows)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", nrows=rows)
s_train <- read.table("UCI HAR Dataset/train/subject_train.txt", nrows=rows)

# Load test data.
X_test <- read.table("UCI HAR Dataset/test/X_test.txt", nrows=rows)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", nrows=rows)
s_test <- read.table("UCI HAR Dataset/test/subject_test.txt", nrows=rows);

# Load feature names and activity labels.
features <- read.table("UCI HAR Dataset/features.txt")
labels <- read.table("UCI HAR Dataset/activity_labels.txt")

# Bind Test and Trainning data.
X <- rbind(X_test, X_train)
y <- rbind(y_test, y_train)
s <- rbind(s_test, s_train)

# Assign column names.
colnames(X) <- t(features[2])
colnames(y) <- c("Activity")
colnames(s) <- c("Subject")

# Replace factors with activity labels.
y$Activity <- factor(y$Activity, levels=labels$V1, labels=labels$V2)

# Extract mean and stddev columns.
X_sub <- X[grepl("mean|std", names(X), ignore.case=TRUE)]

# Bind the Subject Number and Activity Labels to the left of the measurements.
X_tidy <- cbind(s, y, X_sub)

# Compute means grouping by Subject and Activity.
DATA <- ddply(X_tidy[,-(1:2)], .(X_tidy$Subject, X_tidy$Activity), colMeans)

# Rename columns.
colnames(DATA)[1:2] <- c("Subject", "Activity")

# Generate output file.
write.table(DATA, "output.txt", row.names=FALSE)





