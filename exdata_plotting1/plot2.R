## Read text file using read.table to create data.frame
df <- read.table("./household_power_consumption.txt", sep=";", header = T, numerals = "no.loss", as.is = T, na.strings="?")

## Combine the Date and Time and create new column DateTime
df$DateTime <- strptime(paste(df$Date,df$Time),"%d/%m/%Y %H:%M:%S")

## Convert Date column values to Date objects
df$Date <- as.Date(df$Date, "%d/%m/%Y")

## Subset based on specific date values
subDF <- subset(df, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

## Open png device with a size of 480 X 480
png(file="plot2.png", height=480, width=480)

## Plot a line graph
plot(subDF$DateTime, subDF$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

## close graphing device
dev.off()
