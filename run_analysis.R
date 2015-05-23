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

# get_mean_sd: a function that combines test and training data from the specified
# measurement type and returns a data table containing the mean and standard deviation
# of each measurement
get_mean_sd <- function(m_type) {
  test_data <- read.delim(paste0("./data/", m_type, "_test.txt"),
                          header=FALSE, sep="")
  train_data <- read.delim(paste0("./data/", m_type, "_train.txt"),
                           header=FALSE, sep="")
  all_data <- rbind(test_data, train_data)
  all_mean <- as.numeric(apply(all_data, c(1), mean))
  all_sd <- as.numeric(apply(all_data, c(1), sd))
  all_mean_sd <- data.frame(cbind(all_mean, all_sd))
  names(all_mean_sd)[1] <- paste0(m_type, ".Mean")
  names(all_mean_sd)[2] <- paste0(m_type, ".SD")
  return(all_mean_sd)
}
