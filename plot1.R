#-------------------------------------------------------------------------------
# Get libraries
library(lubridate)
library(dplyr)

# The dataset has 2,075,259 rows and 9 columns.
# Estimation of required memory in R:
required_memory_estimate <- object.size(numeric(2075259*9))
required_memory_estimate

# Get data
#-------------------------------------------------------------------------------
fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl, "exdata_data_household_power_consumption.zip")
unzip("exdata_data_household_power_consumption.zip")
    
# Get only interesing line in datafile "household_power_consumption.txt"
# Get only first line, to know the first date and first hour
line1 <- read.table("household_power_consumption.txt", 
    header = TRUE, sep = ";", na.strings = "?", nrows = 1)
time1 <- dmy(line1$Date) + hms(line1$Time)
time2 <- ymd("2007/02/01")

# Calculate number of lines to skip
# One row per minute
skiplines <- as.numeric(difftime(time2, time1, unit = "mins")) + 1
# Calculate number of lines to read
# Two entire days
readlines <- 48 * 60
# Read the subset
data <- read.table("household_power_consumption.txt", 
    header = FALSE, sep = ";", na.strings = "?",
    skip = skiplines, nrows = readlines)
names(data) <- names(line1)

# Add a complete date with date+hour (will serve for plots 2 and more)
#-------------------------------------------------------------------------------
data <- data %>% mutate(complete_date = dmy(Date) + hms(Time))


# Make plot1
#-------------------------------------------------------------------------------
# Creating function to be able to reuse it into a multiplot
funplot1 <- function() {
    hist(data$Global_active_power,
        xlab = "Global Active Power (kilowatts)",
        col = "red",
        main = "Global Active Power")    
}

# Sending plot to png device
png(filename = "plot1.png",
    width = 480, height = 480, units = "px", bg = NA)

funplot1()   
    
dev.off()

