#This is like cd
setwd('~/Desktop/workshop/data')
#import file
read.csv(file = 'inflammation-01.csv', header = FALSE)
# instead of pwd, R uses:
getwd()
#save the file into a variable data
data <- read.csv(file = 'inflammation-01.csv', header = FALSE)
#look at the top of a dataset
head(data)
#what class of data is this?
class(data)
#How big is the dataset?
dim(data)
#Go into data and take out the first row and first column
data[1,1]
data[30,20]

1:4
#Get the rows 5-10 and columns 1-10 in a dataset
data[5:10, 1:10]

#We want rows 1,3,5 and columns 2,4,6
data[c(1,3,5),c(2,4,6)]
#Get all the first row
data[1,]
#Get just the 16th column
data[,16]


patient_1 <- data[1,]

#find the maximum value
max(patient_1)
#Find the minimum value
min(patient_1)
#can also do other statistics
mean(as.numeric(patient_1))
#as.numeric gives a list of numbers instead of a dataframe
#for all the patients, what's the median inflammation on day 7?
median(data[,7])
sd(data[,7])
#All the statistical information of a dataset
summary(data)
summary(data[,1:4])

#apply towards rows 1 for rows, 2 for columns
avg_patient_inflammation <- apply(data, 1, mean)
avg_patient_inflammation

avg_day_inflammation <- apply(data, 2, mean)
avg_day_inflammation

#slicing
animal <- c("m", "o", "n", "k", "e", "y")
animal[1:3]
animal[4:6]
#reverse order
animal[4:1]
#removing
animal[-1]
animal[-4]
#remove 1:4
animal[-1:-4]
#create eon
new <- c(animal[5], animal[2], animal[3])
new1 <- animal[c(5,2,3)]
new1 <- animal[c(5,2:3)]
new1
new
#For patient 5 maximum inflammation for days 3-7
max(data[5, 3:7])
#first 5 days is messed up and check patients
whichpatients <- seq(2,40,2)
whichdays <- c(1:5)
data2 <- data
data2[whichdays, ]

#plotting

plot(avg_day_inflammation)

max_day_inflammation <- apply(data, 2, max)
plot(max_day_inflammation)

min_day_inflammation <- apply(data, 2, min)
plot(min_day_inflammation)
#You can also do the same plot without making a variable
plot(apply(data,2,min))
#Plot standard deviation of inflammation for each day across all patients
plot(apply(data, 2, sd))


