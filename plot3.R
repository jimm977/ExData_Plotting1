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
png(file="i:\\CourserA\\_RStudio_WorkingDir\\1\\plot3.png", width = 400, height = 400)

plot(dTab$Time, dTab$Sub_met1, type="l", xlab="", ylab="Energy sub metering")
lines(dTab$Time, dTab$Sub_met2, col="red")
lines(dTab$Time, dTab$Sub_met3, col="blue")
legend('topright',legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),
       lty = c(1,1,1))


dev.off()