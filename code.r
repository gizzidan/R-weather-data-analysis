abc <- read.csv('ABCWeather.csv')
klm <- read.csv('KLMWeather.csv')
pqr <- read.csv('PQRWeather.csv')
xyz <- read.csv2('XYZWeather.txt') # must use csv2 because it's a .txt file separated by ';'

# ABC
abc$TemperatureC = abc$TemperatureC-32*(5/9) # convert to F
colnames(abc) <- c("Year", "Month", "Day", "TimeCST", "TemperatureF", "Wind.SpeedMPH") # clean up names
abc$Wind.SpeedMPH <- as.numeric(as.character(abc$Wind.SpeedMPH)) # remove "Calm"
abc$TemperatureF[which(abc$TemperatureF < -50)] = NA # remove outlier temps
abc$Wind.SpeedMPH[which(abc$Wind.SpeedMPH < 0)] = NA # remove outlier speeds

#KLM
klm = data.frame(klm$Year, klm$Month, klm$Day, klm$TimeCST, klm$TemperatureF, klm$Wind.SpeedMPH) # Reorder
colnames(klm) <- c("Year", "Month", "Day", "TimeCST", "TemperatureF", "Wind.SpeedMPH") # clean up names
klm$Wind.SpeedMPH <- as.numeric(as.character(klm$Wind.SpeedMPH)) # remove "Calm"
klm$TemperatureF[which(klm$TemperatureF < -50)] = NA # remove outlier temps
klm$Wind.SpeedMPH[which(klm$Wind.SpeedMPH < 0)] = NA # remove outlier speeds

#PQR
pqr = data.frame(pqr$Year, pqr$Month, pqr$Day, pqr$TimeCST, pqr$TemperatureF, pqr$Wind.SpeedKPH)
colnames(pqr) <- c("Year", "Month", "Day", "TimeCST", "TemperatureF", "Wind.SpeedMPH") # clean up names
pqr$Wind.SpeedMPH = pqr$Wind.SpeedMPH*0.621371 # convert to MPH
pqr$TemperatureF[which(pqr$TemperatureF < -50)] = NA # remove outlier temps
pqr$Wind.SpeedMPH[which(pqr$Wind.SpeedMPH < 0)] = NA # remove outlier speeds

#XYZ
head(xyz)
xyz$Wind.SpeedMPH <- as.numeric(as.character(xyz$Wind.SpeedMPH)) # remove "Calm"
xyz$TemperatureF <- as.numeric(as.character(xyz$TemperatureF)) # change Temperature to numeric
xyz$TemperatureF[which(xyz$TemperatureF < -50)] = NA # remove outlier temps
xyz$Wind.SpeedMPH[which(xyz$Wind.SpeedMPH < 0)] = NA # remove outlier speeds

mean(abc$Wind.SpeedMPH[which(abc$Year == 2006 & abc$Month == 3)], na.rm=T) #abc mean wind speed March, 2006
mean(klm$Wind.SpeedMPH[which(klm$Year == 2006 & klm$Month == 3)], na.rm=T) #klm mean wind speed March, 2006
mean(pqr$Wind.SpeedMPH[which(pqr$Year == 2006 & pqr$Month == 3)], na.rm=T) #pqr mean wind speed March, 2006
mean(xyz$Wind.SpeedMPH[which(xyz$Year == 2006 & xyz$Month == 3)], na.rm=T) #xyz mean wind speed March, 2006

mean(abc$TemperatureF[which(abc$Year == 2006)], na.rm=T) #abc mean temp 2006
mean(klm$TemperatureF[which(klm$Year == 2006)], na.rm=T) #klm mean temp 2006
mean(pqr$TemperatureF[which(pqr$Year == 2006)], na.rm=T) #pqr mean temp 2006
mean(xyz$TemperatureF[which(xyz$Year == 2006)], na.rm=T) #xyz mean temp 2006
