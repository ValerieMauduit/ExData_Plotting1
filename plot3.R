# Using data loaded by plot1.R

#-------------------------------------------------------------------------------
# Get libraries
library(lubridate)
library(dplyr)

# Make plot3
#-------------------------------------------------------------------------------

# Creating function to be able to reuse it into a multiplot
funplot3 <- function(bord) {
    # Black line = Sub_metering_1
    plot(data$complete_date, data$Sub_metering_1, 
        type = "l", xaxt = "n",
        xlab = "", ylab = "Energy sub metering")
    # Red line = Sub_metering_2
    lines(data$complete_date, data$Sub_metering_2, col = "red") 
    # Blue line = Sub_metering_3
    lines(data$complete_date, data$Sub_metering_3, col = "blue") 
    legend("topright", 
        box.lwd = bord,
        lty = 1, col = c("black", "red", "blue"), legend = names(data)[7:9])
    # As my computer is in French, I have to change the x-ticks labels
    axis(1, 
        at = c(data$complete_date[1], data$complete_date[1440], 
        data$complete_date[2880]), 
        labels = c("Thu", "Fri", "Sat") )
}

# Sending plot to png device
png(filename = "plot3.png",
    width = 480, height = 480, units = "px", bg = NA)

funplot3(1)    

dev.off()

