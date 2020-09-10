# 문제1
grade <- sample(1:6,1)
if (grade>=1 & grade<=3){
  cat(grade, "학년은 저학년입니다.", "\n")
} else{
  cat(grade, "학년은 고학년입니다.", "\n")
}

# 문제2
choice <- sample(1:5,1)
if (choice == 1){
  result<-300+5
} else if (choice == 2){
  result<-300-5
} else if (choice == 3){
  result<-300*5
} else if (choice == 4){
  result<-300/5
} else if (choice == 5){
  result<-300%%5
}; cat("결과값 :", result, "\n")

# 문제3
count <- sample(3:10, 1)
deco <- sample(1:3, 1)
if (deco==1){
  deco_type="*"
} else if (deco==2){
  deco_type="$"
} else if (deco==3){
  deco_type="#"
}
for(num in 1:count){
  cat(deco_type)
};cat("\n")


# 문제4
score <- sample(0:100, 1)
if(score>=90){
    score_range=1
} else if (score>=80) {
    score_range=2
} else if (score>=70) {
  score_range=3
} else if (score>=60) {
  score_range=4
} else{
  score_range=5
}
level <- switch(score_range,"A 등급", 
                "B 등급", "C 등급", "D 등급", "F등급")
cat(score, " 점은 ", level,"입니다.", "\n", sep='')


# 문제5
alpha <- ''
for(n in 1:length(LETTERS)){
  alpha[n] <- paste(LETTERS[n], letters[n], sep='')
}; alpha