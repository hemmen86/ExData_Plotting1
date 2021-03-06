##Third graph###


#1#
# Reading the data:
data<- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

#Subset the data

data<-subset(data, subset = Date>="2007-02-01" & Date<= "2007-02-02")

#Generate a full time variable
fulltime <- paste(as.Date(data$Date), data$Time)
data$fulltime <- as.POSIXct(fulltime)

#plot

with(data, {
  plot(Sub_metering_1~fulltime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~fulltime,col='Red')
  lines(Sub_metering_3~fulltime,col='Blue')
})

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Saving
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
