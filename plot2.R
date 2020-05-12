# Reading, naming and subsetting power consumption data
data <- read.table("household_power_consumption.txt", header = TRUE,sep=";", stringsAsFactors = FALSE, dec = ".", na.strings = "?")

rangeDates <-c("1/2/2007", "2/2/2007")
dates <- as.Date(rangeDates, "%m/%d/%y")
dataToPlot <- data[data$Date %in% rangeDates,]

# Transform to date
datetime <- strptime(paste(dataToPlot$Date, dataToPlot$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(dataToPlot$Global_active_power)


# calling the basic plot functions
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)", cex=0.2)

# annotating graph
title(main="Plot2")

#save file and close plot
dev.print(png, file = "plot2.png", width = 480, height = 480)
dev.off()
