## General (table-reading) part
dTab<-read.table(file="i:\\CourserA\\DATA_SCIENCE\\04_Exploratoty_research\\Wk1\\household_power_consumption.txt",
          header = FALSE, sep=";",
          colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),
          col.names = c("Date","Time","Gl_act_power","Gl_react_power","Voltage","Gl_intensity","Sub_met1","Sub_met2","Sub_met3"),
          numerals="no.loss",
          nrows=2*24*60, skip = 66637)
dTab$Date<-as.Date(dTab$Date, "%d/%m/%Y")
dTab$Time<-as.POSIXct(strptime(paste(dTab$Date,dTab$Time),"%Y-%m-%d %H:%M:%S"))

## Plotting part
png(file="i:\\CourserA\\_RStudio_WorkingDir\\1\\plot1.png", width = 400, height = 400)

hist(dTab$Gl_act_power, breaks=12, col = "red", main="Global active power", 
     xlab="Global active power (kilowatts)",xlim=c(0,6),ylim=c(0,1400))

dev.off()