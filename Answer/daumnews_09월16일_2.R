library("rvest")
url <- NULL; text <- NULL; nodes <- NULL; title <- NULL
newspapernamepaper <- NULL; newstitle <- NULL
url <- "https://news.daum.net/ranking/popular/"
text <- read_html(url)
nodes_t <- html_nodes(text, ".tit_thumb .link_txt")
nodes_s <- html_nodes(text, "#mAside .tit_thumb .link_txt")
title <- html_text(nodes_t)
side <- html_text(nodes_s)
newstitle <- setdiff(title, side)

nodes_p <- html_nodes(text, ".info_news")
newspapernamepaper <- html_text(nodes_p)

daumnews <- data.frame(newstitle, newspapernamepaper)
View(daumnews)

write.csv(daumnews, "daumnews.csv")