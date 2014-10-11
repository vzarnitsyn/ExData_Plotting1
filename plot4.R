library(sqliter)
library(sqldf)
setwd("C:/Coursera/ExpDataAnalysis/Project_1")
myfile<-"household_power_consumption.txt"
mySql<-"SELECT * from file WHERE Date='1/2/2007' OR date='2/2/2007'"
myData<-read.csv.sql(myfile,mySql,header=TRUE,sep=";")
Dtime<-strptime(paste(myData$Date,myData$Time),"%d/%m/%Y %H:%M:%OS")
png("plot4.png",bg="transparent")
par(mfrow=c(2,2))
#graph1
hist(myData$Global_active_power,xlab="Global Active Power (kilowatts)",col="red")
#graph2
plot(Dtime,myData$Global_active_power,type="n",ylab="Global Active Power (kilowatts)",xlab="")
lines(Dtime,myData$Global_active_power)
#graph3
plot(Dtime,myData$Sub_metering_1,type="n",ylab="Energy sub metering",xlab="")
lines(Dtime,myData$Sub_metering_1,col="black")
lines(Dtime,myData$Sub_metering_2,col="red")
lines(Dtime,myData$Sub_metering_3,col="blue")
legend("topright",bty="n",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()