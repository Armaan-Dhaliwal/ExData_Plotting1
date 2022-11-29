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


#Constructing Plot2..because x-axis is named "Koean" in my laptop, I reset x-axis
with(powerConsum, plot(DateTime, Global_active_power, type = "l", xlab = "",
                       ylab = "Global Active Power (kilowatts)", xaxt = "n"))
axis(side = 1, at = c(as.numeric(powerConsum$DateTime[1]),
                      as.numeric(powerConsum$DateTime[1441]),
                      as.numeric(powerConsum$DateTime[2880])),labels = c("Thu","Fri","Sat"))
#Save plot2 to a PNG file
dev.copy(device = png, width = 480, height = 480, file = "Plot2.png")