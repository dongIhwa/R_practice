library('dplyr')
library('ggplot2')

# 7-1

mpg <- as.data.frame(ggplot2::mpg)

mpg_clone <- mpg

mpg_clone %>%
  mutate(sum_cty_hwy=cty+hwy) -> mpg_clone

# 7-2
mpg_clone %>%
  mutate(avg_cty_hwy=sum_cty_hwy/2) -> mpg_clone

mpg_clone %>%
  head(1)

# 7-3
mpg_clone %>%
  arrange(desc(avg_cty_hwy)) %>%
  head(3)

# 7-4
mpg %>%
  mutate(sum_cty_hwy=cty+hwy,
         avg_cty_hwy=sum_cty_hwy/2) %>%
  arrange(desc(avg_cty_hwy)) %>%
  head(3)


# 8-1
mpg %>%
  group_by(class) %>%
  summarise(mean_cty=mean(cty))

# 8-2
mpg %>%
  group_by(class) %>%
  summarise(mean_cty=mean(cty)) %>%
  arrange(desc(mean_cty))


# 8-3
mpg %>%
  group_by(manufacturer) %>%
  summarise(mean_cty=mean(cty)) %>%
  arrange(desc(mean_cty))

#8-4
mpg %>%
  filter(class %in% "compact") %>%
  group_by(manufacturer) %>%
  tally() %>%
  arrange(desc(n))

# 9-1
fuel <- data.frame(fl = c("c", "d", "e", "p", "r"),
                   price_fl = c(2.35, 2.38, 2.11, 2.76, 2.22),
                   stringsAsFactors = F)

mpg %>%
  full_join(fuel, by="fl")

# 9-2

mpg %>%
  full_join(fuel, by="fl") %>%
  select(model, fl, price_fl) %>%
  head(5)

head(mpg)

fuel



# 10-1
midwest <- as.data.frame(ggplot2::midwest)

midwest %>%
  mutate(teenager_percent=(poptotal-popadults)*100/poptotal) -> midwest

# 10-2
midwest %>%
  group_by(county) %>%
  select(county, teenager_percent) %>%
  arrange(desc(teenager_percent)) %>%
  head(5)

# 10-3
midwest %>%
  mutate(teen_per_grade= ifelse(teenager_percent>=40, "large",
                                ifelse(teenager_percent<30, "small", "middle"))) %>%
  group_by(teen_per_grade) %>%
  tally()

# 10-4
midwest %>%
  mutate(asian_per=popasian/poptotal*100) %>%
  select(state, county, asian_per) %>%
  arrange(desc(asian_per)) %>%
  tail(10)


# 11-1
mpg <- as.data.frame(ggplot2::mpg)
mpg[c(65, 124, 131, 153, 212), "hwy"] <-NA

table(is.na(mpg$hwy))
table(is.na(mpg$drv))

# 11-2
mpg %>%
  filter(!is.na(hwy)) %>%
  group_by(drv) %>%
  summarise(mean_hwy=mean(hwy))

# 12-1
mpg <- as.data.frame(ggplot2::mpg)
mpg[c(10, 14, 58, 93), "drv"] <- "k"
mpg[c(29, 43, 129, 203), "cty"] <- c(3, 4, 39, 42)

mpg %>%
  filter(!drv %in% c("4", "f", "r")) %>%
  mutate(drv=NA) -> mpg_na

mpg %>%
  filter(drv %in% c("4", "f", "r")) %>%
  rbind(mpg_na) -> mpg

mpg %>%
  filter(!drv %in% c("4", "f", "r", NA))

# 12-2

boxplot(mpg$cty)


boxplot.stats(mpg$cty)

mpg %>%
  filter(cty>=28 | cty<=4) %>%
  mutate(cty=NA) -> mpg_cty_out

mpg %>%
  filter(cty>4 & cty<28) %>%
  rbind(mpg_cty_out) -> mpg

boxplot(mpg$cty)

#13-3
mpg %>%
  filter(cty>=28 | cty<=4)

mpg %>%
  filter(!drv %in% c("4", "f", "r", NA))

mpg %>%
  filter(!is.na(drv) & !is.na(cty)) %>%
  group_by(drv) %>%
  summarise(mean_cty=mean(cty))