## Read data in from txt file into data.frame
df <-read.table("./household_power_consumption.txt", sep=";", header = T, numerals = "no.loss", as.is = T, na.strings = "?")

##Convert Date column to a Date objec type
df$Date <- as.Date(df$Date, "%d/%m/%Y")

## subSet data based on Date >= 2007-02-01 & Date <= 2007-02-02
subDate <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

## Open PNG device with width of 480 X 480
png(file="plot1.png", width = 480, height = 480)

## plot a histogram
hist(subData$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

## close the device to create the file
dev.off()