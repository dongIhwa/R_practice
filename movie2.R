library("rvest")
library(stringr)

text<- NULL; title<-NULL; point<-NULL; review<-NULL; page=NULL
url<- "https://movie.daum.net/moviedb/grade?movieId=131576&type=netizen&page="
movie.review <- NULL
for(i in 1:5) {
  url_num <- paste(url, 1, sep='')
  text <- read_html(url_num, encoding="UTF-8")
  nodes_g <- html_nodes(text, ".emph_grade")
  point <- html_text(nodes_g)
  nodes_r <- html_nodes(text, ".desc_review")
  nodes_r <- html_text(nodes_r, trim=TRUE)
  review <- str_replace_all(nodes_r, "\r", "")
  page <-data.frame(point, review)
  movie.review <- rbind(movie.review, page)
  
}

write.csv(movie.review, "daummovie2.csv")
