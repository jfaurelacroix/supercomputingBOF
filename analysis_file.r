# This is a comment in R. Do not confuse it with a markdown title. 
# Comments aren't going to be executed when running the code
print("This is going to be executed though")

# We'll edit this file to run the analysis.
# Your first job is to remove all comments, write a new series of comments to describe the
# purpose of this file, as well as our names and email addresses for future reference

# Then, we'll load the data file
# Because we'll both be working from our respective computers, set your working
# directory from the Rstudio menu 
# session -> set working directory -> to source file location
data2026 <- read.csv("./data_sca_2026.csv")
str(data2026)
library(tidyverse)
# data2026 seems to have been deleted
# uploaded and linked the new fake_hpc_events.csv file; presuming this is the file to work on 
# ran new .csv file first - couldn't str it without running .csv
# always remember to setwd before starting to work on file
# str structure for object
fake_hpc_events <- read.csv("./fake_hpc_events.csv")
str(fake_hpc_events)
head(fake_hpc_events)
# unique - unique input displayed
unique(fake_hpc_events$funding_guaranteed)
# names - column titles
names(fake_hpc_events)
# tapply to select certain variables and FUN (function) unique
tapply(fake_hpc_events$country,fake_hpc_events$event,FUN = unique)
# ? for query about waht the function is
?tapply
