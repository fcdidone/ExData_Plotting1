
read.table("household_power_consumption.txt", sep = ";", header=TRUE, na.strings = "?") -> hspower
subset(hspower,Date == "1/2/2007" |  Date == "2/2/2007") -> powdate
within(powdate,Date.Time <- paste(Date,Time,sep=" ") ) ->pd
strptime(pd$Date.Time, "%d/%m/%Y %H:%M:%S") -> pd$Date.Time
png(file="plot1.png", bg= "transparent")
hist(pd[,3], col="red", main="Global Active Power",xlab = "Global Active Power(kilowatts)")
dev.off()
