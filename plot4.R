##read full data & subsetting
data<-read.csv("household_power_consumption.txt", header = T, sep = ";",
               stringsAsFactors = FALSE, nrows = 2075259)
data$Date<-as.Date(data$Date, format("%d/%m/%Y"))
subdata<-data[data$Date %in% as.Date(c("2007-02-01", "2007-02-02")),]
subdata$Global_active_power<-as.numeric(subdata$Global_active_power)
subdata$Global_reactive_power<-as.numeric(subdata$Global_reactive_power)
submetering1 <- as.numeric(subdata$Sub_metering_1)
submetering2 <- as.numeric(subdata$Sub_metering_2)
submetering3 <- as.numeric(subdata$Sub_metering_3)

##get date time info
datetime <- paste(as.Date(subdata$Date), subdata$Time)
subdata$DT <- as.POSIXct(datetime)


##making plot
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

#1
plot(subdata$Global_active_power~subdata$DT, type="l", xlab="", 
     ylab="Global Active Power (kilowatts)")

#2
plot(subdata$Voltage~subdata$DT, type="l", xlab="datetime", ylab="Voltage")

#3
with(subdata,
     {
       plot(submetering1~DT, type="l", xlab="", ylab="Energy Sub metering")
       lines(submetering2~DT, col="red")
       lines(submetering3~DT, col="blue")
     })
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#4
plot(subdata$Global_reactive_power~subdata$DT, type="l", xlab="datetime", 
     ylab="Global_reactive_power")
dev.off()