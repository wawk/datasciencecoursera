## Read in txt file using read.table
df <- read.table("./household_power_consumption.txt", sep=";", header=T, numerals="no.loss", as.is=T, na.strings="?")

## Combine Date and Time and create new column DateTime
df$DateTime <- strptime(paste(df$Date,df$Time), "%d/%m/%Y %H:%M:%S")

## Convert Date column values to Date objects
df$Date <- as.Date(df$Date, "%d/%m/%Y")

## Subset data based on specific Date range
subDF <- subset(df, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

## Open PNG graphing device with a size of 480 x 480
png(file = "plot3.png", height=480, width=480)

## plot line graph for the data
plot(subDF$DateTime, subDF$Sub_metering_1, type="l", xlab="",ylab="Energy sub metering")

## Using lines function add red and blue line values to current graph
lines(subDF$DateTime, subDF$Sub_metering_2, col = "red", type="l")
lines(subDF$DateTime, subDF$Sub_metering_3, col="blue", type="l")

## create a legend in the topright of the graph representing the values
legend("topright", col = c("black", "red", "blue"), lty = 1, legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty = "o")

## Close the graph device to create file
dev.off()