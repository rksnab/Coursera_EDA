## Exploratory Data Analysis - Course project 1
# Plot 4

# This code assumes the dataset is in the following working directory
# if you run this code on your machine, please adjust below
setwd("C:/Users/Rick/Documents/Coursera")

# Read data
data <- read.table("household_power_consumption.txt", sep=";", header = TRUE,
                   stringsAsFactors = FALSE, dec=".", na.strings = "?")

# Subsetting data
datasubset <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

# Convert the dates
propertime <- strptime(paste(datasubset$Date, datasubset$Time, sep=" "), 
                       "%d/%m/%Y %H:%M:%S")

# Define variables
Sub1 = datasubset$Sub_metering_1
Sub2 = datasubset$Sub_metering_2
Sub3 = datasubset$Sub_metering_3


# Plot and save the data subset
png("plot4.png", width=480, height=480)
par(mfcol = c(2, 2), mar=c(4,4,2,2)) 

# 1st graph
plot(propertime, datasubset$Global_active_power, type="l", 
     xlab="", ylab="Global Active Power")

# 2nd graph
plot(propertime, Sub1, type="l", ylab="Energy Submetering", xlab="")
lines(propertime, Sub2, type="l", col = "Red")
lines(propertime, Sub3, type="l", col = "Blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, lwd=2, col=c("black", "red", "blue"))

# 3rd graph
plot(propertime, datasubset$Voltage, type="l", 
     xlab="datetime", ylab="Voltage")

# 4th graph
plot(propertime, datasubset$Global_reactive_power, type="l", 
     xlab="datetime", ylab="Global_reactive_power")


dev.off()