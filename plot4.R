# Using data loaded by plot1.R

#-------------------------------------------------------------------------------
# Get libraries
library(lubridate)
library(dplyr)

# Make plot3
#-------------------------------------------------------------------------------

funsubplots <- function(y) {
    plot(data[,"complete_date"], data[,y], 
        type = "l", xaxt = "n",
        xlab = "datetime", ylab = y)
        # As my computer is in French, I have to change the x-ticks labels
    axis(1, 
        at = c(data$complete_date[1], data$complete_date[1440], 
        data$complete_date[2880]), 
        labels = c("Thu", "Fri", "Sat") )
}

png(filename = "plot4.png",
    width = 480, height = 480, units = "px", bg = NA)

par(mfcol = c(2, 2), bg = NA)
funplot2()
funplot3(0)
funsubplots("Voltage")
funsubplots("Global_reactive_power")

dev.off()

