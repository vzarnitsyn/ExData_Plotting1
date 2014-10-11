library(sqliter)
library(sqldf)
setwd("C:/Coursera/ExpDataAnalysis/Project_1")
myfile<-"household_power_consumption.txt"
mySql<-"SELECT Date,Time,Global_active_power from file WHERE Date='1/2/2007' OR date='2/2/2007'"
myData<-read.csv.sql(myfile,mySql,header=TRUE,sep=";")
Dtime<-strptime(paste(myData$Date,myData$Time),"%d/%m/%Y %H:%M:%OS")
png("plot2.png")
plot(Dtime,myData$Global_active_power,type="n",ylab="Global Active Power (kilowatts)",xlab="")
lines(Dtime,myData$Global_active_power)
dev.off()