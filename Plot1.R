# Loading the data
data<-read.table("./household_power_consumption.txt", sep=";", stringsAsFactor =F, na.strings="?", quote="", header=T)
index<- (data$Date %in% c("1/2/2007","2/2/2007"))
data2<-data[index, ]
data3<-data2[complete.cases(data2), ]
data3$Time <- strptime(paste(data3$Date, data3$Time), format="%d/%m/%Y %H:%M:%S")
data3$Date<-as.Date(data3$Date, format="%d/%m/%Y")

# Making Plot1
Plot1<- hist(data3$Global_active_power, main="Global Active Power", xlab="Global Active Power (Kilowatts)", col="red")
png(filename = "Plot1.png", width = 480, height = 480, units = "px")
dev.off()
