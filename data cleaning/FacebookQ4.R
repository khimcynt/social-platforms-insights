Facebook4 <- read.csv("/Users/chanyanutsuteerayongprasert/Desktop/INFO VISUAL/Facebook_Data_Q4.csv", head(T))
View(Facebook4)
x <- 0

for(i in 1:nrow(Facebook4)){
  a <- Facebook4$comment[i] == Facebook4$positive[i]+Facebook4$negative[i]+Facebook4$neutral[i]
  if(a == 'FALSE'){
    x <- c(x,i)
  } 
}
Facebook44 <- Facebook4[-x,]

y<-0
for(i in 1:nrow(Facebook44)){
  d <- Facebook44$is_photo[i]
  e <- Facebook44$message[i]
  if(e == "" & d=="0"){
    y <- c(y,i)
  } 
}

Facebook444 <- Facebook44[-y,]

z <- 0
for(i in 1:nrow(Facebook444)){
  b <- Facebook444$reaction[i] == Facebook444$like[i]+Facebook444$love[i]+Facebook444$wow[i]+Facebook444$sad[i]+Facebook444$haha[i]+Facebook444$angry[i]
  if(b == 'FALSE'){
    z <- c(z,i)
  } 
}
Facebook4444 <- Facebook444
which(Facebook444$reaction != Facebook444$like+Facebook444$love+Facebook444$wow+Facebook444$sad+Facebook444$haha+Facebook444$angry)

q <-0
for(i in 1:nrow(Facebook4444)){
  c <- Facebook4444$engagement[i] == Facebook4444$share[i]+Facebook4444$reaction[i]+Facebook4444$comment[i]
  if(c == 'FALSE'){
    q <- c(q,i)
  } 
}
Facebook44444<- Facebook4444
which(Facebook4444$engagement != Facebook4444$share+Facebook4444$reaction+Facebook4444$comment)
install.packages("dplyr")
library(dplyr)
Facebook444444 <- Facebook44444 %>% distinct(message, .keep_all = TRUE)

w <- 0
for(i in 1:nrow(Facebook444444)){
  if(Facebook444444$fan[i] == '0'){
    w <- c(w,i)
  } 
}
Facebook4444444 <- Facebook444444[-w,]

write_xlsx(Facebook4444444,"/Users/chanyanutsuteerayongprasert/Desktop/INFO VISUAL/data cleaning/FacebookQ4.xlsx")

