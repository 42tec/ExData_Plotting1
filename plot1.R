#read in csv file
data<-read.csv("/home/andre/coursera/4_Exploratory_Data_Analysis/ExData_Plotting1/household_power_consumption.txt",
               head=TRUE,sep=";",colClasses=c("Global_active_power"="double"),na.strings="?")

#convert date Column to type Date
data$Date<-as.Date(data$Date,"%d/%m/%Y")

#subset the dates 2007-02-01 and 2007-02-02
data<-subset(data,Date==as.Date("2007-02-01")|Date==as.Date("2007-02-02"))

#open png device
png(filename="plot1.png",width=480,height=480)

#plot histogram to png
hist(data$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

#close png device
dev.off()