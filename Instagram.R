Instagram <- read.csv("/Users/chanyanutsuteerayongprasert/Desktop/INFO VISUAL/Instagram_Data.csv")
View(Instagram3)

x<-0
for(i in 1:nrow(Instagram)){
  a <- Instagram$comment[i] == Instagram$positive[i]+Instagram$negative[i]+Instagram$neutral[i]
  if(a == 'FALSE'){
    x <- c(x,i)
  } 
}
Instagram1 <- Instagram[-x,]
View(Instagram1)


install.packages("dplyr")
library(dplyr)
n <- Instagram1[duplicated(Instagram1$link),]
Instagram2 <- Instagram1 %>% distinct(link, .keep_all = TRUE) 
n <- unique(Instagram1$link)
w <- 0
for(i in 1:nrow(Instagram2)){
  if(Instagram2$fan[i] == '0'){
    w <- c(w,i)
  } 
}
Instagram3 <- Instagram2[-w,]

h <- 0
for(i in 1:nrow(Instagram3)){
  if(Instagram3$fan[i] < 10){
    h <- c(h,i)
  } 
}
Instagram4 <- Instagram3[-h,]
which(Instagram4$fan=='0')
install.packages("writexl")
library(writexl)
write_xlsx(Instagram4,"/Users/chanyanutsuteerayongprasert/Desktop/INFO VISUAL/data cleaning/Instagram.xlsx")

