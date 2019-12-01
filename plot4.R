## plot4.R
## version:	1.0
## author:	jin.jiangli@mayo.edu

## This script load data from file "household_power_consumption.txt" which date between 1/2/2007 and 2/2/2007,
## make a plot of the variable "Time" and "Sub_metering_1", "Sub_metering_2", "Sub_metering_3", and save to file "plot4.png"

library("dplyr")

## Load data only used from the dates 2007-02-01 and 2007-02-02
if (file.exists("household_power_consumption.txt")){
  my_hpc_names <- read.table("household_power_consumption.txt", sep =";", na.strings = "?", header = TRUE, nrows = 1)
  my_hpc <- read.table("household_power_consumption.txt", sep =";", na.strings = "?", skip = 66636, header = FALSE,nrows = 2885,stringsAsFactors = FALSE)
  names(my_hpc) <- names(my_hpc_names)
  my_hpc <- filter(my_hpc, Date == "1/2/2007" | Date == "2/2/2007")
} else stop("File household_power_consumption.txt not found!")	

my_time <- paste(my_hpc$Date, my_hpc$Time)
my_hpc$Time <- strptime(my_time, "%d/%m/%Y %H:%M:%S")
my_hpc <- rename(my_hpc, datetime = Time)


png(filename = "plot4.png")
par(mfrow = c(2, 2))

## plot 1
with(my_hpc, plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power"))

## plot 2
with(my_hpc, plot(datetime, Voltage, type ="l"))

## plot 3
with(my_hpc, plot(datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(my_hpc, lines(datetime, Sub_metering_2, type = "l", col = "red"))
with(my_hpc, lines(datetime, Sub_metering_3, type = "l", col = "blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1, 1, 1), col = c("black", "red", "blue"))

## plot 4
with(my_hpc, plot(datetime, Global_reactive_power, type = "l"))

dev.off()

#dev.off()