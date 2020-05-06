# Capture RA pressure cell that has 3 numbers
  # Max number = systolic
  # Min = diastolic
  # Mean = in between

cell <- "22/28/21"

extract_RA_numbers <- function(cell) {
  
  # Take cell and convert into numbers
  l <- 
    str_split(cell, "/") %>%
    unlist(l) %>%
    as.numeric()
  
  # Data to pull out
  rap <- list()
  rap["sys"] <- max(l)
  rap["dia"] <- min(l)
  
  rap["mean"] <- l[l != rap$sys & l != rap$dia]
  
  # Return
  return(rap)
}
