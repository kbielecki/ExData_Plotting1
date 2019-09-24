with(df2,plot(timestamp,Sub_metering_1,type="n",main=NA,xlab=NA,ylab="Energy sub metering"))

points(df2$timestamp,type="l",df2$Sub_metering_1,col="black")
points(df2$timestamp,type="l",df2$Sub_metering_2,col="red")
points(df2$timestamp,type="l",df2$Sub_metering_3,col="blue")

legend("topright",lty=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.copy(png,file="plot3.png")
dev.off()