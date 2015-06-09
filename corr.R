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