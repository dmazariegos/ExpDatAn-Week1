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

#Creating Plot1

png("plot1.png", width=480,height=480,units="px")
hist(data_subset$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col="red")
dev.copy(png,file="plot1.png")
dev.off()
