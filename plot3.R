source("download.R")

dataset <- loadDataset()

plot(x = dataset[, DateTime],
     y = dataset[, Sub_metering_1],
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")

lines(x = dataset[, DateTime],
      y = dataset[, Sub_metering_2],
      col = "red")

lines(x = dataset[, DateTime],
      y = dataset[, Sub_metering_3],
      col = "blue")

legend("topright",
       legend = names(dataset)[7:9],
       col = c("black", "red", "blue"),
       lty = "solid")

exportToPng("plot3.png")