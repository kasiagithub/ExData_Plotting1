##*************************************************************
## COURSERA
## EXPLORATORY DATA ANALYSIS 
## Course Project 1: Electric power consumption
##
## AUTHOR: Katarzyna Pienczk
##
## PLOT 2: Global active power (kilowatts) - usage over time
##
## INSTRUCTION: Before running the script, 
##              place the "household_power_consumption.txt" file
##              in the working directory.
##              Then type source("plot2.R") to run the script           
##
## RESULT: The script generates a plot of the Global Active Power usage over time
##         for the 2-days time period <01/02/2007, 02/02/2007>
##         and saves the plot to the "plot2.png" file
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

png("plot2.png", width=480, height=480)

Sys.setlocale(category = "LC_ALL", locale = "english")
par(mar=c(5, 5, 5, 2))
plot(Global_active_power ~ as.POSIXct(Time2), data=february2007Data, type="l", lwd=1, xlab="", ylab="Global Active Power (kilowatts)" )

dev.off()

## clean the workspace

rm(myData)
rm(february2007Data)

##*************************************************************
