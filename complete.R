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