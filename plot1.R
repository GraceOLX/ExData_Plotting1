plot1 <- function() {
	## Read data
	vclass<-c(rep("character",2),rep("numeric",7))
	inputdata <- read.table("household_power_consumption.txt", header = TRUE, sep=";", colClasses=vclass, na.strings="?", nrows=200000) 
	## selecting the subset data
	inputdata$Date <- as.Date(inputdata$Date, "%d/%m/%Y")
	inputdata <- inputdata[(inputdata$Date>="2007-02-01" & inputdata$Date<="2007-02-02"),] 

	## generate plot
	hist(inputdata$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

	## save as png file
	dev.copy(png, file="plot1.png", width=480, height=480)

	## turn off device
	dev.off()	

}