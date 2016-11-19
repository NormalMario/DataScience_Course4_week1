rm(list=ls())
# setwd('') # set your path
getwd()

mydata <- read.table(file = 'household_power_consumption.txt', 
                     header = TRUE, dec = '.', sep = ';', stringsAsFactors = FALSE)
mydata <- mutate(mydata, datetime = dmy_hms(paste(mydata$Date, mydata$Time)))
head(mydata)

# conversions
library(lubridate) # date management package with functions dmy and hms
mydata$Date <- dmy(mydata$Date)
mydata$Time <- hms(mydata$Time)
mydata$Global_active_power <- as.numeric(mydata$Global_active_power)
mydata$Global_reactive_power <- as.numeric(mydata$Global_reactive_power)
mydata$Voltage <- as.numeric(mydata$Voltage)
mydata$Global_intensity <- as.numeric(mydata$Global_intensity)
mydata$Sub_metering_1 <- as.numeric(mydata$Sub_metering_1)
mydata$Sub_metering_2 <- as.numeric(mydata$Sub_metering_2)
mydata$Sub_metering_3 <- as.numeric(mydata$Sub_metering_3)
head(mydata)

# filter data
library(dplyr)
mydata2 <- filter(mydata, Date == '2007-02-01' | Date == '2007-02-02')

# plot 2

png(filename = 'plot2.png', width = 480, height = 480)
with(mydata2, plot(x = datetime, y = Global_active_power, type = 'l',
                   ylab = 'Global Active Power (kilowatts)', xlab = ''))
dev.off()
