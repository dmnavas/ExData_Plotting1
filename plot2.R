# file is the path of the dataset household_power_consumption
plot2 <- function(file){
        consumption <- read.csv2(file)
        consumption$Date <- as.Date(consumption$Date, "%d/%m/%Y")
        consumption <- subset(consumption, consumption$Date >= "2007-02-01" & consumption$Date <= "2007-02-02")
        consumption$Global_active_power <- as.numeric(as.character(consumption$Global_active_power))
        consumption$Time <- strptime(paste(consumption$Date, consumption$Time), "%Y-%m-%d %H:%M:%S")
        
        with(consumption, plot(Time, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
        dev.copy(png, "plot2.png")
        dev.off()
}