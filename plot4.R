##
##   Description: Create plot4 for Project 1 of R-class
##
##   AUTHOR    : Edward J Hopkins
##   $DATE     : Wed Aug 06 18:50:01 2014     ## date()
##   $Revision : 1.00 $
##   DEVELOPED : Rstudio, Version 0.98.507    ## packageVersion("rstudio")
##             : R version 3.1.0 (2014-04-10) ## R.Version.string
##   Copyright : Copyright (c) 2014 E. J. Hopkins
##   FILENAME  : plot4.R

## Dependencies: data.table (for fread)
## See also:

###############################################################################     
## BEGIN CODE
library(data.table)
# Assume data file is in working directory
fname="household_power_consumption.txt"                    # var for filename
data <- suppressWarnings(fread(fname,
           drop="Global_intensity"))                       # Read relevant data
data$Date <- as.Date(data$Date, "%d/%m/%Y")                # Fix data format

# Select dates of 1Feb2007 to 2Feb2007
data3 <- as.data.frame(data[Date>="2007/02/01" & Date<="2007/02/02"])
data3[,3:7] <- sapply(data3[,3:7],as.numeric)
data3$DateTime <- as.POSIXct(paste(data3$Date,data3$Time))
rm(data)                              # Remove unneeded data from memory

png("plot4.png",width=480,height=480,units="px") # Create file device

# Setup 2x2 layout
layout(matrix(1:4,2,2))

# Setup parameters
defpar <- par()                              # Save default parameter values
par(cex.lab=0.8)                             # Reduce font size of x,y labels
par(cex.axis=0.8)                            # Reduce font size of tick labels
par(mar=c(4,4,4,2))                          # Fix margins
COL=c("black","red","blue")                  # Colors for data/legend

### PLOT 1 ### (upper left)
plot(data3$DateTime,data3$Global_active_power,
     type='l', xlab="", ylab="Global Active Power")

### PLOT 2 #### (lower left)
plot(data3$DateTime,data3$Sub_metering_1,
     type='l', xlab="", ylab="Energy sub metering")
lines(data3$DateTime,data3$Sub_metering_2, type='l',col=COL[2])
lines(data3$DateTime,data3$Sub_metering_3, type='l',col=COL[3])
legend("topright",names(data3[,6:8]),col=COL,cex=0.8,lty=c(1,1,1))

### PLOT 3 ### (upper right)
plot(data3$DateTime,data3$Voltage,
     type='l',xlab="datetime",ylab="Voltage")

### PLOT 4 ### (lower right)
plot(data3$DateTime,data3$Global_reactive_power,
     type='l',xlab="datetime",ylab="Global_reactive_power")


dev.off()                                    # Close file device
par(defpar)                                  # Restore default parameter values

## END CODE
###############################################################################     
#header <- fread(fname,nrows=1)       # What are the header names,data formats?
#dev.copy(device=png,file="plotA.png",
#         width=480,height=480,units="px")    # Export to png 480x480px

## MODIFICATIONS:
## date()
## Description...

## If this code does not work, then I don't know who wrote it.