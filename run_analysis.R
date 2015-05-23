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
