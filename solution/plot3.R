df1 <- read.csv("household_power_consumption.txt",sep = ";", header = FALSE, skip=66637, nrows=1440)
df2 <- read.csv("household_power_consumption.txt",sep = ";", header = FALSE, skip=68077, nrows=1440)
df <- rbind(df1,df2)
n <- read.csv("household_power_consumption.txt",sep = ";", header = FALSE, nrows=1)
names(df) <- lapply(n[1,],as.character)

df$dt <- strptime(paste(df$Date,df$Time),"%d/%m/%Y %H:%M:%S")
Sys.setlocale("LC_TIME", "C")

png("plot3.png", 480, 480)
plot(df$dt,df$Sub_metering_1,col="black", type="l", xlab="", ylab="Energy sub metering")
points(df$dt, df$Sub_metering_2,col="red", type="l")
points(df$dt, df$Sub_metering_3,col="blue", type="l")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd = 1, col=c("black","red","blue"))
dev.off()

rm(df1,df2,n,df)