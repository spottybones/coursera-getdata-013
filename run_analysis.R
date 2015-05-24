# Set constants
dataURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
localDataFile <- "./data/HAR Dataset.zip"

# if not already existent, create directory to hold data files; download the zip file
# and unzip the files
if(!file.exists("data")) {
  dir.create("data")
}

if(!file.exists(localDataFile)) {
  download.file(dataURL, destfile=localDataFile, method="curl")
  unzip(localDataFile, overwrite=FALSE, junkpaths=TRUE, exdir="./data")
}

## Define functions for reading and combining data files and reporting means

# combine_test_training - takes a file name part (the name excluding _test or
# _training) of a target data type; reads the data from the test and training
# files; combines then, and returns a data.frame with the combined data.
combine_test_training <- function(m_type) {
  # read the test and training data into data.frames and bind into one data frame
  test_data <- read.delim(paste0("./data/", m_type, "_test.txt"),
                          header=FALSE, sep="")
  train_data <- read.delim(paste0("./data/", m_type, "_train.txt"),
                           header=FALSE, sep="")
  rbind(test_data, train_data)
}

# get_mean_sd: takes a data.frame with raw data and a label prefix and returns a
# data.frame containing the mean and standard deviation for each row of
# measurements; provides descriptive names for the columns based on the label
# prefix passed
get_mean_sd <- function(data, label_prefix) {
  # calculate the mean and standard deviation of each row/measurement
  Means <- as.numeric(apply(data, c(1), mean))
  SDs <- as.numeric(apply(data, c(1), sd))

  # combine the mean and sd vectors into a data frame; provide meaningful names
  # for the columns, and return to the caller
  means_sds <- data.frame(cbind(Means, SDs))
  names(means_sds)[1] <- paste0(label_prefix, ".Mean")
  names(means_sds)[2] <- paste0(label_prefix, ".SD")
  return(means_sds)
}

## Generate the tidy data set

## Subject.IDs
# start building the master data set by adding and labeling the Subject.IDs
data <- combine_test_training("subject")
names(data)[1] <- "Subject.ID"


## Activity.Names - create and merge in column of Activity Names
# create a map of activity codes to labels
Activity_Labels <- read.table("./data/activity_labels.txt",
                              col.names=c("Activity.ID", "Activity.Name"),
                              stringsAsFactors=FALSE)

# read/combine and label the Activity Data
ActivityData <- combine_test_training("y")
names(ActivityData)[1] <- "Activity.ID"

# join the labels and the data to name all the data
ActivityData <- join(ActivityData, Activity_Labels)

# add a column for the Activity.Name
data <- cbind(data, ActivityData[,2], stringsAsFactors=FALSE)
names(data)[2] <- "Activity.Name"


## Features - clean up and merge in mean and standard deviation feature measurements
Features <- read.table("./data/features.txt",
                       col.names=c("Feature.ID", "Feature.Name"),
                       stringsAsFactors=FALSE)

# read feature measurements into a data table and label the columns
FeatureMeasurements <- combine_test_training("X")
names(FeatureMeasurements) <- Features$Feature.Name

# bind the measurements on the mean and standard deviation to the master data table - we
# pull the desired columns by grepping for "mean" or "std" in their names
data <- cbind(data, FeatureMeasurements[,grep("-(mean|std)\\(\\)", Features$Feature.Name)])

# clean up the column names to make them easier to parse: 1) convert all hyphens
# to periods, 2) remove parenthesis, 3) capitalize the mean/SD piece
names(data) <- gsub("-", ".", names(data))
names(data) <- gsub(".mean\\(\\)", ".Mean", names(data))
names(data) <- gsub(".std\\(\\)", ".SD", names(data))

## Generate a second tidy data set that contains the average measurement of each
## variable grouped by Subject and Activity
sumdata <- ddply(data, c("Subject.ID", "Activity.Name"),
                 function(x) { colMeans(x[grep("^(t|f)", names(data))]) })
