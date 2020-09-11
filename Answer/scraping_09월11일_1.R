text<- NULL; title<-NULL; point<-NULL; review<-NULL; page=NULL
url <- "http://unico2013.dothome.co.kr/crawling/exercise_bs.html"
text <- read_html(url)
text


#<h1> 태그의 컨텐츠
# h1 selector => body > h1
h1_node <- html_nodes(text, "h1")
h1_text <- html_text(h1_node)
h1_text


#<a> 태그의 컨텐츠와 href 속성
# a selector => body > a:nth-child(3)
# body > a:nth-child(4)
a_node <- html_nodes(text, "a")
a_text <- html_text(a_node)
a_href <- html_attr(a_node, "href")
a_text
a_href


#<img> 태그의 src 속성값
# img selector => body > a:nth-child(8) > img
img_node <- html_nodes(text, "img")
img_src <- html_attr(img_node, "src")
img_src


# 첫 번째 <h2> 태그의 컨텐츠
# h2 selector => body > h2:nth-child(9)
h2_node <- html_nodes(text, "h2:nth-child(1)")
h2_node_9 <- html_nodes(text, "h2:nth-child(9)")
h2_text <- html_text(h2_node)
h2_text_9 <- html_text(h2_node_9)
h2_text
h2_text_9


# <ul> 태그의 자식 태그들 중 style 속성의 값이
# green 으로 끝나는 태그의 컨텐츠
# h2 자식 body > ul > li:nth-child(1)
li_nodes <- html_nodes(text, "ul>li")
li_attr <- html_attr(li_nodes, "style")
li_text <- html_text(li_nodes)

li_text[which(li_attr == "color:green")]



# 두 번째 <h2> 태그의 컨텐츠
# 두 번째 h2 selector = > body > h2:nth-child(11)
h2_node_11 <- html_nodes(text, "h2:nth-child(11)")
h2_text_11 <- html_text(h2_node_11)
h2_text_11


# <ol> 태그의 모든 자식 태그들의 컨텐츠
ol_nodes <- html_nodes(text, "ol>li")
ol_text <- html_text(ol_nodes)
ol_text


# <table> 태그의 모든 자손 태그들의 컨텐츠
table_nodes <- html_nodes(text, "table>*, table>*>*")
table_text <- html_text(table_nodes)
table_text


# name이라는 클래스 속성을 갖는 <tr> 태그의 컨텐츠
name_nodes <- html_nodes(text, "tr.name")
name_text <- html_text(name_nodes)
name_text


# target 이라는 아이디 속성을 갖는 <td> 태그의 컨텐츠
target_node <- html_nodes(text, "#target")
target_text <- html_text(target_node)
target_text