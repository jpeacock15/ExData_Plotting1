#plot3.R

#read and clean up data
powerdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
powerdata$DateTime <- strptime(paste(powerdata$Date, powerdata$Time), format="%d/%m/%Y %H:%M:%S")
powerdata$Date <- as.Date(powerdata$Date, "%d/%m/%Y")
data <- subset(powerdata, Date == "2007-02-01"| Date == "2007-02-02")

#initialize graphics device
png(file = "plot3.png")

#create initial plot
plot(data$DateTime, data$Sub_metering_1, type = "l", col = "black", main = NULL, xlab = "", ylab = "Energy sub metering")
#add other data
lines(data$DateTime, data$Sub_metering_2, type = "l", col = "red")
lines(data$DateTime, data$Sub_metering_3, type = "l", col = "blue")
#add legend
legend("topright", col = c("black", "red", "blue"), lty = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()