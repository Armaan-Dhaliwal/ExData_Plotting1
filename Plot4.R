setwd('E:/College Sem-5/Data Science/Coursera Assignments')

#Set working directory and Downloaded file
#read txt file
powerConsum <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE)

#Change classes of Date and Time variables
powerConsum$Date <- as.Date(powerConsum$Date, format = "%d/%m/%Y")
powerConsum$DateTime <- strptime(paste(powerConsum$Date,powerConsum$Time),
                                 format = "%Y-%m-%d %H:%M:%S")
#Choose data from "2007-2-1" to "2007-2-2"
powerConsum <- powerConsum[powerConsum$Date >= "2007-2-1" & powerConsum$Date <= "2007-2-2",]

#Change classes of Data's 3:8 columns
powerConsum[,3] <- as.numeric(powerConsum[,3])
powerConsum[,4] <- as.numeric(powerConsum[,4])
powerConsum[,5] <- as.numeric(powerConsum[,5])
powerConsum[,6] <- as.numeric(powerConsum[,6])
powerConsum[,7] <- as.numeric(powerConsum[,7])
powerConsum[,8] <- as.numeric(powerConsum[,8])

#Constructing Plot4
par(mfrow = c(2,2))
#Plot at topleft
with(powerConsum, plot(DateTime, Global_active_power, type = "l", xlab = "",
                       ylab = "Global Active Power", xaxt = "n"))
axis(side = 1, at = c(as.numeric(powerConsum$DateTime[1]),
                      as.numeric(powerConsum$DateTime[1441]),
                      as.numeric(powerConsum$DateTime[2880])),labels = c("Thu","Fri","Sat"))
#Plot at topright
with(powerConsum, plot(DateTime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage",
                       xaxt = "n"))
axis(side = 1, at = c(as.numeric(powerConsum$DateTime[1]),
                      as.numeric(powerConsum$DateTime[1441]),
                      as.numeric(powerConsum$DateTime[2880])),labels = c("Thu","Fri","Sat"))
#Plot at bottomleft
with(powerConsum, plot(DateTime, Sub_metering_1, type = "n", xaxt = "n",
                       xlab = "", ylab = "Energy sub metering"))
axis(side = 1, at = c(as.numeric(powerConsum$DateTime[1]),
                      as.numeric(powerConsum$DateTime[1441]),
                      as.numeric(powerConsum$DateTime[2880])),labels = c("Thu","Fri","Sat"))
with(powerConsum, lines(DateTime, Sub_metering_1))
with(powerConsum, lines(DateTime, Sub_metering_2, col = "red"))
with(powerConsum, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright",lty = 1, col=c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#Plot at bottomright
with(powerConsum, plot(DateTime, Global_reactive_power, type= "l", xlab = "datetime", 
                       ylab = "Global_reactive_power", xaxt = "n"))
axis(side = 1, at = c(as.numeric(powerConsum$DateTime[1]),
                      as.numeric(powerConsum$DateTime[1441]),
                      as.numeric(powerConsum$DateTime[2880])),labels = c("Thu","Fri","Sat"))
#Save Plot4
dev.copy(device = png, width = 480, height = 480, file = "Plot4.png")