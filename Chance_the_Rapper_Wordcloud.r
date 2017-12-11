library(tidytext)
library(dplyr)
library(ggplot2)
library(wordcloud)
library(tm)

chance_cb<-scan('chance_coloringbook.txt',what=character(),sep='\n')
head(chance_cb)

chance_cb<-data_frame(line=1:1038, text=chance_cb)

chance_words<-chance_cb%>%
  unnest_tokens(word, text)

chance_words<-chance_words%>%
  filter(!(word %in% stop_words$word))
print(chance_words,n=100)

chance_word_freq<-chance_words%>%
  group_by(word)%>%
  summarize(count=n())
chance_word_freq

wordcloud(chance_word_freq$word, chance_word_freq$count, min.freq=5)
