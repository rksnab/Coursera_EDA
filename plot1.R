## Exploratory Data Analysis - Course project 1
# Plot 1

# This code assumes the dataset is in the following working directory
# if you run this code on your machine, please adjust below
setwd("C:/Users/Rick/Documents/Coursera")

# Read data
 data <- read.table("household_power_consumption.txt", sep=";", header = TRUE,
                   stringsAsFactors = FALSE, dec=".", na.strings = "?")

# Subsetting data
datasubset <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]
                   
# Plot and save the data subset
png("plot1.png", width=480, height=480)
hist(datasubset$Global_active_power, col = "Red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "frequency")

dev.off()
