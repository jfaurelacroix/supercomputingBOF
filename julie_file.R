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
library(tidyverse)

# initial exploration
head(data2026)
str(data2026)
names(data2026)
# "event"                 "date"                  "country"               "user"                  "funding_guaranteed"    "important_factor"      "top_three_metrics"    
# "fees"                  "waste_monitoring"      "waste_mitigation"      "management_automation" "year"

# countries surveyed by event
tapply(data2026$country, data2026$event, FUN=unique)

# number of submitted responses per event
tapply(data2026$user, data2026$event, FUN=max)

# countries surveyed by year
data2026$year <- year(data2026$date)
tapply(data2026$country, data2026$year, FUN=unique)

# number of submitted responses per year
tapply(data2026$user, data2026$year, FUN=length)

# is funding generally guaranteed
ggplot(data = data2026, aes(funding_guaranteed)) +
  geom_bar()

# is funding guaranteed every year
ggplot(data = data2026, aes(x = factor(year), y = user, fill = factor(funding_guaranteed))) +
  geom_col(position = "dodge") +
  labs(x = "Year", y = "Numbers of votes", fill = "Is Funding Guaranteed")

# factors in order of importance
ggplot(data = data2026, aes(important_factor)) +
  geom_bar()

# factors over the years
# is funding guaranteed every year
ggplot(data = data2026, aes(x = factor(year), y = user, fill = factor(important_factor))) +
  geom_col(position = "dodge") +
  labs(x = "Year", y = "Numbers of votes", fill = "Factors")

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

# 3 most popular metrics
head(words, n=3)

# word cloud per year

# do countries charge for service
ggplot(data = data2026, aes(x = factor(country),fill = factor(fees))) +
  geom_bar() +
  labs(x = "Country", y = "Numbers of votes", fill = "fees")

# do people monitor waste
ggplot(data = data2026, aes(x = factor(country),fill = factor(waste_monitoring))) +
  geom_bar(position = "dodge") +
  labs(x = "Country", y = "Numbers of votes", fill = "waste_monitoring")

# how do people mitigate waste
ggplot(data = data2026, aes(x = factor(country),fill = factor(waste_mitigation))) +
  geom_bar() +
  labs(x = "Country", y = "Numbers of votes", fill = "waste_mitigation")

# is waste management automated
ggplot(data = data2026, aes(x = factor(country),fill = factor(management_automation))) +
  geom_bar() +
  labs(x = "Country", y = "Numbers of votes", fill = "management_automation")

# do people who charge monitor waste
ggplot(data = data2026, aes(x = factor(fees),y = factor(waste_monitoring))) +
  geom_jitter(width = 0.1, height = 0.1)+
  labs(x = "Charging model", y = "Waste monitoring")
  
# how do people mitigate waste according to their fees
ggplot(data = data2026, aes(x = factor(fees),y = factor(waste_mitigation))) +
  geom_jitter(width = 0.1, height = 0.1)+
  labs(x = "Charging model", y = "Waste mitigation")
