# Set constants
dataURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
localDataFile <- "./data/HAR Dataset.zip"

# if not already existent, create directory to hold data files and download them to it
if(!file.exists("data")) {
  dir.create("data")
}

if(!file.exists(localDataFile)) {
  download.file(dataURL, destfile=localDataFile, method="curl")
}

