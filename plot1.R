# read column names and 1st row
firstrow <-  read.table('household_power_consumption.txt',header=TRUE,sep=';',nrows=1)
# skip 66636 rows to start reading total 2880 rows of data from Feb 1, 2007 00:00:00 to Feb 2, 2007 23:59:00 
hpc <- read.table('household_power_consumption.txt',header=TRUE,sep=';',na.strings="?", skip=66636,nrows=2880)
# correct the column names with the ones read from data file
names(hpc) <- names(firstrow)

png(filename = "plot1.png", width = 480, height = 480)

with(hpc, hist(hpc$Global_active_power,xlab="Global Active Power (kilowatts)", main="Global Active Power", col='red'))

dev.off()