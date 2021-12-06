data <- read.csv("quiz1_data/hw1_data.csv", header=TRUE)
show(data)
data[1:2,]
summary(data)
nrow(data)
tail(data,2)
data[47,]
sum(is.na(data$Ozone))
mean(data[!is.na(data$Ozone),]$Ozone)
mean(data[!is.na(data$Ozone)&data$Ozone>31&data$Temp>90,]$Solar.R)
mean(data[data$Month==6,]$Temp)
max(data[!is.na(data$Ozone)&data$Month==5,]$Ozone)
