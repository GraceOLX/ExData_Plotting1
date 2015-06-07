plot4 <- function() {
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
	par(mfrow=c(2,2), mar=c(4.5,4,2.5,1))
	with(inputdata, {
		# plot1, top left
		plot(inputdata$DateTime, inputdata$Global_active_power, ylab="Global Active Power", xlab="", type="l")

		# plot2, top right
		plot(inputdata$DateTime, inputdata$Voltage, ylab="Voltage", xlab="datetime", type="l")
		
		# plot3, bottom left
		colvector <- c("black", "red", "blue")
		plot(inputdata$DateTime, inputdata$Sub_metering_1, type="l", col=colvector[1], ylab="Energy sub metering", xlab="") 
		lines(inputdata$DateTime, inputdata$Sub_metering_2, type="l", col=colvector[2])
		lines(inputdata$DateTime, inputdata$Sub_metering_3, type="l", col=colvector[3]) 
		legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=colvector, lty="solid", bty="n")

		# plot4, bottom right
		plot(inputdata$DateTime, inputdata$Global_reactive_power, ylab="Global_reactive_power", xlab="datetime", type="l")		

	})

	## save as png file
	dev.copy(png, file="plot4.png", width=480, height=480)
	## turn off device
	dev.off()	

}