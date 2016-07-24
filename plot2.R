##read full data & subsetting
data<-read.csv("household_power_consumption.txt", header = T, sep = ";",
               stringsAsFactors = FALSE, nrows = 2075259)
data$Date<-as.Date(data$Date, format("%d/%m/%Y"))
subdata<-data[data$Date %in% as.Date(c("2007-02-01", "2007-02-02")),]
subdata$Global_active_power<-as.numeric(subdata$Global_active_power)

##get date time info
datetime <- paste(as.Date(subdata$Date), subdata$Time)
subdata$DT <- as.POSIXct(datetime)

##making plot
png("plot2.png", width=480, height=480)
plot(subdata$Global_active_power~subdata$DT, type="l", xlab="", 
     ylab="Global Active Power (kilowatts)")
dev.off()