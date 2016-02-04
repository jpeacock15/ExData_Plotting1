#plot1.R

#read and clean up data
powerdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
powerdata$DateTime <- strptime(paste(powerdata$Date, powerdata$Time), format="%d/%m/%Y %H:%M:%S")
powerdata$Date <- as.Date(powerdata$Date, "%d/%m/%Y")
data <- subset(powerdata, Date == "2007-02-01"| Date == "2007-02-02")

#initialize graphics device
png(file = "plot1.png")

#create histogram
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off()
