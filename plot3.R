#read in csv file
data<-read.csv("/home/andre/coursera/4_Exploratory_Data_Analysis/ExData_Plotting1/household_power_consumption.txt",
               head=TRUE,sep=";",colClasses=c("Global_active_power"="double"),na.strings="?")

#convert date Column to type Date
data$Date<-as.Date(data$Date,"%d/%m/%Y")

#subset the dates 2007-02-01 and 2007-02-02
data<-subset(data,Date==as.Date("2007-02-01")|Date==as.Date("2007-02-02"))

#create Datetime columns
library(lubridate)
data$Datetime<-data$Date+hms(data$Time)

#set locale to english for correct date labels
Sys.setlocale(category = "LC_ALL", locale = "en_US.utf8")

#open png device
png(filename="plot3.png",width=480,height=480)

#plot Enegy sub metering  during the hours of the days 2007-02-01 and 2007-02-02
plot(data$Datetime,data$Sub_metering_1,'l',xlab="",ylab="Energie sub metering")
lines(data$Datetime,data$Sub_metering_2,col="red")
lines(data$Datetime,data$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))

#close png device
dev.off()