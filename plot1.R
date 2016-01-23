# file is the path of the dataset household_power_consumption
plot1 <- function(file){
        consumption <- read.csv2(file)
        consumption$Date <- as.Date(consumption$Date, "%d/%m/%Y")
        consumption <- subset(consumption, consumption$Date >= "2007-02-01" & consumption$Date <= "2007-02-02")
        consumption$Global_active_power <- as.numeric(as.character(consumption$Global_active_power))
        consumption$Time <- strptime(paste(consumption$Date, consumption$Time), "%Y-%m-%d %H:%M:%S")
        hist(consumption$Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")
        dev.copy(png, "plot1.png")
        dev.off()
}