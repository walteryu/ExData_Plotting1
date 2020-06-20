# JHU-DSCI EDA
# Assignment: Project 1
# Filename: plot1.R
# Name: Walter Yu
# Date: June 2020

setwd("C:/Users/kharm/Documents/R/jhu_dsci/04_eda/ExData_Plotting1")

# Notes: 
# 1. all code included to show data import, plot and export to png

# source: https://bookdown.org/rdpeng/rprogdatascience/getting-data-in-and-out-of-r.html
# rows_10 <- read.table("household_power_consumption.txt", nrows=10)
# classes  <- sapply(rows_10, class)
# print(classes)

# source: https://bookdown.org/rdpeng/rprogdatascience/getting-data-in-and-out-of-r.html
data <- read.table("household_power_consumption.txt")