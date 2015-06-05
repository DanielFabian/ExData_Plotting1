source("download.R")

dataset <- loadDataset()

old.par <- par(mfrow=c(2, 2))
plot(x = dataset[, DateTime],
     y = dataset[, Global_active_power],
     type = "l",
     xlab = "",
     ylab = "Global Active Power")

plot(x = dataset[, DateTime],
     y = dataset[, Voltage],
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")

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

plot(x = dataset[, DateTime],
     y = dataset[, Global_reactive_power],
     type = "l",
     xlab = "datetime",
     ylab = "Global_reactive_power")

exportToPng("plot4.png")