# Reading, naming and subsetting power consumption data
data <- read.table("household_power_consumption.txt", header = TRUE,sep=";", stringsAsFactors = FALSE, dec = ".", na.strings = "?")

rangeDates <-c("1/2/2007", "2/2/2007")
dates <- as.Date(rangeDates, "%m/%d/%y")
dataToPlot <- data[data$Date %in% rangeDates,]

# Transform to date
datetime <- strptime(paste(dataToPlot$Date, dataToPlot$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
subMetering1 <- as.numeric(dataToPlot$Sub_metering_1)
subMetering2 <- as.numeric(dataToPlot$Sub_metering_2)
subMetering3 <- as.numeric(dataToPlot$Sub_metering_3)


# calling the basic plot functions
plot(datetime,subMetering1,type="n",xlab="",ylab="Energy sub metering")
lines(datetime, subMetering2, col="red")
lines(datetime, subMetering3, col="blue")
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# annotating graph
title(main="Energy sub-metering")

#save file and close plot
dev.print(png, file = "plot3.png", width = 480, height = 480)

dev.off()

