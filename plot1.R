## code for Plot1
dataset <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                    nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
##getting required dataset for given two dates
data_req <- subset(dataset, Date %in% c("1/2/2007","2/2/2007"))
hist(data_req$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", 
     col="Red")

## getting the png file with required dimensions
dev.copy(png, "plot1.png", width=480, height=480)
dev.off()
