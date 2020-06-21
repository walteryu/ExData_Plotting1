# JHU-DSCI EDA
# Assignment: Project 1
# Filename: plot4.R
# Name: Walter Yu
# Date: June 2020

# Notes: 
# 1. all code included to show data import, plot and export to png
# 2. full dataset was imported, then filtered by date
# 3. plot made with single function call

# sources:
# https://bookdown.org/rdpeng/rprogdatascience/getting-data-in-and-out-of-r.html
# https://www.coursera.org/learn/exploratory-data-analysis/discussions/weeks/1/threads/2M337rTnEeWHMgod_NjFNw
# data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

# subset data by date
# source: https://stackoverflow.com/questions/4935479/how-to-combine-multiple-conditions-to-subset-a-data-frame-using-or
data_feb <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")

# combine date/time for continuous line plot
# source: https://www.coursera.org/learn/exploratory-data-analysis/discussions/weeks/1/threads/2tnkfMoIEeWwyg7SJZ3bgQ
data_feb$plot_date <- strptime(paste(data_feb$Date, data_feb$Time), format="%d/%m/%Y %H:%M:%S")

# verify data import
# print(names(data_feb))
# print(head(data_feb))

# source: code from swirl eda modules 1-5
# line plot: http://www.sthda.com/english/wiki/generic-plot-types-in-r-software
dev.cur()

# use par function to set grid and margins
# source: code from swirl eda modules 1-5
par(mfrow = c(2, 2), mar =c(4, 4, 2, 1), oma = c(0, 0, 2, 0))

# plot 1 of 4: upper-left
# source: plot 2, single line plot
plot(data_feb$plot_date, data_feb$Global_active_power, type="l", ylab="Global Active Power", xlab="")

# plot 2 of 4: upper-right
# source: plot 2, single line plot (voltage)
plot(data_feb$plot_date, data_feb$Voltage, type="l", ylab="Voltage", xlab="datetime")

# plot 3 of 4: lower-left
# source: plot 3, multiple line plot
# multiple lines: http://www.countbio.com/web_pages/left_object/R_for_biology/R_fundamentals/multiple_curves_R.html
plot(data_feb$plot_date, data_feb$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(data_feb$plot_date, data_feb$Sub_metering_2, type="l", ylab="Energy sub metering", xlab="", col="red")
lines(data_feb$plot_date, data_feb$Sub_metering_3, type="l", ylab="Energy sub metering", xlab="", col="blue")
# source: code from swirl eda modules 1-5
# resize legend: https://www.coursera.org/learn/exploratory-data-analysis/discussions/weeks/1/threads/9ejiaiTwEea_6Q5JzpBVwQ
legend("topright", col=c("black", "blue", "red"), lty=c(1,1,1), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.5)

# plot 4 of 4: lower-right
# source: plot 2, single line plot (global reactive power)
plot(data_feb$plot_date, data_feb$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="")

dev.copy(png, file="plot4.png")
dev.off()
