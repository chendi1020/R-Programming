#coursera R programming Assignment 1

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
#test
#pollutantmean("specdata", "nitrate", 70:72)


#Part 2
complete <- function(directory, id = 1:332) {
  list <- paste("H:/R/cousera/ASSIGN1",directory, dir(directory), sep = "/")
  vec <- vector()
  for (i in id) {
    cur_file <-read.csv(list[i], header=T)
    
    comp_case <- nrow(na.omit(cur_file))
    vec <- c(vec, comp_case)
    
  }
  return(data.frame(id=id, nobs=vec))

}

#test
#complete("specdata", c(2, 4, 8, 10, 12))
#complete("specdata", 331)
#complete("specdata", 30:25)

#part 3

corr <- function(directory, threshold = 0) {
  list <- paste("H:/R/cousera/ASSIGN1",directory, dir(directory), sep = "/")
  vec <- vector()
  for (i in 1:332) {
    cur_file <-read.csv(list[i], header=T)
    comp_case <- nrow(na.omit(cur_file))
    if (comp_case > threshold) {
        ver_data <- na.omit(cur_file)
        corelation <- cor(ver_data$sulfate, ver_data$nitrate)
        vec <- c(vec,corelation)
    } 
  
  }
  return(vec)
  
}

#test
#cr <- corr("specdata",5000)
#length(cr)
#cr <- corr("specdata")
#summary(cr)
#length(cr)

