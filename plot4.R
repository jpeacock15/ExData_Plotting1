#plot4.R

#read and clean up data
powerdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
powerdata$DateTime <- strptime(paste(powerdata$Date, powerdata$Time), format="%d/%m/%Y %H:%M:%S")
powerdata$Date <- as.Date(powerdata$Date, "%d/%m/%Y")
data <- subset(powerdata, Date == "2007-02-01"| Date == "2007-02-02")

#initialize graphics device
png(file = "plot4.png")

#change parameters to allow for a 2x2 plot area
par(mfrow = c(2,2))

#upper left
plot(data$DateTime, data$Global_active_power, type = "l", main = NULL, xlab = "", ylab = "Global Active Power")

#upper right
plot(data$DateTime, data$Voltage, type = "l", col = "black", main = NULL, xlab = "datetime", ylab = "Voltage")

#lower left
plot(data$DateTime, data$Sub_metering_1, type = "l", col = "black", main = NULL, xlab = "", ylab = "Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, type = "l", col = "red")
lines(data$DateTime, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", col = c("black", "red", "blue"), lty = 1, bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#lower right
plot(data$DateTime, data$Global_reactive_power, type = "l", col = "black", main = NULL, xlab = "datetime", ylab = "Global_reactive_power")

dev.off()