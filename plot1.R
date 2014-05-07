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

# plot the chart to png file
png(file = "plot1.png")
hist(hpc$Global_active_power,xlab="Global Active Power (kilowatts)", main = "Global Active Power", col="red")
dev.off()
