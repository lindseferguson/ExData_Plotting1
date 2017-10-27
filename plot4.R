#plot 4 for Exploratory Data Analysis Assignment 1

#set wd and read in the data from the .txt file provided
setwd("/Users/lindsayferguson/Documents/Coursera Data Science/Course 4_Exploratory Data Analysis")
data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings="?")

#subset the data to select the values from only Feb 1,2007 and Feb 2, 2007
data_sub <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

#convert the Date and Time columns into the correct format and combine everything into the Time column
data_sub$Date <- as.Date(data_sub$Date, "%d/%m/%Y")
data_sub$Time <- paste(data_sub$Date, data_sub$Time, sep=" ")
data_sub$Time <- strptime(data_sub$Time, "%Y-%m-%d %H:%M:%S")

#remove the Date column as it's no longer needed
data_final <- subset(data_sub, select=-Date)

#create a scatter plot to match the third plot included in the assignment
png(filename="plot4.png")
par(mfrow=c(2,2))
#plot in the first row, first column
with(data_final, plot(Time, Global_active_power, type = "l", xlab = "", 
                      ylab="Global Active Power"))

#plot in first row, second column
with(data_final, plot(Time, Voltage, type = "l", xlab = "datetime", 
                      ylab="Voltage"))

#plot in the second row, first column
with(data_final, plot(Time, Sub_metering_1, type = "l", xlab = "", 
                      ylab="Energy sub metering"))
points(data_final$Time, data_final$Sub_metering_2, type = "l", col="red")
points(data_final$Time, data_final$Sub_metering_3, type = "l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1,1), col=c("black", "red", "blue"), bty="n")

#plot in second row, second column
with(data_final, plot(Time, Global_reactive_power, type = "l", xlab = "datetime"))

dev.off()
