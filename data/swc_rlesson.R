

setwd("~/Desktop/workshop/data")

fahr_to_kelvin <- function(temp){
  kelvin <- ((temp-32)* (5/9)) +273.15
  return(kelvin)
}
#Freezing point of water
fahr_to_kelvin(32)
#Boiling point of water
fahr_to_kelvin(212)

kelvin_to_celsius <- function(temp){
  celsius <- temp - 273.15
  return(celsius)
}

#Absolute 0
kelvin_to_celsius(0)

fahr_to_celsius <- function(temp){
  temp_k <- fahr_to_kelvin(temp)
  result <- kelvin_to_celsius(temp_k)
  return(result)
}

fahr_to_celsius(32)
fahr_to_celsius(212)

#Nesting functions

kelvin_to_celsius(fahr_to_kelvin(32))

kelvin_to_celsius(fahr_to_kelvin(212))

#Practicing functions
fence <- function(original, wrapper){
  new <- c(wrapper, original, wrapper)
  return(new)
}

best_practice <- c("Write", "programs", "for", "people", "not", "computers")
asterisk <- "***"
fence(best_practice, asterisk)

outside <- function(vector){
  return(c(vector[1],vector[length(vector)]))
}

dry_principle <- c("Don't", "repeat", "yourself", "or", "others")
outside(dry_principle)

#have a dataset, data, with a mean and shift it to a new desired mean
center <- function(data, desired){
  #centers data to the desired mean value
  #
  #Parameters
  #-----------
  #data : vector of numbers
  #desired: number, new mean we want to center to
  #
  #Returns
  #----------
  #: vector of centered data
  #
  #Examples
  #----------
  #data=1:10
  #center(data,5)
  
  
  new_data <- (data-mean(data)) + desired
  return(new_data)
}

#Test the validity of the function
z <- c(1,1,1,1)
center(z, 3)

dat <- read.csv("inflammation-01.csv", header=FALSE)
centered <-center(dat[,4], 0)
head(centered)

min(dat[,4])
max(dat[,4])
mean(dat[,4])

min(centered)
max(centered)
mean(centered)

sd(dat[,4])
sd(centered)


#Making functions again
analyze <- function(file){
  #plots the mean,max,min of a file for the column
  #
  #Parameters
  #-----
  #file = filename to plot
  
  data <- read.csv(file, header=FALSE)
  plot(apply(data, 2, mean))
  plot(apply(data, 2, max))
  plot(apply(data, 2, min))
}

#Testing of function
analyze('inflammation-01.csv')




