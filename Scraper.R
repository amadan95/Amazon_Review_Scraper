Library(Rvest)
library(dplyr)
library(stringr)
library(tidyverse)



Scrape Review date, title, rating, and comments from the first 10 pages of any amazon product or app

Amazon.list <- lapply(paste0('##### Amazon App Review Page URL #####', 1:10),
                    function(url){
                      url %>% read_html() %>% 
                        html_nodes(".review-date,.rating-other-user-rating,.title,.show-more__control") %>% 
                        html_text() %>%
                        gsub('[\r\n\t]', '', .)
                      
                })
                
Amazon_Reviews <- unlist(Amazon.list)


#export to csv
write.csv(Amazon_reviews,file='Amazon_Reviews.csv'
