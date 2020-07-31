library(tidyverse)

## Load Data
household_power_consumption <- read.csv("~/ExData_Plotting1/Data/household_power_consumption.txt", sep=";", na.strings="?")

# Encontrar el marco de datos de interés - Find the data frame of interest
data04 <- household_power_consumption %>% filter(Date == "1/2/2007")
data05 <- household_power_consumption %>% filter(Date == "2/2/2007")

# Extrae el marco de datos de los dias 1 y 2 de febrero - Extract the data frame of February 1 and 2
data01 <- household_power_consumption[household_power_consumption$Date=="1/2/2007",]
data02 <- household_power_consumption[household_power_consumption$Date=="2/2/2007",]

# Numero de inicio y final del marco de dados de interés 66637 69516 - Number of beginning and end of the data frame of interest 66637 69516
myData <- household_power_consumption %>% slice(66637:69516)

# Unir dos columnas de fecha y tiempo - Join two columns of date and time
myData$DateTime <- paste(myData$Date, myData$Time)

# Converitr tiempo en formato tiempo - Convert time to R time format
myData$DateTime <- as.POSIXct(myData$DateTime, format="%d/%m/%Y %H:%M:%S", tz=Sys.timezone())

# ------------------ Dibujo de los datos
# Dibujo multiples lineas - Multiple line drawing
par(mar = c(4, 4, 2, 1), cex = 0.75)
with(myData,{
  plot(myData$Sub_metering_1 , type = "l", xlab = "", ylab = "Energy Sub Metering")
  lines(myData$Sub_metering_2, type = "l", col = "red")
  lines(myData$Sub_metering_3, type = "l", col = "blue")
  # Dibujo del leyenda - Drawing of the legend
  legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"))
})
dev.copy(png, file = "~/ExData_Plotting1/plot3.png", width = 480, height = 480) ## Copy my plot to a PNG file
dev.off()
