## read text file into data.frame with read.table
df <- read.table(file="household_power_consumption.txt", sep=";", header=T, numerals="no.loss", as.is=T,na.strings="?")

## Combine Date and Time and create new Column DateTime
df$DateTime <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")

## Convert Date column values into Date objects
df$Date <- as.Date(df$Date, "%d/%m/%Y")

## Subset data basaed on date range
subDF <- subset(df, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

## Open PNG graphing device with size of 480 x 480
png(file="plot4.png", height=480,width=480)

## set up display to be a 2 x 2 matrix - graphs will be placed by rows
par(mfrow = c(2,2))

## Add first graph to device
plot(subDF$DateTime, subDF$Global_active_power, type="l", xlab="",ylab="Global Active Power")

## Add second graph to device
plot(subDF$DateTime, subDF$Voltage, type="l",xlab="datetime",ylab="Voltage")

## Add third graph to device
plot(subDF$DateTime, subDF$Sub_metering_1, type="l", xlab="",ylab="Energy sub metering")

## Use lines function to add red and blue line values for additional data
lines(subDF$DateTime, subDF$Sub_metering_2, col="red", type="l")
lines(subDF$DateTime, subDF$Sub_metering_3, col="blue", type="l")

## Add legend to third graph (no boundry box)
legend("topright", col=c("black","red","blue"), lty=1, bty="n",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## plot fourth graph on device
plot(subDF$DateTime,subDF$Global_reactive_power, type="l",ylab="Global_reactive_power",xlab="datetime")

## close graphing device to create file
dev.off()