## plot1.R
## version:	1.0
## author:	jin.jiangli@mayo.edu



library("dplyr")

## Load data only used from the dates 2007-02-01 and 2007-02-02
if (file.exists("household_power_consumption.txt")){
  my_hpc_names <- read.table("household_power_consumption.txt", sep =";", na.strings = "?", header = TRUE, nrows = 1)
  my_hpc <- read.table("household_power_consumption.txt", sep =";", na.strings = "?", skip = 66636, header = FALSE,nrows = 2885,stringsAsFactors = FALSE)
} else stop("File household_power_consumption.txt not found!")	

names(my_hpc) <- names(my_hpc_names)
#my_hpc$Date <- as.Date(my_hpc$Date,"DD/MM/YYYY")
my_hpc <- filter(my_hpc, Date == "1/2/2007" | Date == "2/2/2007")
#my_hpc <- filter(my_hpc, my_hpc$Date == as.Date("1/2/2007","DD/MM/YYYY"))