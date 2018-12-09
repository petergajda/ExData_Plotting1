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


### PLOT 2

png(filename="plot2.png", width = 480, height = 480, units = "px")

plot(powerdata$Datetime, powerdata$Global_active_power,
     type = "l",
     ylab = "Global Active Power (kilowatts)",
     xlab = "")

dev.off()