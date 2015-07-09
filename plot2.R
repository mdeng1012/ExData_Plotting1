# read column names and 1st row
firstrow <-  read.table('household_power_consumption.txt',header=TRUE,sep=';',nrows=1)
# skip 66636 rows to start reading total 2880 rows of data from Feb 1, 2007 00:00:00 to Feb 2, 2007 23:59:00 
hpc <- read.table('household_power_consumption.txt',header=TRUE,sep=';',na.strings="?", skip=66636,nrows=2880)
# correct the column names with the ones read from data file
names(hpc) <- names(firstrow)

png(filename = "plot2.png", width = 480, height = 480)

# I used index for X axis in the plot instead of datetime. This simplification 
# is equivalent to using converted datetime because our data is regularly one 
# minute apart and in increasing order of datetime

with(hpc, plot(hpc$Global_active_power,typ='l',ylab="Global Active Power (kilowatts)", xlab="", xaxt='n'))

# match X axis ticks with the reasoning that Thu starts at the 1st row, Fri starts at 1441st row, 
# and Sat starts at 2881st row, which would not require any conversion on Date and Time. 

axis(1, at=c(1,1441,2881),labels=c('Thu','Fri','Sat'))

dev.off()