
read.table("household_power_consumption.txt", sep = ";", header=TRUE, na.strings = "?") -> hspower
subset(hspower,Date == "1/2/2007" |  Date == "2/2/2007") -> powdate
within(powdate,Date.Time <- paste(Date,Time,sep=" ") ) ->pd
strptime(pd$Date.Time, "%d/%m/%Y %H:%M:%S") -> pd$Date.Time
png(file="plot4.png", bg= "transparent")
par(mfrow=c(2,2))
plot(pd[,10], pd[,3], type="l",ylab = "Global Active Power", xlab="")
plot(pd[,10], pd[,5], type="l",ylab = "Voltage", xlab="datetime")
plot(pd[,10], pd[,7], type="l", ylab = "Energy sub metering", xlab="")
lines(pd[,10],pd[,8], type="l", col=2 )
lines(pd[,10],pd[,9], type="l", col=4 )
legend("topright",cex = .88 ,legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),bty="n", col= c("black","red","blue"))
plot(pd[,10], pd[,4], type="l",ylab = "Global_Reactive_Power", xlab="")

dev.off()
