# This R session has two parts - R training and data analysis. 
# The objective of the R training session is the familiarization with R Studio, its functions and code.
# The objective of the data analysis is to apply what has been learned in R Studio to analysis data on reporting funding metrics from around the world and present this results at relevant platforms.
# The project is authored by Julie Faure-Lacroix (CalculQuebec) and Eugene Low (NSCC)
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

tapply(fake_hpc_events$event,fake_hpc_events$country,FUN = unique)
# ? for query about waht the function is
?tapply

# use tapply to give the number of submitted responses per event
fake_hpc_events <- read.csv("./fake_hpc_events.csv")
str(fake_hpc_events)
# I could use FUN=unique but what if i tried number / numeric? 
tapply(fake_hpc_events$event,FUN = numeric) 
# no dice, FUN=unique it is  
tapply(fake_hpc_events$event,FUN = unique.numeric_version)
# no dice too; even tried unique.numeric... and some of the others below
unique(fake_hpc_events$event,sum)
tapply(fake_hpc_events$event,FUN = integer)
tapply(fake_hpc_events$event,FUN = NULL,sum(unique))
str(fake_hpc_events)
tapply(fake_hpc_events$event,FUN = length) 
# had to find out from Google to include X, INDEX and function but why would you need INDEX if X is the same?
tapply(fake_hpc_events$event,fake_hpc_events$event, length)

# use tapply to give the number of submitted responses per year
# below are numbers by date but not by year
tapply(fake_hpc_events$event,fake_hpc_events$date, length)
# attempts at sorting number of responses by year
tapply(fake_hpc_events$date,fake_hpc_events$date,FUN = length)
tapply(fake_hpc_events$date,length, FUN = range.Date(2026, 2025))
tapply(fake_hpc_events$date,fake_hpc_events$date,FUN = Year)
tapply(fake_hpc_events$date,fake_hpc_events$date,length)
tapply(fake_hpc_events$date,fake_hpc_events$date,FUN = merge(2025, 2026),length)
tapply(fake_hpc_events$date,format(fake_hpc_events$date,"%Y"),length)
library(tidyverse)
fake_hpc_events$year <- year(fake_hpc_events$date)
fake_hpc_events$year
tapply(fake_hpc_events$year,fake_hpc_events$year,length)

# Figure out a way to find the number of submitted responses per year 
# Use tapply and year() but without creating a new column
x <- ymd("2026-01-26")
year(x) <- 2026
tapply(fake_hpc_events$date,year(2026),length)
fake_hpc_events$date <- ymd("2026-01-26")

year(fake_hpc_events$date) <- 2026
year(fake_hpc_events$date) <- 2027
tapply(fake_hpc_events$date,year(ymd),length)

date_vector <- c("2026-01-26","2026-06-11","2026-11-15","2027-03-12","2027-06-08")
dates <- as.Date(date_vector)
tapply(fake_hpc_events$date,year(dates),length)
tapply(fake_hpc_events$event,year(dates),length)
tapply(fake_hpc_events$date,year(ymd(df$date_string)),length)
tapply(fake_hpc_events$date,year(ymd(fake_hpc_events$date)),length)
