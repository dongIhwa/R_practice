# 문제1
str(iris)

# 문제2
x <- seq(1,5)
y <- seq(2,10,2)
df1 <- data.frame(x, y)

# 문제3
col1 <- seq(1,5)
col2 <- letters[1:5]
col3 <- col1+5
df2 <- data.frame(col1, col2, col3)

# 문제4
제품명 <- c("사과", "딸기", "수박")
가격 <- c(1800, 1500, 3000)
판매량 <- c(24, 38, 13)
df3 <- data.frame(제품명, 가격, 판매량)
is.factor(df3$제품명)
is.factor(df3$가격)
is.factor(df3$판매량)
str(df3)

# 문제5
mean(df3$가격)
mean(df3$판매량)

# 문제6
name <- c("Potter", "Elsa", "Gates", "Wendy", "Ben")
gender <- factor(c("M", "F", "M", "F", "M"))
math <- c(85, 76, 99, 88, 40)

df4 <- data.frame(name, gender, math)
str(df4)

stat <- c(76, 73, 95, 82, 35)
df4$stat <- c(76, 73, 95, 82, 35)
df4$score <- stat + math
df4$grade <- ifelse(df4$score>=150, "A",
                    ifelse(df4$score>=100, "B",
                           ifelse(df4$score>=70, "C", "D")))


emp <- read.csv("data/emp.csv")
View(emp)
str(emp) # 문제7

emp[c(3:5),] # 문제8

emp[, -4] # 문제9

emp[,"ename", drop=F] # 문제10

emp[, c("ename", "sal"), drop=F] # 문제11

subset(emp, select=c("ename", "sal", "job"), 
       subset=emp$job=="SALESMAN") # 문제 12

subset(emp, select=c("ename", "sal", "empno"), 
       subset=emp$sal>=1000&emp$sal<=3000) # 문제13

subset(emp, select=c("ename", "job", "sal"), 
       subset=emp$job!="ANALYST") # 문제14

subset(emp, select=c("ename", "job"), 
       subset=emp$job=="ANALYST"|emp$job=="SALESMAN") # 문제15

subset(emp, select=c("ename", "job"),
       subset=is.na(emp$comm)) # 문제16
subset(emp, select=c("ename", "job", "comm"),
       subset=is.na(emp$comm))

emp[order(emp$sal),] # 문제17

nrow(emp)
ncol(emp) # 문제18
dim(emp)