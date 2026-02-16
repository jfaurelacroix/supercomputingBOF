# This is a comment in R. Do not confuse it with a markdown title. 
# Comments aren't going to be executed when running the code
print("This is going to be executed though")

# We'll edit this file to run the analysis.
# Your first job is to remove all comments, write a new series of comments to describe the
# purpose of this file, as well as our names and email addresses for future reference

# Then, we'll load the data file

data2025 <- read.csv("./data_sca_2025.csv")
print(data2025)