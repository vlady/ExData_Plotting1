# Read Household Power Consumption. ; separated data with ? as na.
power_data <- read.table("household_power_consumption.txt", sep=";", na.strings = "?", header = TRUE)

# Keep only the relevant data for the project.
power_data <- subset(power_data, Date == "1/2/2007" | Date == "2/2/2007")

# Extract date and time and concatenate them to get the full dates.
date_labels_strings <- with(power_data, paste(Date, Time))
# Convert to POSIXlt dates.
date_labels <- strptime(date_labels_strings, format="%d/%m/%Y %H:%M:%S")

# Plot - date vs active power, line graph.
plot(date_labels, power_data$Global_active_power, type="l",
     main = "", xlab = "", ylab="Global Active Power (kilowatts)")

# Save it as png 480 x 480.
dev.copy(device = png, "plot2.png", width = 480, height = 480)
dev.off()