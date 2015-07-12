## Exploratory Data Analysis - Course project 1
# Plot 3

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

# Define 3 meters
Sub1 = datasubset$Sub_metering_1
Sub2 = datasubset$Sub_metering_2
Sub3 = datasubset$Sub_metering_3

# Plot and save the data subset
png("plot3.png", width=480, height=480)
plot(propertime, Sub1, type="l", ylab="Energy sub metering", 
     xlab="")
lines(propertime, Sub2, type="l", col = "Red")
lines(propertime, Sub3, type="l", col = "Blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, lwd=2, col=c("black", "red", "blue"))

dev.off()