plot2 <- function() {
    
setwd("D:/R/RClass/EDA_Proj1")

tabrows <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

tabrows$Date <- as.Date(tabrows$Date , "%d/%m/%Y")

tabsel <-  tabrows[ tabrows$Date >= as.Date('2007-02-01') & tabrows$Date <= as.Date('2007-02-02') & tabrows$Global_active_power != "?",]

tabsel$Global_active_power <- as.numeric(as.character(tabsel$Global_active_power))

tabsel$DateTime <- strptime(paste(tabsel$Date, tabsel$Time), "%Y-%m-%d %H:%M:%S") 

png('plot2.png', width = 480, height = 480, units = "px")

plot(tabsel$DateTime, tabsel$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

dev.off()
    
}