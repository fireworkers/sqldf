setwd("~/Desktop/workshop")

analyze <- function(filename) {
  # Plots the average, min, and max inflammation over time.
  # Input is character string of a csv file.
  dat <- read.csv(file = filename, header = FALSE)
  avg_day_inflammation <- apply(dat, 2, mean)
  plot(avg_day_inflammation)
  max_day_inflammation <- apply(dat, 2, max)
  plot(max_day_inflammation)
  min_day_inflammation <- apply(dat, 2, min)
  plot(min_day_inflammation)
}

analyze("data/inflammation-01.csv")
analyze("data/inflammation-02.csv")


best_practice <- c("Let", "the", "computer", "do", "the", "work")

print_words <- function(sentence) {
  print(sentence[1])
  print(sentence[2])
  print(sentence[3])
  print(sentence[4])
  print(sentence[5])
  print(sentence[6])
}

print_words(best_practice)

print_words(best_practice[-6])

#NA missing variables or not available

print_words <- function(sentence){
  for (word in sentence) {
    print(word)
  }
}

print_words(best_practice)
print_words(best_practice[-6])







#printing natural numbers
print_N <- function(num){
  N=seq(num)
  for (i in N) {
    print(i)
  }
}

print_N(5)

#summing values
total <- function(var){
  y <- 0
  for (i in var){
    y <- y+i
  }
  return(y)
}

ex_vec <- c(4, 8, 15, 16, 23, 42)

total(ex_vec)

#creating exponential values
expo <- function( x, y) {
  result <- 1
  for (i in seq(y)){
    result <- result*x
  }
  return(result)
}

expo(2,4)


list.files(path= "data", pattern="csv")
list.files(path="data", pattern="inflammation")
list.files(path="data", pattern ="csv", full.names=TRUE)


#analyze and print multiple files
filenames=list.files(path="data", pattern ="inflammation", full.names=TRUE)
filenames <- filenames[1:3]
for (f in filenames){
  print(f)
  analyze(f)
}

#clear plots
plot.new()

analyze_all <- function(fpattern){
  # Runs the function analyze for each file in the current working directory
  # that contains the given pattern.
  filenames=list.files(path="data", pattern= fpattern, full.names=TRUE)
  for (f in filenames){
    analyze(f)
  }
}

analyze_all("inflammation")



