# Read Data
data <- read.table("./household_power_consumption.txt", header = TRUE, sep=";")

# Convert to numeric columns from No.3 to No.7
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))
data$Voltage <- as.numeric(as.character(data$Voltage))
data$Global_intensity <- as.numeric(as.character(data$Global_intensity))
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))

# Convert column No.1 to Date
data$Date <- as.Date(as.character(data$Date), format = "%d/%m/%Y")

# Create a Subset by dates range
data_subset <- subset(data,data$Date >= "2007/02/01" & data$Date <= "2007/02/02")

##################################################################################

#Creating Plot3

png("plot3.png", width=480,height=480,units="px")
plot(as.POSIXct(paste(data_subset[,1], data_subset[,2])), data_subset$Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering")
lines(as.POSIXct(paste(data_subset[,1], data_subset[,2])), data_subset$Sub_metering_2, type="l", col="red")
lines(as.POSIXct(paste(data_subset[,1], data_subset[,2])), data_subset$Sub_metering_3, type="l", col="blue")
legend("topright",lty=c(1,1,1),pch = c(NA,NA,NA), col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png,file="plot3.png")
dev.off()
