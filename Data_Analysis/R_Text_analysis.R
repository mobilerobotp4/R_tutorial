install.packages("tidyverse")
install.packages("tokenizers")

library(tidyverse)
library(tokenizers)

#Task Set 1
#1. Create a variable called “text” using the following code:
#  text <- paste("You will rejoice to hear that no disaster has accompanied the commencement of an enterprise which you have regarded with such evil forebodings. I arrived here yesterday, and my first task is to assure my dear sister of my welfare and increasing confidence in the success of my undertaking")
#2. Create a variable containing the above text tokenized into words.  (Remember that the tokenizer makes a list of lists)
#3. Find out how long your new list of words is using the length function.
#4. Turn your list of words into a data frame (remember to make it into a table first).
#5. Arrange your data frame so the most common words are listed first.


text <- paste("You will rejoice to hear that no disaster has accompanied the commencement of an enterprise which you have regarded with such evil forebodings. I arrived here yesterday, and my first task is to assure my dear sister of my welfare and increasing confidence in the success of my undertaking")

words <- tokenize_words(text)
words <- words[[1]]
words
#[1] "you"          "will"         "rejoice"      "to"           "hear"        
#[6] "that"         "no"           "disaster"     "has"          "accompanied" 
#[11] "the"          "commencement" "of"           "an"           "enterprise"  
#[16] "which"        "you"          "have"         "regarded"     "with"        
#[21] "such"         "evil"         "forebodings"  "i"            "arrived"     
#[26] "here"         "yesterday"    "and"          "my"           "first"       
#[31] "task"         "is"           "to"           "assure"       "my"          
#[36] "dear"         "sister"       "of"           "my"           "welfare"     
#[41] "and"          "increasing"   "confidence"   "in"           "the"         
#[46] "success"      "of"           "my"           "undertaking"

length(words)
#49

#create a basic table to find out repeated words
tab <- table(words)
tab

#accompanied           an          and      arrived       assure commencement 
#1            1            2            1            1            1 
#confidence         dear     disaster   enterprise         evil        first 
#1            1            1            1            1            1 
#forebodings          has         have         hear         here            i 
#1            1            1            1            1            1 
#in   increasing           is           my           no           of 
#1            1            1            4            1            3 
#regarded      rejoice       sister      success         such         task 
#1            1            1            1            1            1 
#that          the           to  undertaking      welfare        which 
#1            2            2            1            1            1 
#will         with    yesterday          you 
#1            1            1            2 
#The number corresponding to words show how many times the words repeated in the text.

#Table is a onedimensional dataset
#example
tab[4]
#arrived

#creating a dataframe so that we can transfer 1-d table to 2-d
tab <- data_frame(word = names(tab), count = as.numeric(tab))
#40 rows 2 column

tab
# A tibble: 40 x 2
#word         count
#<chr>        <dbl>
#1 accompanied      1
#2 an               1
#3 and              2
#4 arrived          1
#5 assure           1
#6 commencement     1
#7 confidence       1
#8 dear             1
#9 disaster         1
#10 enterprise       1
# … with 30 more rows

#Sort the dataframe
tab <- arrange(tab, desc(count))
tab

#word        count
#<chr>       <dbl>
#1 my              4
#2 of              3
#3 and             2
#4 the             2
#5 to              2
#6 you             2
#7 accompanied     1
#8 an              1
#9 arrived         1
#10 assure          1
# … with 30 more rows

#Task2
#1. Tokenize the paragraph in the “text” variable into sentences and pull out just the list
#2. Tokenize your sentences into lists of words
#3. Use the “sapply” function to find the length of each list of words


#split into individual sentences

sentences <- tokenize_sentences(text)
sentences <- sentences[[1]]
sentences

sen_words <- tokenize_words(sentences)
sen_words

#List of 2
#[[1]]
#[1] "you"          "will"         "rejoice"      "to"           "hear"        
#[6] "that"         "no"           "disaster"     "has"          "accompanied" 
#[11] "the"          "commencement" "of"           "an"           "enterprise"  
#[16] "which"        "you"          "have"         "regarded"     "with"        
#[21] "such"         "evil"         "forebodings" 

#[[2]]
#[1] "i"           "arrived"     "here"        "yesterday"   "and"        
#[6] "my"          "first"       "task"        "is"          "to"         
#[11] "assure"      "my"          "dear"        "sister"      "of"         
#[16] "my"          "welfare"     "and"         "increasing"  "confidence" 
#[21] "in"          "the"         "success"     "of"          "my"         
#[26] "undertaking"

length(sen_words[[1]])
#23

length(sen_words[[2]])
#26

#alternative to find out he length of two list of sen_words
sapply(sen_words, length)
#23 26

#Task Set 3
#1. Use the code below to load in the full text of the book “Frankenstein”.
#text <- paste(readLines("https://raw.githubusercontent.com/BrockDSL/R_for_Text_Analysis/master/frankenstein.txt"),collapse = "\n")
#2. Using your code from before, tokenize the book into words and then turn it into a dataframe arranged by count.
#3. Use the code below to load in the word frequency dataset.
#wordfreq <- read_csv("https://raw.githubusercontent.com/BrockDSL/R_for_Text_Analysis/master/wordfrequency.csv")
#4. Join the two datasets together to get frequency values for each word in the book.
#5. Filter your results to remove the stopwords. (Try out different frequency values to see more or less common words)

text1 <- paste(readLines("https://raw.githubusercontent.com/BrockDSL/R_for_Text_Analysis/master/frankenstein.txt"),collapse = "\n")
text1

words1 <- tokenize_words(text1)
words1 <- words1[[1]]

length(words1)
#75210 words

tab1 <- table(words1)
tab1 <- data_frame(word = names(tab1), count = as.numeric(tab1))
tab1 <- arrange(tab1, desc(count))
tab1

#A tibble: 7,078 x 2
#word  count
#<chr> <dbl>
#1 the    4195
#2 and    2976
#3 i      2846
#4 of     2643
#5 to     2089
#6 my     1776
#7 a      1391
#8 in     1128
#9 was    1021
#10 that   1017
# … with 7,068 more rows

wordfreq <- read_csv("https://raw.githubusercontent.com/BrockDSL/R_for_Text_Analysis/master/wordfrequency.csv")
wordfreq
#A tibble: 150,000 x 3
#language word  frequency
#<chr>    <chr>     <dbl>
#1 en       the       3.93 
#2 en       of        2.24 
#3 en       and       2.21 
#4 en       to        2.06 
#5 en       a         1.54 
#6 en       in        1.44 
#7 en       for       1.01 
#8 en       is        0.800
#9 en       on        0.638
#10 en       that      0.578
# … with 149,990 more rows

tab1 <- inner_join(tab1, wordfreq)
tab1
# A tibble: 6,585 x 4
#word  count language frequency
#<chr> <dbl> <chr>        <dbl>
# 1 the    4195 en           3.93 
#2 and    2976 en           2.21 
#3 i      2846 en           0.525
#4 of     2643 en           2.24 
#5 to     2089 en           2.06 
#6 my     1776 en           0.180
#7 a      1391 en           1.54 
#8 in     1128 en           1.44 
#9 was    1021 en           0.252
#10 that   1017 en           0.578
# … with 6,575 more rows

filter(tab1,frequency <0.01)
# A tibble: 5,721 x 4
#word      count language frequency
#<chr>     <dbl> <chr>        <dbl>
# 1 myself      136 en         0.00646
#2 father      112 en         0.00826
#3 eyes        104 en         0.00816
#4 saw          94 en         0.00825
#5 towards      94 en         0.00626
#6 elizabeth    88 en         0.00427
#7 felt         80 en         0.00567
#8 whom         80 en         0.00488
#9 feelings     76 en         0.00192
#10 dear         72 en         0.00350
# … with 5,711 more rows

#Task Set 4
#1. Make a function that takes in a variable containing text and outputs a dataframe filtered to remove stopwords.
#2. Try out your new function by running on the text variable.


#Function for find out the frequency of the words

top_words <- function(fulltext){
  words <- tokenize_words(fulltext)
  words <- words[[1]]
  tab <- table(words)
  tab <- data_frame(word = names(tab),count = as.numeric(tab))
  tab <- arrange(tab,desc(count))
  wordfreq <- read_csv("https://raw.githubusercontent.com/BrockDSL/R_for_Text_Analysis/master/wordfrequency.csv")
  tab <- inner_join(tab, wordfreq)
  return(filter(tab1,frequency <0.01))
}
 top_words(text1)
 
 # A tibble: 5,721 x 4
 #word      count language frequency
 #<chr>     <dbl> <chr>        <dbl>
 # 1 myself      136 en         0.00646
 #2 father      112 en         0.00826
 #3 eyes        104 en         0.00816
 #4 saw          94 en         0.00825
 #5 towards      94 en         0.00626
 #6 elizabeth    88 en         0.00427
 #7 felt         80 en         0.00567
 #8 whom         80 en         0.00488
 #9 feelings     76 en         0.00192
 #10 dear         72 en         0.00350
 # … with 5,711 more rows
 
 top_words <- function(fulltext,dropfreq){
   words <- tokenize_words(fulltext)
   words <- words[[1]]
   tab <- table(words)
   tab <- data_frame(word = names(tab),count = as.numeric(tab))
   tab <- arrange(tab,desc(count))
   wordfreq <- read_csv("https://raw.githubusercontent.com/BrockDSL/R_for_Text_Analysis/master/wordfrequency.csv")
   tab <- inner_join(tab, wordfreq)
   return(filter(tab1,frequency <dropfreq))
 }
top_words(text1,0.01) 
