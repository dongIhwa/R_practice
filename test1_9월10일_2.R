iotest1 <- scan("data/iotest1.txt")
iotest1_sort <- sort(iotest1)
iotest1_sort_dec <-sort(iotest1, decreasing=T)
iotest1_sum <-sum(iotest1)
iotest1_mean <-mean(iotest1)


iotest1_print <- function(){
  cat("오름차순 :", iotest1_sort, "\n")
  cat("내림차순 :", iotest1_sort_dec, "\n")
  cat("합 :", iotest1_sum, "\n")
  cat("평균 :", iotest1_mean, "\n")
}

iotest1_print()