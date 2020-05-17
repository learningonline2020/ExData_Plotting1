## code for Plot2
dataset <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                    nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
##getting required dataset for given two dates
data_req <- subset(dataset, Date %in% c("1/2/2007","2/2/2007"))
data_req$Date <- as.Date(data_req$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data_req$Date), data_req$Time)
data_req$Datetime <- as.POSIXct(datetime)

## plotting in png file with required dimensions
plot(data_req$Datetime, data_req$Global_active_power, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
