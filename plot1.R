# Read Household Power Consumption. ; separated data with ? as na.
power_data <- read.table("household_power_consumption.txt", sep=";", na.strings = "?", header = TRUE)

# Keep only the relevant data for the project.
power_data <- subset(power_data, Date == "1/2/2007" | Date == "2/2/2007")

# Create histogram: red with title and x label.
hist(power_data$Global_active_power, col = "red", main="Global Active Power",
     xlab = "Global Active Power (kilowatts)")

# Save it as png 480 x 480.
dev.copy(device = png, "plot1.png", width = 480, height = 480)
dev.off()