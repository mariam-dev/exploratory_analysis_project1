#########################################################################
## Plot 1 shows a histogram plot of Global Active Power v. Frequency
## Color should be red
## Title: "Global Active Power"
# Our overall goal here is simply to examine how household energy usage varies over a 2-day period in February, 2007. 
# Your task is to reconstruct the following plots below, all of which were constructed using the base plotting system.
# We will only be using data from the dates 2007-02-01 and 2007-02-02. One alternative is to read the data from just those 
# dates rather than reading in the entire dataset and subsetting to those dates.
#########################################################################

# 1. Read the data into a table
myDataPath <- "./household_power_consumption.txt"
data<- read.table(myDataPath, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

# 2. Get the subset 2007-02-01 and 2007-02-02
rangeDates <-c("02/01/2007", "02/02/2007")
dates <- as.Date(rangeDates, , "%m/%d/%y")
dataToPlot <- data[as.Date(data$Date,"%m/%d/%y")%in% dates, ]

# 3. Draw the plot
columnPlot1 <- as.numeric(dataToPlot$Global_active_power)
#Make histogram object but don't draw it
#yhist <- hist(columnPlot1, plot=FALSE)
#highCount <- max(yhist$counts)

hist(columnPlot1, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab= "Frequency", ylim= c(0, 5000))
dev.print(png, file = "plot1.png", width = 480, height = 480)
dev.off()
