################################################################################
### Analysis of the HPC data related to BoF and ASC meetings over the years ####
### as of 2026-03-26, the data is all fake but will be populated with real  ####
### data as we survey people                                                ####
### ############################################################################

# Currently working with a fake dataset
data2026 <- read.csv("./fake_hpc_events.csv")

# required packages
library(tm)
library(tidytext)
library(wordcloud)
library(tidyverse)