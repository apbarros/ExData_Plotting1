library(dplyr)
tabela <- read.csv('household_power_consumption.txt', sep=';', na.strings='?')
tabela$DateTime <- paste(tabela$Date, tabela$Time)
tabela$DateTime <- as.Date(tabela$DateTime, format = "%d/%m/%Y %H:%M:%S")
subsetted <- filter(tabela, DateTime >= as.Date("2007-02-01 00:00:00"), DateTime < as.Date("2007-02-03 00:00:00"))
png(file="plot3.png",width=480,height=480)
subsetted$newdate = strptime(paste(subsetted$Date, subsetted$Time, sep = " "),"%d/%m/%Y %H:%M:%S")
with (subsetted, {
plot(newdate, Sub_metering_1,col="black", type='l', xlab="", ylab="Energy sub metering")
points(newdate, Sub_metering_2,col="red", type='l')
points(newdate, Sub_metering_3,col="blue", type='l')
})
legend("topright", lwd=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


dev.off()