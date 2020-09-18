library(RSelenium)

remDr <- remoteDriver(remoteServerAddr="localhost", port=4445, browserName="chrome")
remDr$open()
url_hotel <- "https://hotel.naver.com/hotels/item?hotelId=hotel:Shilla_Stay_Yeoksam&destination_kor=%EC%8B%A0%EB%9D%BC%EC%8A%A4%ED%85%8C%EC%9D%B4%20%EC%97%AD%EC%82%BC&rooms=2"
remDr$navigate(url_hotel)
Sys.sleep(3)
hotel_review_link <- NULL
hotel_review <- NULL
last <- NULL

repeat{
  doms_naver <- remDr$findElements(using="css selector", "body > div > div.ng-scope > div.container.ng-scope > div.content > div.hotel_used_review.ng-isolate-scope > div.review_ta.ng-scope > ul > li > div.review_desc > p")
  Sys.sleep(1)
  review_single_page <- sapply(doms_naver, function(x){x$getElementText()})
  hotel_review <- append(hotel_review, unlist(review_single_page))
  try(last <- remDr$findElement(using="css selector", "div.review_ta.ng-scope > div.paginate > a.direction.next.disabled"))
  if(length(last) == 1){
    cat("종료","\n")
    break
  }
  next_page_link <- remDr$findElement(using="css selector", "body > div > div.ng-scope > div.container.ng-scope > div.content > div.hotel_used_review.ng-isolate-scope > div.review_ta.ng-scope > div.paginate > a.direction.next")
  next_page_link$clickElement()
  Sys.sleep(3)
}

cat(length(hotel_review), "개의 리뷰 추출\n")
write(hotel_review, "naverhotel.txt")