par(mfrow=c(2,2),mar=c(4,4,2,1))
# Plot #1
with(df2,plot(timestamp,Global_active_power,type = "l",main = "",xlab=NA ,ylab = "Global Active Power (kilowates)"))
#Plot #2
with(df2,plot(timestamp,Voltage,type = "l",main = "",xlab="datetime" ,ylab = "Voltage"))
#Plot #3
with(df2,plot(timestamp,Sub_metering_1,type="n",main=NA,xlab=NA,ylab="Energy sub metering"))
points(df2$timestamp,type="l",df2$Sub_metering_1,col="black")
points(df2$timestamp,type="l",df2$Sub_metering_2,col="red")
points(df2$timestamp,type="l",df2$Sub_metering_3,col="blue")
legend("topright",lty=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#Plot #4
with(df2,plot(timestamp,Global_reactive_power,type = "l",main = "",xlab="datetime" ,ylab = "Global_reactive_power"))

dev.copy(png,file="plot4.png")
dev.off()