#plot 1 for Exploratory Data Analysis Assignment 1

#set wd and read in the data from the .txt file provided
setwd("/Users/lindsayferguson/Documents/Coursera Data Science/Course 4_Exploratory Data Analysis")
data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings="?")

#subset the data to select the values from only Feb 1,2007 and Feb 2, 2007
data_sub <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

#create a histogram to match the first plot included in the assignment
png(filename="plot1.png")
hist(data_sub$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", 
     main = "Global Active Power")
dev.off()
