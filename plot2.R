plot2 <- function() {
	## Read data
	vclass<-c(rep("character",2),rep("numeric",7))
	inputdata <- read.table("household_power_consumption.txt", header = TRUE, sep=";", colClasses=vclass, na.strings="?", nrows=200000) 
	## selecting the subset data
	inputdata$Date <- as.Date(inputdata$Date, "%d/%m/%Y")
	inputdata <- inputdata[(inputdata$Date>="2007-02-01" & inputdata$Date<="2007-02-02"),] 
	
	## construct datetime variable
	inputdata$DateTime <- paste(as.character(inputdata$Date),inputdata$Time, sep=" ")
	inputdata$DateTime <- as.POSIXlt(inputdata$DateTime)
	## generate plot
	plot(inputdata$DateTime, inputdata$Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", type="l")

	## save as png file
	dev.copy(png, file="plot2.png", width=480, height=480)
	## turn off device
	dev.off()	

}