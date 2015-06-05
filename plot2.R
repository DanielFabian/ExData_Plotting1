source("download.R")

dataset <- loadDataset()

plot(x = dataset[, DateTime],
     y = dataset[, Global_active_power],
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")


exportToPng("plot2.png")