# define the classes for input feilds
colClasses <- c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")

# load the data
data <- read.table("household_power_consumption.txt", na.strings="?",sep=";",header=TRUE,colClasses = colClasses)

# extract data for dates 2007-02-01 and 2007-02-02
hpc <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

# convert Date and Time into Date/Time classess in R
datetime <- strptime (paste(hpc$Date,hpc$Time,sep=" "), format = "%d/%m/%Y %H:%M:%S")

# attached the new datatime column into the table
hpc <- cbind(datetime,hpc)

# plot the charts and save to png file
png(file = "plot4.png")
par(mfcol=c(2,2))
plot(hpc$datetime,hpc$Global_active_power,type='l',ylab="Global Active Power",xlab="")
plot(hpc$datetime,hpc$Sub_metering_1,type='l',ylab="Energy sub metering",xlab="")
points(hpc$datetime,hpc$Sub_metering_2,type='l',col="Red")
points(hpc$datetime,hpc$Sub_metering_3,type='l',col="Blue")
legend("topright",bty="n",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("Black","Red","Blue"),lty=1,cex=0.8)
plot(hpc$datetime,hpc$Voltage,type='l',ylab="Voltage",xlab="datetime")
plot(hpc$datetime,hpc$Global_reactive_power,type='l',ylab="Global_reactive_power",xlab="datetime")
dev.off()
