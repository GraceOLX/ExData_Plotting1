plot3 <- function() {
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
	colvector <- c("black", "red", "blue")
	plot(inputdata$DateTime, inputdata$Sub_metering_1, type="l", col=colvector[1],ylab="Energy sub metering",xlab="") 
	lines(inputdata$DateTime, inputdata$Sub_metering_2, type="l", col=colvector[2])
	lines(inputdata$DateTime, inputdata$Sub_metering_3, type="l", col=colvector[3]) 
	legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=colvector, lty="solid")

	## save as png file
	dev.copy(png, file="plot3.png", width=480, height=480)
	## turn off device
	dev.off()	

}