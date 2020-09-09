# 문제1
L1 <- list(name="scott",
           sal=3000)

L1$result1 <- L1$sal*2
result1 <- L1$sal * 2

# 문제2
L2 <- list("scott", c(100, 200, 300))

# 문제3
L3 <- list(c(3, 5, 7), c("A", "B", "C"))
L3[[2]][1] <- "Alpha"
L3

# 문제4
L4 <- list(alpha=0:4, beta=sqrt(1:5), gamma=log(1:5))
L4$alpha + 10

# 문제5
L5 <- list(data1=LETTERS, data2=head(emp, n=3),
           data3=L4)

L5$data1[1] # [1] "A"
L5$data2[,"ename"] # [1] "ename"
L5$data3$gamma # [1] gamma


# 문제6
L6 <- list(math=list(95, 90), writing=list(90,85),
           reading=list(85, 80))
mean(unlist(L6))