firstrow <-  read.table('household_power_consumption.txt',header=TRUE,sep=';',nrows=1)
hpc <- read.table('household_power_consumption.txt',header=TRUE,sep=';',na.strings="?", skip=66636,nrows=2880)
names(hpc) <- names(firstrow)

png(filename = "plot1.png", width = 480, height = 480)
with(hpc, hist(hpc$Global_active_power,xlab="Global Active Power (kilowatts)", main="Global Active Power", col='red'))
dev.off()