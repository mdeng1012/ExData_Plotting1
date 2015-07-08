firstrow <-  read.table('household_power_consumption.txt',header=TRUE,sep=';',nrows=1)
hpc <- read.table('household_power_consumption.txt',header=TRUE,sep=';',na.strings="?", skip=66636,nrows=2880)
names(hpc) <- names(firstrow)

png(filename = "plot2.png", width = 480, height = 480)
with(hpc, plot(hpc$Global_active_power,typ='l',ylab="Global Active Power (kilowatts)", xlab="", xaxt='n'))
axis(1, at=c(0,1440,2880),labels=c('Thu','Fri','Sat'))
dev.off()