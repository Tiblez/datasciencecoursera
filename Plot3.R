# Loading the data
data<-read.table("./household_power_consumption.txt", sep=";", stringsAsFactor =F, na.strings="?", quote="", header=T)
index<- (data$Date %in% c("1/2/2007","2/2/2007"))
data2<-data[index, ]
data3<-data2[complete.cases(data2), ]
data3$Time <- strptime(paste(data3$Date, data3$Time), format="%d/%m/%Y %H:%M:%S")
data3$Date<-as.Date(data3$Date, format="%d/%m/%Y")

# Making Plot3
plot(data3$Time, data3$Sub_metering_1, xlab="", ylab="Energy sub metering", type="l")
points(data3$Time, data3$Sub_metering_2, type="l", col="red")
points(data3$Time, data3$Sub_metering_3, type="l", col="blue")
legend("topright",lty=1, lwd=2, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=0.9)
png(filename = "Plot3.png", width = 480, height = 480, units = "px")
dev.copy(png, file="Plot3.png")
dev.off()