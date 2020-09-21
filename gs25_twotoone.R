library(RSelenium)
remDr <- remoteDriver(remoteServerAddr="localhost", port=4445, browserName="chrome")
remDr$open()

url <- "http://gs25.gsretail.com/gscvs/ko/products/event-goods"
remDr$navigate(url)
gs25 <- NULL
gs25_twotoone <- NULL
procom <- c("1")

twotoone <- remDr$findElement(using="css", "#TWO_TO_ONE")
twotoone$clickElement()
Sys.sleep(2)

repeat{
  #상품 이름 추출
  product_name_nodes <- remDr$findElements(using="css", ".prod_list .prod_box > .tit")
  product_name <- sapply(product_name_nodes, function(x) {x$getElementText()})
  product_name <- unlist(product_name)
  product_name <- product_name[product_name!=""]
  if(procom[1] == product_name[1]){
    cat("완료")
    break
  }
  #상품 가격 추출
  product_price_nodes <- remDr$findElements(using="css", ".prod_list .prod_box > .price")
  product_price <- sapply(product_price_nodes, function(x) {x$getElementText()})
  product_price <- unlist(product_price)
  product_price <- product_price[product_price!=""]
  product_price <- gsub(",", "", product_price)
  product_price <- as.integer(gsub("원", "", product_price))
  
  # df로 저장
  gs25 <- data.frame(goodsname=product_name, goodsprice=product_price)
  gs25_twotoone <- rbind(gs25_twotoone, gs25)
  
  # 다음페이지 클릭
  findnext <- remDr$findElement(using="css", "#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > div > a.next")
  findnext$clickElement()
  Sys.sleep(2)
  
  #비교를 위해 이름 설정
  procom <- product_name
}

write.csv(gs25_twotoone, "gs25_twotoone.csv")






