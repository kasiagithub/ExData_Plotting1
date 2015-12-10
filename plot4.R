##*************************************************************
## COURSERA
## EXPLORATORY DATA ANALYSIS 
## Course Project 1: Electric power consumption
##
## AUTHOR: Katarzyna Pienczk
##
## PLOT 4: Panel plot (2x2 matrix)
##
## INSTRUCTION: Before running the script, 
##              place the "household_power_consumption.txt" file
##              in the working directory.
##              Then type source("plot4.R") to run the script           
##
## RESULT: The script generates a panel of 4 plots
##         for the 2-days time period <01/02/2007, 02/02/2007>
##         and saves the plot to the "plot4.png" file
##         within the working directory
##           
##*************************************************************

## read, format and subset the data

myData <- read.table("household_power_consumption.txt", header=TRUE,  sep=";", quote="", dec = ".", numerals = "no.loss", stringsAsFactors=FALSE, na.strings = "?")
myData$Date2 <- as.Date(myData$Date, "%d/%m/%Y")
myData$Time2 <- strptime(paste(myData$Date, myData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
february2007Data <- myData[myData$Date2 %in% c(as.Date("01/02/2007","%d/%m/%Y"), as.Date("02/02/2007","%d/%m/%Y")),]

## construct the plot using the BASE plotting system
## save the plot to a PNG file 480x480
## (!) I'm setting the locale variable to force the plot function to use English for Time labels

png("plot4.png", width=480, height=480)

Sys.setlocale(category = "LC_ALL", locale = "english")
par(mar=c(5, 5, 1, 1), mfrow=c(2, 2), oma = c(0,0,2,0))

# plot row 1 col 1
plot(Global_active_power ~ as.POSIXct(Time2), data=february2007Data, type="l", lwd=1, xlab="", ylab="Global Active Power" )

# plot row 1 col 2
plot(Voltage ~ as.POSIXct(Time2), data=february2007Data, type="l", lwd=1, xlab="datetime", ylab="Voltage" )

# plot row 2 col 1
plot( Sub_metering_1 ~ as.POSIXct(Time2), data=february2007Data, xlab="", ylab="Energy sub metering", type="n")
lines(as.POSIXct(february2007Data$Time2), february2007Data$Sub_metering_1, lwd=1, col="black")
lines(as.POSIXct(february2007Data$Time2), february2007Data$Sub_metering_2, lwd=1, col="red")
lines(as.POSIXct(february2007Data$Time2), february2007Data$Sub_metering_3, lwd=1, col="blue")
legend("topright", lty=c(1,1,1), col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# plot row 2 col 2
plot(Global_reactive_power ~ as.POSIXct(Time2), data=february2007Data, type="l", lwd=1, xlab="datetime", ylab="Global_reactive_power" )

dev.off()

## clean the workspace

rm(myData)
rm(february2007Data)

##*************************************************************
