# 문제1
exam1 <-function() {
  result_exam1 <- ''
  for(n in 1:length(letters)) {
    result_exam1[n] <- paste(LETTERS[n], letters[n], sep='')
  }
  return(result_exam1)
}
exam1()

# 문제2
exam2 <- function(n){
  sum <- 0
  for(i in 1:n) {
    sum <- sum + i
  }
  return(sum)
}
exam2(3)

# 문제3
exam3 <- function(x, y) {
  xx <- x
  yy <- y
  if(xx>yy) {
    result_exam3 <- xx-yy
  } else if(xx<yy) {
    result_exam3 <- yy-xx
  } else {
    result_exam3 <- 0
  }
  return(result_exam3)
}

exam3(10, 20)
exam3(20, 5)
exam3(5, 30)
exam3(6, 3)
exam3(3, 3)

# 문제4
exam4 <- function(a, b, c){
  aa <- a
  bb <- b
  cc <- c
  if(bb=="+"){
    result_exam4 <- aa+cc
  } else if(bb=="-"){
      result_exam4 <- aa-cc
  } else if(bb=="*"){
      result_exam4 <- aa*cc
  } else if(bb=="%/%"){
      if(aa==0){
        result_exam4 <- "오류1"
      } else {
        result_exam4 <- aa%/%cc
      }
  } else if(bb=="%%"){
      if(cc==0){
        result_exam4 <- "오류2"
      } else {
        result_exam4 <- aa%%cc
      }
  } else {
    result_exam4 <- "규격의 연산자만 전달하세요"
  }
  return(result_exam4)
}
exam4(1,"+",3)
exam4(2, "-", 5)
exam4(3, "*", 6)
exam4(0, "%/%", 3)
exam4(3, "%/%", 2)
exam4(4, "%%", 0)
exam4(5, "%%", 3)

# 문제5
exam5 <- function(x, y="#") {
  xx <- x
  yy <- y
  if(is.numeric(xx)) {
    if(xx>=0){
      for(i in 1:xx){
        cat(yy)
      }
    }else{
      result_exam5<- NULL
    }
  }else{
    result_exam5 <- NULL
  }
}

exam5(x=5,y="a")
exam5(-1)

# 문제6
exam6 <- function(...){
  xx <- c(...)
  for(n in 1:length(xx)){
    if(is.na(xx[n])){
      print("NA는 처리불가")
    } else{
      if(xx[n]>=85 & xx[n]<=100){
        print(paste(xx[n],"점은 상등급입니다."))
      } else if(xx[n]>=70 & xx[n]<=84){
        print(paste(xx[n],"점은 중등급입니다."))
      } else {
        print(paste(xx[n],"점은 하등급입니다."))
      }
    }
  }
}

exam6(80, 50, 70, 66, NA, 35)