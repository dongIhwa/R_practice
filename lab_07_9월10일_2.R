#문제 1
countEvenOdd <-function(x) {
  xx<-x
  even <- 0
  odd <- 0
  if(is.vector(xx)){
    if(all(is.numeric(xx))){
      for(i in 1:length(x)){
        if(xx[i] %% 2 == 0){
          even <- even +1
        } else {
          odd <- odd +1
        }
      }
      return(list(even=even, odd=odd))
    } else{
      return(NULL)
    }
  }
}

countEvenOdd(list())
countEvenOdd(c(1,2,3,4,5))



# 문제 2

vmSum <- function(x){
  result <- NULL
  xx <- x
  if(is.vector(xx)){
    if(all(is.numeric(xx))){
      result <- sum(xx)
    } else {
      result <- 0
      print("숫자 벡터를 전달하숑!")
    }
  } else {
    result <- "벡터만 전달하숑!"
  }
  return(result)
}

vmSum(c(1,2,3))
vmSum(c("1","2","3"))
vmSum(array())

# 문제3

vmSum2 <-function(x) {
  result <- NULL
  xx <- x
  if(is.vector(xx)){
    if(all(is.numeric(xx))){
      result <- sum(xx)
    } else {
      result <- 0
      warning("숫자 벡터를 전달하숑!")
    }
  } else {
    stop("벡터만 전달하숑!")
  }
  return(result)
}

vmSum2(c(1,2,3))
vmSum2(c("1","2","3"))
vmSum2(array())


# 문제4

mySum <- function(x){
  xx <- x
  oddSum <- 0
  evenSum <- 0
  if(is.vector(xx)){
    if(any(is.na(xx))){
      xx[is.na(xx)] <- min(xx, na.rm=T)
      for(i in seq(1,length(xx),2)){
        oddSum <- oddSum + xx[i]
      }
      
      for(j in seq(2, length(xx),2)){
        evenSum <- evenSum + xx[j]
      }
      
      warning("NA를 최저값으로 변경하여 처리함!!")
    }else{
      for(i in seq(1,length(xx),2)){
        oddSum <- oddSum + xx[i]
      }
      
      for(j in seq(2, length(xx),2)){
        evenSum <- evenSum + xx[j]
      }
    }
    return(list(oddSum=oddSum, evenSum=evenSum))
  }else{
    stop("벡터만 처리 가능!!")
  }
}


mySum(c(1,2,3))
mySum(c(1,2,NA))
mySum(c(1,2,3,4,5,6))
mySum(array())

sum(aass, na.rm=T)
aass <- c(1,2,3,4,5,NA,4)
aass[is.na(aass)]<- min(aass, na.rm=T)
sum_aass <- 0
for(i in seq(1,length(aass),2)){
  sum_aass <- sum_aass + aass[i]
}
  
  
seq(1,5, 2)
min(aass, na.rm=T)


# 문제5

myExpr <- function(x){
  xx <- x
  if(is.function(xx)){
    cc <- sample(1:45, 6)
    result <- xx(cc)
    print(cc)
    return(result)
  } else {
    stop("수행 안할꺼임!!")
  }
}

myExpr(max)
myExpr(max)
myExpr(sum) # sum은 함수인가 아닌가?
myExpr(mean)
is.function(sum)


# 문제6 ???
createVector1 <- function(...){
  xx<- c(...)
  result <- ''
  if(is.null(xx)){
    return(NULL)
  } else if(any(is.na(xx))){
    return(NA)
  } else{
    result <- xx
    return(result)
  }
}

createVector1(1,2,3,4,5)
createVector1()
createVector1(NA,1,2,3)
createVector1(F,T,1,2,3,"가")


# 문제7

createVector2 <- function(...){
  num <- c()
  chr <- c()
  logi <- c()
  xx <- list(...)
  yy <- c(...)
  
  if(is.null(yy)){
    return(NULL)
  } else {
    for(i in 1:length(xx)){
      if(is.numeric(xx[[i]])){
        num <- c(num, xx[[i]])
      } else if(is.character(xx[[i]])){
        chr <- c(chr, xx[[i]])
      } else if(is.logical(xx[[i]])){
        logi <- c(logi, xx[[i]])
      }
    }
    return(list(num=num, chr=chr, logi=logi))
  }
}

createVector2(1,2,3,T,F,"가","나")
createVector2()
