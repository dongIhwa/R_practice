# 문제1
q1 <- seq(10,38,2)
m1 <- matrix(q1, nrow=3, ncol=5, byrow=TRUE)
m2 <- m1+100
m_max_v <- max(m1)
m_min_v <- min(m1)
row_max <- apply(m1, 1, max)
col_max <- apply(m1, 2, max)
m1; m2; m_max_v; m_min_v; row_max; col_max

# 문제2
n1 <- seq(1,3)
n2 <- seq(4,6)
n3 <- seq(7,9)

m2 <- cbind(n1, n2, n3)

# 문제3
m3 <- matrix(1:9, nrow=3, byrow=TRUE); m3

# 문제4
rownames(m3) <- c("row1", "row2", "row3")
colnames(m3) <- c("col1", "col2", "col3")
m3

# 문제5
alpha <- matrix(letters, nrow=2, ncol=3)
alpha2 <- rbind(alpha, c('x', 'y', 'z')); alpha2
alpha3 <- cbind(alpha, c('s','p')); alpha3

a <- array(1:24, c(2,3,4))
a[2,3,4] #1
a[2,,] #2
a[,1,] #3
a[,,3] #4
a+100 #5
a[,,4]*100 #6
a[1,2:3,] #7
a[2,,2] <- a[2,,2] + 100
a[,,1] <- a[,,1] -2
rm(a)