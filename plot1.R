library(dplyr)
tabela <- read.csv('household_power_consumption.txt', sep=';', na.strings='?')
tabela$DateTime <- paste(tabela$Date, tabela$Time)
tabela$DateTime <- as.Date(tabela$DateTime, format = "%d/%m/%Y %H:%M:%S")
subsetted <- filter(tabela, DateTime >= as.Date("2007-02-01 00:00:00"), DateTime < as.Date("2007-02-03 00:00:00"))
png(file="plot1.png",width=480,height=480)
hist(subsetted$Global_active_power, col="red", main="Global Active Power", ylab="Frequency", xlab="Global Active Power (kilowatts)")
dev.off()
