## plot1.R
## version:	1.0
## author:	jin.jiangli@mayo.edu

## This script load data from file "household_power_consumption.txt" which date between 1/2/2007 and 2/2/2007,
## make a histogram of the variable "Glabal_active_power",and save to file "plot1.png"

library("dplyr")

## Load data only used from the dates 2007-02-01 and 2007-02-02
if (file.exists("household_power_consumption.txt")){
  my_hpc_names <- read.table("household_power_consumption.txt", sep =";", na.strings = "?", header = TRUE, nrows = 1)
  my_hpc <- read.table("household_power_consumption.txt", sep =";", na.strings = "?", skip = 66636, header = FALSE,nrows = 2885,stringsAsFactors = FALSE)
  names(my_hpc) <- names(my_hpc_names)
  my_hpc <- filter(my_hpc, Date == "1/2/2007" | Date == "2/2/2007")
} else stop("File household_power_consumption.txt not found!")	

png(filename = "plot1.png")
with(my_hpc, hist(Global_active_power, xlab = "Global Active Power(kilowatts)", main = "Global Active Power", col = "red"))
dev.off()