library("rvest")
library(stringr)

text<- NULL; title<-NULL; point<-NULL; review<-NULL; page=NULL
url<- "https://movie.daum.net/moviedb/grade?movieId=131576&type=netizen&page="
movie.review <- NULL
i <- 1
repeat{
  url_num <- paste(url, i, sep='')
  text <- read_html(url_num, encoding="UTF-8")
  nodes_g <- html_nodes(text, ".emph_grade")
  if (length(nodes_g) == 0){
    cat(paste(i-1, "페이지 까지 크롤링 완료했습니다.", "\n", sep=''))
    break
  } else {
    point <- html_text(nodes_g)
    nodes_r <- html_nodes(text, ".desc_review")
    nodes_r <- html_text(nodes_r, trim=TRUE)
    review <- str_replace_all(nodes_r, "\r", "")
    page <-data.frame(point, review)
    movie.review <- rbind(movie.review, page)
    i <- i +1
  }
}

write.csv(movie.review, "daummovie3.csv")