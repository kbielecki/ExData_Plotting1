#fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
#download.file(fileUrl,destfile="elect_power_consump.zip")
#unzip("elect_power_consump.zip")

library(dplyr)
library(lubridate)

# Load Data
df1<-read.table("./household_power_consumption.txt",sep =";",stringsAsFactors = FALSE,header = TRUE,strip.white=TRUE)
# Add date type columns i.e. converted into in POSIXct class
df2<-mutate(df1,day=as.Date(Date,"%d/%m/%Y"),timestamp=as.POSIXct(strptime(paste(Date,Time,sep = " "),"%d/%m/%Y %H:%M:%S")))
# Select data from within only necessary period
df2<-filter(df2,day>=dmy("01/02/2007"),day<dmy("03/02/2007"))
rm(df1)

# Check and leave only rows with non ? values
# fortunately no rows with ? within observation period
df2<-filter_at(df2,vars(matches("Global|Voltage|Sub")),any_vars(. != "?" ))

# Convert data type to numeric of columns containing numbers
df2<-mutate_at(df2,vars(matches("Global|Voltage|Sub")),as.numeric)

#Plot line graph
with(df2,plot(timestamp,Sub_metering_1,type="n",main=NA,xlab=NA,ylab="Energy sub metering"))

points(df2$timestamp,type="l",df2$Sub_metering_1,col="black")
points(df2$timestamp,type="l",df2$Sub_metering_2,col="red")
points(df2$timestamp,type="l",df2$Sub_metering_3,col="blue")

legend("topright",lty=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.copy(png,file="plot3.png")
dev.off()