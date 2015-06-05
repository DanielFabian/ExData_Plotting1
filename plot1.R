source("download.R")

library(data.table)


dataset <- fread(unzippedFileName, colClasses = "character", na.strings = "?")

dataset <- dataset[, Date := as.IDate(Date, "%d/%m/%Y")]
dataset <- dataset[Date >= "2007-02-01" & Date <= "2007-02-02", ]
dataset <- dataset[, Time := as.ITime(Time, "%H:%M:%S")]
dataset <- dataset[, Global_active_power := as.numeric(Global_active_power)]
dataset <- dataset[, Global_reactive_power := as.numeric(Global_reactive_power)]
dataset <- dataset[, Global_intensity := as.numeric(Global_intensity)]
dataset <- dataset[, Voltage := as.numeric(Voltage)]
dataset <- dataset[, Sub_metering_1 := as.numeric(Sub_metering_1)]
dataset <- dataset[, Sub_metering_2 := as.numeric(Sub_metering_2)]
dataset <- dataset[, Sub_metering_3 := as.numeric(Sub_metering_3)]


hist(dataset[, Global_active_power], col = "red", main = "Global Active Power", xlab = "Global Active Power")
guiDev <- dev.cur()

png("plot1.png", width = 480, height = 480)
pngDev <- dev.cur()

dev.set(guiDev)
dev.copy(which = pngDev)
dev.off(which = pngDev)