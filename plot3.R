
read.table("household_power_consumption.txt", sep = ";", header=TRUE, na.strings = "?") -> hspower
subset(hspower,Date == "1/2/2007" |  Date == "2/2/2007") -> powdate
within(powdate,Date.Time <- paste(Date,Time,sep=" ") ) ->pd
strptime(pd$Date.Time, "%d/%m/%Y %H:%M:%S") -> pd$Date.Time
png(file="plot3.png", bg= "transparent")
plot(pd[,10], pd[,7], type="l", ylab = "Energy sub metering", xlab="")
lines(pd[,10],pd[,8], type="l", col=2 )
lines(pd[,10],pd[,9], type="l", col=4 )
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=c(1,1,1), col= c("black","red","blue"))

dev.off()
