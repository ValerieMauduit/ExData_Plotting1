# Using data loaded by plot1.R

#-------------------------------------------------------------------------------
# Get libraries
library(lubridate)
library(dplyr)

# Make plot2
#-------------------------------------------------------------------------------
# Creating function to be able to reuse it into a multiplot
funplot2 <- function(){
    plot(data$complete_date, data$Global_active_power, 
        type = "l", xaxt = "n",
        xlab = "", ylab = "Global Active Power (kilowatts)")
    # As my computer is in French, I have to change the x-ticks labels
    axis(1, 
        at = c(data$complete_date[1], data$complete_date[1440], 
        data$complete_date[2880]), 
        labels = c("Thu", "Fri", "Sat") )
}

# Sending plot to png device
png(filename = "plot2.png",
    width = 480, height = 480, units = "px", bg = NA)

funplot2()

dev.off()

