## plot2.R
## version:	1.0
## author:	jin.jiangli@mayo.edu

## This script load data from file "household_power_consumption.txt" which date between 1/2/2007 and 2/2/2007,
## make a plot of the variable "Time" and "Glabal_active_power",and save to file "plot2.png"

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

png(filename = "plot2.png")
with(my_hpc, plot(Time, Global_active_power, type ="l", xlab ="", ylab = "Global Active Power(kilowatts)"))
dev.off()