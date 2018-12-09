# Assignment 1 / Course: Exploratory Data Analysis

setwd("C:/Desktop")
library(lubridate)


# Getting the data
powerdata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

# Date as type "date"
powerdata$Date <- as.Date(powerdata$Date, "%d/%m/%Y")

# subset Date between 2007-02-01 and 2007-02-02
powerdata <- subset(powerdata, powerdata$Date >= as.Date("2007-02-01"))
powerdata <- subset(powerdata, powerdata$Date <= as.Date("2007-02-02"))

# Combine Date and Time into one column
powerdata$Datetime <- as.POSIXct(paste(powerdata$Date, powerdata$Time), format="%Y-%m-%d %H:%M:%S")

# Reorder columns and drop Date and Time
powerdata <- powerdata[,c(10,3:9)]


### PLOT 3

png(filename="plot3.png", width = 480, height = 480, units = "px")

plot(powerdata$Datetime, powerdata$Sub_metering_1,
     type = "l",
     ylab = "Energy sub metering",
     xlab = "")
legend("topright", legend=c("Sub_metering 1", "Sub_metering 2", "Sub_metering 3"), col=c("black","red", "blue"), lty=1)
lines(powerdata$Datetime, powerdata$Sub_metering_2, col="red")
lines(powerdata$Datetime, powerdata$Sub_metering_3, col="blue")

dev.off()