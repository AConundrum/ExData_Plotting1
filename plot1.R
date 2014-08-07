##
##   Description: Create plot1 for Project 1 of R-class
##
##   AUTHOR    : Edward J Hopkins
##   $DATE     : Mon Aug 04 19:25:48 2014     ## date()
##   $Revision : 1.00 $
##   DEVELOPED : Rstudio, Version 0.98.507    ## packageVersion("rstudio")
##             : R version 3.1.0 (2014-04-10) ## R.Version.string
##   Copyright : Copyright (c) 2014 E. J. Hopkins
##   FILENAME  : plot1.R

## Dependencies: data.table (for fread)
## See also:

###############################################################################     
## BEGIN CODE
library(data.table)
# Assume data file is in working directory
fname="household_power_consumption.txt"             # var for filename
data <- suppressWarnings(fread(fname,
           select=c("Date","Global_active_power"))) # Read relevant data
data$Date <- as.Date(data$Date, "%d/%m/%Y")         # Fix data formats

# Select dates of 1Feb2007 to 2Feb2007
data3 <- data[Date>="2007/02/01" & Date<="2007/02/02"]
data3$Global_active_power <- as.numeric(data3$Global_active_power)
rm(data)                                   # Remove unneeded data from memory

# Plot histogram, color, and label
defpar <- par()                              # Save default parameter values
par(cex.lab=0.8)                             # Reduce font size of x,y labels
par(cex.axis=0.8)                            # Reduce font size of tick labels
hist(data3$Global_active_power,              # histogram call
     col="red",                              # make red columns
     main="Global Active Power",             # y-axis label text
     xlab="Global Active Power (kilowatts)") # x-axis label text
dev.copy(device=png,file="plot1.png",
         width=480,height=480,units="px")    # Export to png 480x480px
dev.off()
par(defpar) # Restore default parameter values

## END CODE
###############################################################################     
# Memory calculations
#MAXmem <- memory.limit()
#CURmem <- memory.size()
#AVLmem <- MAXmem-CURmem
#Nrows <- 2075259
#Ncols <- 9
#Nbyte <- 8
#paste("File Size:",round(zipFileInfo$Length/1E6),"Mb")
#paste("Available Memory:",round(AVLmem),"Mb")
#paste("Estimated file Mem:",round((Nrows*Ncols*Nbyte)/1E6),"Mb")
#system.time(data <- read.csv(zipFileInfo$Name,sep=";"))
#FILE <- list.files(pattern='*.zip')
#zipFileInfo <- unzip(FILE, list=TRUE)
#system.time(DF4 <- read.csv.sql(
#     fname, sep=";",sql = 'select * from file where Date = "2/2/2007"'))
#library(ggplot2)
#ggplot(data3,aes(x=Global_active_power)) + 
#     geom_histogram(fill="red", binwidth=0.5) +
#     xlab("Global Active Power (kilowatts)") +
#     ylab("Frequency")
#png("plotA.png",width=480,height=480,units="px") # Create file device

## MODIFICATIONS:
## date()
## Description...

## If this code does not work, then I don't know who wrote it.