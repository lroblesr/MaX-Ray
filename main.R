# It runs the first time
# install.packages("tools", dep = TRUE)

library(tools)

# List of all files
path_files <- list.files("data", full.names = TRUE)
files_names <- list.files("data")
dir_names <- file_path_sans_ext(files_names)

# function to convert string to numeric
str2num <- function(x) {
  xx <- lapply(x, as.numeric)
  return(xx)
}

id <- c(paste0('0', 1:9), 10)

for (i in 1:length(files_names)) {
  # i <- 1
  # Read a txt file. and  delete the first two lines.
  my_data <- read.delim(path_files[i], header = FALSE)[-c(1:2), ]
  # head(my_data)
  # sapply(my_data, class)

  # Search for the row containing 114 and 119
  idx_114 <- which(my_data[, 1] == 114)
  # head(idx_114)
  idx_119 <- which(my_data[, 1] == 119)
  # head(idx_119)

  # name to save independent data
  name_save <- paste0('output/', dir_names[i], '_dato_', id, '.txt')

  # Split the data
  for (i in 1:10) {
    tmp <- my_data[idx_114[i]:idx_119[i], ]
    tmp <- str2num(tmp)
    write.table(tmp, file = name_save[i], col.names = FALSE, row.names = FALSE)
  }
}
