df1 <- read.csv("household_power_consumption.txt",sep = ";", header = FALSE, skip=66637, nrows=1440)
df2 <- read.csv("household_power_consumption.txt",sep = ";", header = FALSE, skip=68077, nrows=1440)
df <- rbind(df1,df2)
n <- read.csv("household_power_consumption.txt",sep = ";", header = FALSE, nrows=1)
names(df) <- lapply(n[1,],as.character)

df$dt <- strptime(paste(df$Date,df$Time),"%d/%m/%Y %H:%M:%S")
Sys.setlocale("LC_TIME", "C")

png("plot2.png", 480, 480)
plot(df$dt,df$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()

rm(df1,df2,n,df)