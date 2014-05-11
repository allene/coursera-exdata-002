## set working directory
#setwd("/media/ssdp1/Coursera/ExploratoryDataAnalysis-2014/data/")
#One off commands to get data
#download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","./data/exdata_data_household_power_consumption.zip","curl")
##unzip data
unzip("exdata_data_household_power_consumption.zip")
## install date libraries -- one off
#install.packages("lubridate")
##load library
library(lubridate)
##read data 
courseproj1 <- read.table("household_power_consumption.txt", 
                   header = TRUE, sep = ";", na.strings = "?",
                   colClasses = c("character","character","numeric","numeric",
                                  "numeric","numeric","numeric","numeric")
      )
## convert columns to date format      
courseproj1$Date <- as.Date(courseproj1$Date, format = "%d/%m/%Y")
## get subset of data to work with
# Pull out relevant date range
cp1subset <- courseproj1[ which( courseproj1$Date >= "2007-02-01" & courseproj1$Date <="2007-02-02"), ] 
## original raw data nolonger required.
rm(courseproj1)
##Explore
##summary(cp1subset)
## add new variable timestamp with cancat of date & time
cp1subset$TimeStamp <- strptime(paste(cp1subset$Date, cp1subset$Time), format="%Y-%m-%d %H:%M:%S" )
# open PNG graphics device for plot-2
#png will be like empty canvas
png(file="courseproject1-plot2.png", width = 480, height = 480, units = "px", bg="transparent")
# draw plot2 as per requirement
plot(cp1subset$TimeStamp , cp1subset$Global_active_power, type="n", col="black", xlab="", ylab = "Global Active Power (kilowatts)")
##Add lines
lines(cp1subset$TimeStamp , cp1subset$Global_active_power)
#close the device
dev.off()

