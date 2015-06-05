fileName <- "exdata-data-household_power_consumption.zip"
if(!file.exists(fileName)){
  url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(url, destfile = fileName)
}

unzippedFileName <- "household_power_consumption.txt"

if(!file.exists(unzippedFileName)){
  unzip(fileName)
}

library(data.table)

loadDataset <- function() {
  dataset <- fread(unzippedFileName, colClasses = "character", na.strings = "?")
  
  dataset <- dataset[, Date := as.IDate(Date, "%d/%m/%Y")]
  dataset <- dataset[Date >= "2007-02-01" & Date <= "2007-02-02", ]
  dataset <- dataset[, Time := as.ITime(Time, "%H:%M:%S")]
  dataset <- dataset[, DateTime := as.POSIXct(paste(Date, Time))]
  dataset <- dataset[, Global_active_power := as.numeric(Global_active_power)]
  dataset <- dataset[, Global_reactive_power := as.numeric(Global_reactive_power)]
  dataset <- dataset[, Global_intensity := as.numeric(Global_intensity)]
  dataset <- dataset[, Voltage := as.numeric(Voltage)]
  dataset <- dataset[, Sub_metering_1 := as.numeric(Sub_metering_1)]
  dataset <- dataset[, Sub_metering_2 := as.numeric(Sub_metering_2)]
  dataset <- dataset[, Sub_metering_3 := as.numeric(Sub_metering_3)]
  dataset
}

exportToPng <- function(fileName) {
  guiDev <- dev.cur()
  
  png(fileName, width = 480, height = 480)
  pngDev <- dev.cur()
  
  dev.set(guiDev)
  dev.copy(which = pngDev)
  dev.off(which = pngDev)
}