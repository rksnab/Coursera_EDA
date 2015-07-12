## Exploratory Data Analysis - Course project 1
# Plot 2

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

# Plot and save the data subset
png("plot2.png", width=480, height=480)
plot(propertime, datasubset$Global_active_power, type="l", 
     xlab="", ylab="Global Active Power (kilowatts)")
dev.off()