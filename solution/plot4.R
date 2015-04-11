df1 <- read.csv("household_power_consumption.txt",sep = ";", header = FALSE, skip=66637, nrows=1440)
df2 <- read.csv("household_power_consumption.txt",sep = ";", header = FALSE, skip=68077, nrows=1440)
df <- rbind(df1,df2)
n <- read.csv("household_power_consumption.txt",sep = ";", header = FALSE, nrows=1)
names(df) <- lapply(n[1,],as.character)

df$dt <- strptime(paste(df$Date,df$Time),"%d/%m/%Y %H:%M:%S")
Sys.setlocale("LC_TIME", "C")

png("plot4.png", 480, 480)
par(mfrow=c(2,2))
#1
plot(df$dt,df$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
#2
plot(df$dt,df$Voltage, type="l", xlab="datetime", ylab="Voltage")
#3
plot(df$dt,df$Sub_metering_1,col="black", type="l", xlab="", ylab="Energy sub metering")
points(df$dt, df$Sub_metering_2,col="red", type="l")
points(df$dt, df$Sub_metering_3,col="blue", type="l")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd = 1, col=c("black","red","blue"), bty="n")
#4
plot(df$dt,df$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()

rm(df1,df2,n,df)