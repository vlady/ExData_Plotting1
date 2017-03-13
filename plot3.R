# Read Household Power Consumption. ; separated data with ? as na.
power_data <- read.table("household_power_consumption.txt", sep=";", na.strings = "?", header = TRUE)

# Keep only the relevant data for the project.
power_data <- subset(power_data, Date == "1/2/2007" | Date == "2/2/2007")

# Extract date and time and concatenate them to get the full dates.
date_labels_strings <- with(power_data, paste(Date, Time))
# Convert to POSIXlt dates.
date_labels <- strptime(date_labels_strings, format="%d/%m/%Y %H:%M:%S")

# Start with Sub_metering_1 and then add the other 2.
plot(date_labels, power_data$Sub_metering_1, type="l",
     main = "", xlab = "", ylab = "Energy sub metering")
points(date_labels, power_data$Sub_metering_2, type = "l", col="red")
points(date_labels, power_data$Sub_metering_3, type = "l", col="blue")

# Add the legend.
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = c(1, 1, 1))

# Save it as png 480 x 480.
dev.copy(device = png, "plot3.png", width = 480, height = 480)
dev.off()