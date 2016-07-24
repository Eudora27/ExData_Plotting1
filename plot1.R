##read full data & subsetting
data<-read.csv("household_power_consumption.txt", header = T, sep = ";",
               stringsAsFactors = FALSE, nrows = 2075259)
data$Date<-as.Date(data$Date, format("%d/%m/%Y"))
subdata<-data[data$Date %in% as.Date(c("2007-02-01", "2007-02-02")),]
subdata$Global_active_power<-as.numeric(subdata$Global_active_power)

##making plot
png("plot1.png", width=480, height=480)
hist(subdata$Global_active_power, col="red", xlab="Global Active Power (kilowatt)",
     ylab="Frequency", main="Global Active Power")
dev.off()
