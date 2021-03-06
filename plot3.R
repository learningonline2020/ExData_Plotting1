## code for Plot3
dataset <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                    nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
##getting required dataset for given two dates
data_req <- subset(dataset, Date %in% c("1/2/2007","2/2/2007"))
data_req$Date <- as.Date(data_req$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data_req$Date), data_req$Time)
data_req$Datetime <- as.POSIXct(datetime)

## plotting in png file with required dimensions
with(data1, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
