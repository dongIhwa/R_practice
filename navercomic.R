library("rvest")
url <- NULL; text <- NULL; nodes_n <- NULL; nodes_s <- NULL
nodes_g <- NULL; comicName <- NULL; comicSummary <- NULL;
commicGrade <- NULL; comicPage <- NULL; navercomic <- NULL

url <- "https://comic.naver.com/genre/bestChallenge.nhn?&page="
text <- read_html(url, encoding="UTF-8")

i <- 1

repeat{
  url <- "https://comic.naver.com/genre/bestChallenge.nhn?&page="
  url <- paste0(url, i)
  text <- read_html(url, encoding="UTF-8")
  j <- i + 1
  nodes_n1 <-html_nodes(text, ".challengeInfo .challengeTitle > a")
  n1 <- html_text(nodes_n1)
  url <- "https://comic.naver.com/genre/bestChallenge.nhn?&page="
  url_2 <- paste0(url, j)
  text_2 <- read_html(url_2, encoding="UTF-8")
  nodes_n2 <-html_nodes(text_2, ".challengeInfo .challengeTitle > a")
  n2 <- html_text(nodes_n2)
  if(n1 != n2){
    # 만화 이름 불러오기
    nodes_n <- html_nodes(text, ".challengeInfo .challengeTitle > a")
    comicName <- html_text(nodes_n, trim=TRUE)
    # 만화 요약 불러오기
    nodes_s <- html_nodes(text, ".challengeInfo .summary")
    comicSummary <- html_text(nodes_s)
    # 만화 평점 불러오기
    nodes_g <- html_nodes(text, ".challengeInfo .rating_type > strong")
    comicGrade <- html_text(nodes_g)
    
    comicPage <- data.frame(comicName, comicSummary, comicGrade)
    navercomic <- rbind(navercomic, comicPage)
    url <- "https://comic.naver.com/genre/bestChallenge.nhn?&page="
    i <- i+1
    
  } else {
    break
  }
  
}
# 마지막 페이지 만화 이름 불러오기
nodes_n <- html_nodes(text, ".challengeInfo .challengeTitle > a")
comicName <- html_text(nodes_n, trim=TRUE)
# 마지막 페이지 만화 요약 불러오기
nodes_s <- html_nodes(text, ".challengeInfo .summary")
comicSummary <- html_text(nodes_s)
# 마지막 페이지 만화 평점 불러오기
nodes_g <- html_nodes(text, ".challengeInfo .rating_type > strong")
comicGrade <- html_text(nodes_g)

comicPage <- data.frame(comicName, comicSummary, comicGrade)
navercomic <- rbind(navercomic, comicPage)
print('크롤링 완료')


View(navercomic)
write.csv(navercomic, "navercomic.csv")