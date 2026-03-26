# Julie's version of the analysis file
################################################################################
### Analysis of the HPC data related to BoF and ASC meetings over the years ####
### as of 2026-03-26, the data is all fake but will be populated with real  ####
### data as we survey people                                                ####
### ############################################################################
setwd("C:\Users\steak\OneDrive - Université Laval\GitHub\supercomputingBOF")
# loading fake dataset
data2026 <- read.csv("./fake_hpc_events.csv")

# required packages
library(tm)
library(tidytext)
library(wordcloud)

# initial exploration
head(data2026)
str(data2026)

# word cloud example
metricstext <- data2026$top_three_metrics
corpuswords <- Corpus(VectorSource(metricstext))
tdmx <- TermDocumentMatrix(corpuswords)
wordmatrix <- as.matrix(tdmx) 
wordcount <- sort(rowSums(wordmatrix),decreasing=TRUE) 
wordfrequency <- data.frame(word = names(wordcount),freq=wordcount)
metric_words <-  data2026 %>%
  select(top_three_metrics) %>%
  unnest_tokens(word, top_three_metrics)
words <- metric_words %>% count(word, sort=TRUE)
set.seed(1234) # for reproducibility
wordcloud(words = wordfrequency$word, freq = wordfrequency$freq, min.freq = 1,
          max.words=200, random.order=FALSE, rot.per=0.35,
          colors=brewer.pal(8, "Dark2"))
# 