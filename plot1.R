source("download.R")

dataset <- loadDataset()

hist(dataset[, Global_active_power],
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power")

exportToPng("plot1.png")