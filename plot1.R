##*************************************************************
## COURSERA
## EXPLORATORY DATA ANALYSIS 
## Course Project 1: Electric power consumption
##
## AUTHOR: Katarzyna Pienczk
##
## PLOT 1: Global active power (kilowatts) - histogram
##
## INSTRUCTION: (!) Before running the script, 
##              place the "household_power_consumption.txt" file
##              in the working directory.
##              Then type source("plot1.R") to run the script           
##
## RESULT: The script generates a histogram of the "Global Active Power" variable
##         for the 2-days time period <01/02/2007, 02/02/2007>
##         and saves the plot to the "plot1.png" file
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

png("plot1.png", width=480, height=480)
par(mar=c(5, 5, 5, 2))
hist(february2007Data$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col="red")
dev.off()

## clean the workspace

rm(myData)
rm(february2007Data)

##*************************************************************
