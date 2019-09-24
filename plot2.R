
with(df2,plot(timestamp,Global_active_power,type = "l",main = "",xlab=NA ,ylab = "Global Active Power (kilowates)"))

dev.copy(png,file="plot2.png")
dev.off()