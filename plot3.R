# read column names and 1st row
firstrow <-  read.table('household_power_consumption.txt',header=TRUE,sep=';',nrows=1)
# skip 66636 rows to start reading total 2880 rows of data from Feb 1, 2007 00:00:00 to Feb 2, 2007 23:59:00 
hpc <- read.table('household_power_consumption.txt',header=TRUE,sep=';',na.strings="?", skip=66636,nrows=2880)
# correct the column names with the ones read from data file
names(hpc) <- names(firstrow)

png(filename = "plot3.png", width = 480, height = 480)

# I used index for X axis in the plot instead of datetime. This simplification 
# is equivalent to using converted datetime because our data is regularly one 
# minute apart and in increasing order of datetime

plot(hpc$Sub_metering_1,typ='l',ylab="Energy sub metering", xlab="", xaxt='n')
lines(x=seq(1,2880),y=hpc$Sub_metering_2, col='red')
lines(x=seq(1,2880),y=hpc$Sub_metering_3, col='blue')
legend('topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty=rep(1,3), col=c('black','red','blue'))

# match X axis ticks with the reasoning that Thu starts at the 1st row, Fri starts at 1441st row, 
# and Sat starts at 2881st row, which would not require any conversion on Date and Time. 

axis(1, at=c(1,1441,2881),labels=c('Thu','Fri','Sat'))

dev.off()