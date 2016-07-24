##read full data & subsetting
data<-read.csv("household_power_consumption.txt", header = T, sep = ";",
               stringsAsFactors = FALSE, nrows = 2075259)
data$Date<-as.Date(data$Date, format("%d/%m/%Y"))
subdata<-data[data$Date %in% as.Date(c("2007-02-01", "2007-02-02")),]
submetering1 <- as.numeric(subdata$Sub_metering_1)
submetering2 <- as.numeric(subdata$Sub_metering_2)
submetering3 <- as.numeric(subdata$Sub_metering_3)

##get date time info
datetime <- paste(as.Date(subdata$Date), subdata$Time)
subdata$DT <- as.POSIXct(datetime)

##making plot
png("plot3.png", width=480, height=480)
with(subdata,
     {
       plot(submetering1~DT, type="l", xlab="", ylab="Energy Sub metering")
lines(submetering2~DT, col="red")
lines(submetering3~DT, col="blue")
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
      c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()