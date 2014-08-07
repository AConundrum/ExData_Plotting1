##
##   Description: Create plot2 for Project 1 of R-class
##
##   AUTHOR    : Edward J Hopkins
##   $DATE     : Tue Aug 05 22:22:57 2014     ## date()
##   $Revision : 1.00 $
##   DEVELOPED : Rstudio, Version 0.98.507    ## packageVersion("rstudio")
##             : R version 3.1.0 (2014-04-10) ## R.Version.string
##   Copyright : Copyright (c) 2014 E. J. Hopkins
##   FILENAME  : plot2.R

## Dependencies: data.table (for fread)
## See also:

###############################################################################     
## BEGIN CODE
library(data.table)
# Assume data file is in working directory
fname="household_power_consumption.txt"                    # var for filename
data <- suppressWarnings(fread(fname,
           select=c("Date","Time","Global_active_power"))) # Read relevant data
data$Date <- as.Date(data$Date, "%d/%m/%Y")                # Fix data format

# Select dates of 1Feb2007 to 2Feb2007
data3 <- data[Date>="2007/02/01" & Date<="2007/02/02"]
data3$Global_active_power <- as.numeric(data3$Global_active_power)
data3$DateTime <- as.POSIXct(paste(data3$Date,data3$Time))
rm(data)                              # Remove unneeded data from memory

# Plot, color, and label
defpar <- par()                              # Save default parameter values
par(cex.lab=0.8)                             # Reduce font size of x,y labels
par(cex.axis=0.8)                            # Reduce font size of tick labels
plot(data3$DateTime,data3$Global_active_power,
     type='l', xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(device=png,file="plot2.png",
         width=480,height=480,units="px")    # Export to png 480x480px
dev.off()                                    # Close file device
par(defpar)                                  # Restore default parameter values

## END CODE
###############################################################################     
#header <- fread(fname,nrows=1)       # What are the header names,data formats?

## MODIFICATIONS:
## date()
## Description...

## If this code does not work, then I don't know who wrote it.