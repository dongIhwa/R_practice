library("rJava")
library("RJDBC")
library("DBI")
library("dplyr")
drv <- JDBC(driverClass = 'org.mariadb.jdbc.Driver', 'mariadb-java-client-2.6.2.jar')
conn <- dbConnect(drv, 'jdbc:mariadb://127.0.0.1:3306/work', 'scott', 'tiger')

emp <- dbReadTable(conn, 'emp')

# 문제0
emp %>%
  mutate(comm = ifelse(comm < 0, NA, comm)) -> emp

emp %>%
  mutate(mgr = ifelse(mgr < 0, NA, mgr)) -> emp



# 문제1
emp %>%
  filter(job=="MANAGER")

# 문제2
emp %>%
  select(empno, ename, sal)

# 문제3
emp %>%
  select(-empno)

# 문제4
emp %>%
  select(ename, sal)

# 문제5
emp %>%
  group_by(job) %>%
  tally()

# 문제6
emp %>%
  filter(sal>=1000 & sal<=3000) %>%
  select(ename, sal, empno)

# 문제7
emp %>%
  filter(job!="ANALYST") %>%
  select(ename, job, sal)

# 문제8
emp %>%
  filter(job=="SALESMAN" | job=="ANALYST") %>%
  select(ename, job)

# 문제9
emp %>%
  group_by(job) %>%
  summarise(sum_sal = sum(sal))


# 문제10
emp %>%
  arrange(sal)

# 문제11
emp %>%
  arrange(desc(sal)) %>%
  head(1)

# 문제12
emp %>%
  rename(commrate = comm,
         salary = sal) -> empnew


empnew
emp

# 문제13
emp %>%
  group_by(job) %>%
  summarise(n = n(), deptno = mean(deptno)) %>%
  arrange(desc(n)) %>%
  head(1) %>%
  select(deptno)

# 문제14
emp %>%
  mutate(enamelength=nchar(ename)) %>%
  arrange(enamelength) %>%
  select(ename)

# 문제15
emp %>%
  filter(comm>0) %>%
  tally()