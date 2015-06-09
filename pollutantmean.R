#part1
setwd("H:/R/cousera/ASSIGN1")
pollutantmean <- function (directory, pollutant, id=1:332) {
  #get all files as a list
  list <- paste("H:/R/cousera/ASSIGN1",directory, dir(directory), sep = "/")
  #initiate a vector to hold value
  vals <- vector()
  #loop over the ids
  for (i in id) {
    cur_file <- read.csv(list[i], header=T) #read csvfile one by one via list element index
    d <- cur_file[,pollutant] # create vector by choosing the specific column poullutant
    d <- d[!is.na(d)] #remove the NA from the vector
    vals <- c(vals,d) #add the cur_file (without NA) to the vector (perivous)
  }
  result <- mean(vals)# get mean
  return(round(result, 3))  # return
}