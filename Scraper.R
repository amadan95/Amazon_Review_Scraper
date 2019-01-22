Date <- lapply(paste0('https://www.amazon.com/NBCUniversal-Media-LLC-NBC/product-reviews/B018IOV40E/ref=cm_cr_arp_d_viewopt_srt?ie=UTF8&reviewerType=all_reviews&pageNumber=', 1:10),
               function(url){
                 url %>% read_html() %>% 
                   html_nodes(".review-date") %>% 
                   html_text() %>%
                   gsub('[\r\n\t]', '', .)
                 
               })




Stars <- lapply(paste0('https://www.amazon.com/NBCUniversal-Media-LLC-NBC/product-reviews/B018IOV40E/ref=cm_cr_arp_d_viewopt_srt?ie=UTF8&reviewerType=all_reviews&pageNumber=', 1:10),
                function(url){
                  url %>% read_html() %>% 
                    html_nodes(".a-icon-alt") %>% 
                    html_text() %>%
                    gsub('[\r\n\t]', '', .)
                  
                })

Title <- lapply(paste0('https://www.amazon.com/NBCUniversal-Media-LLC-NBC/product-reviews/B018IOV40E/ref=cm_cr_arp_d_viewopt_srt?ie=UTF8&reviewerType=all_reviews&pageNumber=', 1:10),
                function(url){
                  url %>% read_html() %>% 
                    html_nodes(".a-color-base") %>% 
                    html_text() %>%
                    gsub('[\r\n\t]', '', .)
                  
                })



Review <- lapply(paste0('https://www.amazon.com/NBCUniversal-Media-LLC-NBC/product-reviews/B018IOV40E/ref=cm_cr_arp_d_viewopt_srt?ie=UTF8&reviewerType=all_reviews&pageNumber=', 1:10),
                 function(url){
                   url %>% read_html() %>% 
                     html_nodes(".review-text") %>% 
                     html_text() %>%
                     gsub('[\r\n\t]', '', .)
                   
                 })





#Convert to Array

Date <- unlist(Date)
Title <- unlist(Title)
Stars <- unlist(Stars)
Review <- unlist(Review)
Comments <- unlist(Comment)


merge
#Covert to Data Frame
Final_Table <- data.frame(Date,Title,Stars,Review,Comments,stringsAsFactors = FALSE)

#View Table
View(Final_Table)

#Export as CSV
write.csv(Final_Table,file='Amazon_Reviews.csv')

