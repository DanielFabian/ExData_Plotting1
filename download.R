fileName <- "exdata-data-household_power_consumption.zip"
if(!file.exists(fileName)){
  url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(url, destfile = fileName)
}

unzippedFileName <- "household_power_consumption.txt"

if(!file.exists(unzippedFileName)){
  unzip(fileName)
}