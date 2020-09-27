install.packages("ggplot2")
library('dplyr')
library('ggplot2')

mpg
# 문제 1
str(ggplot2::mpg)
mpg <- as.data.frame(ggplot2::mpg)

# 1-1
str(mpg)

# 1-2
nrow(mpg)
ncol(mpg)

dim(mpg)

# 1-3
mpg %>%
  head(10)

# 1-4
mpg %>%
  tail(10)

# 1-5
View(mpg)

# 1-6
summary(mpg)

# 1-7
mpg %>%
  group_by(manufacturer) %>%
  tally()

# 1-8
mpg %>%
  group_by(model) %>%
  tally()

# 2-1
mpg %>%
  rename(city=cty,
         highway=hwy) -> mpg

# 2-2
mpg %>%
  head(3)

# 3-1

midwest <- as.data.frame(ggplot2::midwest)

str(midwest)
summary(midwest)


# 3-2
midwest %>%
  rename(total=poptotal,
         asian=popasian) -> midwest

# 3-3
midwest %>%
  mutate(asian_100=(asian/total)*100) -> midwest

# 3-4
midwest %>%
  mutate(asian_mean_com=ifelse(asian_100>mean(asian_100), 'large', 'small')) -> midwest

# 4-1
mpg <- as.data.frame(ggplot2::mpg)

mpg %>%
  mutate(displ_4n5=ifelse(displ>=5, "배기량5이상", "배기량4이하")) %>%
  group_by(displ_4n5) %>%
  summarise(mean_hwy=mean(hwy))

# 4-2
mpg %>%
  filter(manufacturer %in% c("audi", "toyota")) %>%
  group_by(manufacturer) %>%
  summarise(mean_cty=mean(cty))

# 4-3
mpg %>%
  filter(manufacturer %in% c("chevrolet", "ford", "honda")) %>%
  summarise(mean_hwy=mean(hwy))

# 5-1
mpg %>%
  select(class, cty) -> mpg

mpg %>%
  head(1)

# 5-2
mpg %>%
  filter(class %in% c("suv", "compact")) %>%
  group_by(class) %>%
  summarise(mean_cty=mean(cty))

# 6-1
mpg <- as.data.frame(ggplot2::mpg)

mpg %>%
  filter(manufacturer %in% "audi") %>%
  arrange(desc(hwy)) %>%
  head(5)