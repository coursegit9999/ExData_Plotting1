plot3 <- function() {
    
setwd("D:/R/RClass/EDA_Proj1")

tabrows <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

tabrows$Date <- as.Date(tabrows$Date , "%d/%m/%Y")

tabsel <-  tabrows[ tabrows$Date >= as.Date('2007-02-01') & tabrows$Date <= as.Date('2007-02-02') & tabrows$Sub_metering_1 != "?" & tabrows$Sub_metering_2 != "?" & tabrows$Sub_metering_3 != "?",]

tabsel$Sub_metering_1 <- as.numeric(as.character(tabsel$Sub_metering_1))
tabsel$Sub_metering_2 <- as.numeric(as.character(tabsel$Sub_metering_2))
tabsel$Sub_metering_3 <- as.numeric(as.character(tabsel$Sub_metering_3))

tabsel$DateTime <- strptime(paste(tabsel$Date, tabsel$Time), "%Y-%m-%d %H:%M:%S") 

png('plot3.png', width = 480, height = 480, units = "px")

plot(tabsel$DateTime, tabsel$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(tabsel$DateTime, tabsel$Sub_metering_2, type="l", col="red") 
lines(tabsel$DateTime, tabsel$Sub_metering_3, type="l", col="blue") 
legend("topright", y=NULL, legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=c(1,1,1), lwd=c(1,1,1))

dev.off()
    
}