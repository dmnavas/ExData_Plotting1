# file is the path of the dataset household_power_consumption
plot3 <- function(file){
        consumption <- read.csv2(file)
        consumption$Date <- as.Date(consumption$Date, "%d/%m/%Y")
        consumption <- subset(consumption, consumption$Date >= "2007-02-01" & consumption$Date <= "2007-02-02")
        consumption$Global_active_power <- as.numeric(as.character(consumption$Global_active_power))
        consumption$Time <- strptime(paste(consumption$Date, consumption$Time), "%Y-%m-%d %H:%M:%S")
        consumption$Sub_metering_1 <- as.numeric(as.character(consumption$Sub_metering_1))
        consumption$Sub_metering_2 <- as.numeric(as.character(consumption$Sub_metering_2))
        consumption$Sub_metering_3 <- as.numeric(as.character(consumption$Sub_metering_3))
        
        with(consumption, plot(Time, Sub_metering_1, type="l", xlab="", ylab = "Energy sub metering"))
        with(consumption, lines(Time, Sub_metering_2, col="red"))
        with(consumption, lines(Time, Sub_metering_3, col="blue"))
        legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
               col=c("black","blue","red"), lty=c(1,1,1), cex=0.75)
        
        dev.copy(png, "plot3.png")
        dev.off()
}