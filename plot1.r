#Plot1.R

library(data.table)
household <- fread("household_power_consumption.txt")

#filter -- We will only be using data from the dates 2007-02-01 and 2007-02-02.
household <- subset(household, Date %in% c("1/2/2007", "2/2/2007"))
#str(household)
library(lubridate)

#reformat some of the fields with lubridate

#Dates to Date_time format via lubridate
household$Date_reformat <- dmy(household$Date)
household$Date_Time <- paste(household$Date, household$Time)
household$Date_time_reformat <- dmy_hms(household$Date_Time)
#table(household$Date_reformat)
#boxplot(household$Date_time_reformat)
#sum(is.na(household$Date_time_reformat))
#head(household,5)

#setting up numeric variables
household$Global_active_power <- as.numeric(household$Global_active_power)
household$Sub_metering_1 <- as.numeric(household$Sub_metering_1)
household$Sub_metering_2 <- as.numeric(household$Sub_metering_2)
household$Sub_metering_3 <- as.numeric(household$Sub_metering_3)

household$Voltage <- as.numeric(household$Voltage)
household$Global_reactive_power <- as.numeric(household$Global_reactive_power)

# 1.
png("plot1.png", width=480, height=480)
hist(household$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")
dev.off()