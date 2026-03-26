# Julie's version of the analysis file
################################################################################
### Analysis of the HPC data related to BoF and ASC meetings over the years ####
### as of 2026-03-26, the data is all fake but will be populated with real  ####
### data as we survey people                                                ####
### ############################################################################
setwd("C:\Users\steak\OneDrive - Université Laval\GitHub\supercomputingBOF")

data2026 <- read.csv("./fake_hpc_events.csv")

library(tm)
library(tidytext)
library(wordcloud)

head(data2026)
str(data2026)

text <- data2026$top_three_metrics
docs <- Corpus(VectorSource(text))
dtm <- TermDocumentMatrix(docs)
matrix <- as.matrix(dtm) 
words <- sort(rowSums(matrix),decreasing=TRUE) 
df <- data.frame(word = names(words),freq=words)
metric_words <-  data2026 %>%
  select(top_three_metrics) %>%
  unnest_tokens(word, top_three_metrics)
words <- metric_words %>% count(word, sort=TRUE)
set.seed(1234) # for reproducibility
wordcloud(words = df$word, freq = df$freq, min.freq = 1,
          max.words=200, random.order=FALSE, rot.per=0.35,
          colors=brewer.pal(8, "Dark2"))
