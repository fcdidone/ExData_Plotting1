
read.table("household_power_consumption.txt", sep = ";", header=TRUE, na.strings = "?") -> hspower
subset(hspower,Date == "1/2/2007" |  Date == "2/2/2007") -> powdate
within(powdate,Date.Time <- paste(Date,Time,sep=" ") ) ->pd
strptime(pd$Date.Time, "%d/%m/%Y %H:%M:%S") -> pd$Date.Time
png(file="plot2.png", bg= "transparent")
plot(pd[,10], pd[,3], type="l",ylab = "Global Active Power", xlab="")
dev.off()
