# file is the path of the dataset household_power_consumption
plot4 <- function(file){
        consumption <- read.csv2("household_power_consumption.txt")
        consumption$Date <- as.Date(consumption$Date, "%d/%m/%Y")
        consumption <- subset(consumption, consumption$Date >= "2007-02-01" & consumption$Date <= "2007-02-02")
        consumption$Global_active_power <- as.numeric(as.character(consumption$Global_active_power))
        consumption$Time <- strptime(paste(consumption$Date, consumption$Time), "%Y-%m-%d %H:%M:%S")
        consumption$Sub_metering_1 <- as.numeric(as.character(consumption$Sub_metering_1))
        consumption$Sub_metering_2 <- as.numeric(as.character(consumption$Sub_metering_2))
        consumption$Sub_metering_3 <- as.numeric(as.character(consumption$Sub_metering_3))
        consumption$Voltage <- as.numeric(as.character(consumption$Voltage))
        consumption$Global_reactive_power <- as.numeric(as.character(consumption$Global_reactive_power))
        
        par(mfcol=c(2, 2))
        
        with(consumption, {
                plot(Time, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
                plot(Time, Sub_metering_1, type="l", xlab="", ylab = "Energy sub metering")
                lines(Time, Sub_metering_2, col="red")
                lines(Time, Sub_metering_3, col="blue")
                legend("topright", 
                       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","blue","red"), lty=c(1,1,1), bty="n", cex=0.75)
                plot(Time, Voltage, xlab="datetime", type="l")
                plot(Time, Global_reactive_power, xlab="datetime", type="l")
        })
        
        
        dev.copy(png, "plot4.png")
        dev.off()
}