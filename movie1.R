library("rvest")
library(stringr)

text<- NULL; title<-NULL; point<-NULL; review<-NULL; page=NULL
url<- "https://movie.daum.net/moviedb/grade?movieId=131576"
text <- read_html(url,  encoding="UTF-8")
text

# 영화평점
nodes <- html_nodes(text, ".emph_grade")
point <- html_text(nodes)
point
# 영화리뷰 
nodes <- html_nodes(text, ".desc_review")
nodes <- html_text(nodes, trim=TRUE)
review <- str_replace_all(nodes, "\r", "")
review
page <- data.frame(point, review)
write.csv(page, "daummovie1.csv")