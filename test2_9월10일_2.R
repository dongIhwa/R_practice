iotest2 <- scan("data/iotest2.txt", what='')

iotest2_many <- function(){
  iotest2_f <- factor(iotest2)
  iotest2_max <- iotest2[which.max(iotest2_f)]
  print(paste("가장 많이 등장한 단어는", iotest2_max, "입니다"))
}


iotest2_many()