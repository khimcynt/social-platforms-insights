Facebook2 <- read.csv("/Users/chanyanutsuteerayongprasert/Desktop/INFO VISUAL/Facebook_Data_Q2.csv", head(T))
View(Facebook2)
x <- 0

for(i in 1:nrow(Facebook2)){
  a <- Facebook2$comment[i] == Facebook2$positive[i]+Facebook2$negative[i]+Facebook2$neutral[i]
  if(a == 'FALSE'){
    x <- c(x,i)
  } 
}
Facebook22 <- Facebook2[-x,]

y<-0
for(i in 1:nrow(Facebook22)){
  d <- Facebook22$is_photo[i]
  e <- Facebook22$message[i]
  if(e == "" & d=="0"){
    y <- c(y,i)
  } 
}

Facebook222 <- Facebook22[-y,]

z <- 0
for(i in 1:nrow(Facebook222)){
  b <- Facebook222$reaction[i] == Facebook222$like[i]+Facebook222$love[i]+Facebook222$wow[i]+Facebook222$sad[i]+Facebook222$haha[i]+Facebook222$angry[i]
  if(b == 'FALSE'){
    z <- c(z,i)
  } 
}
Facebook2222 <- Facebook222
which(Facebook222$reaction != Facebook222$like+Facebook222$love+Facebook222$wow+Facebook222$sad+Facebook222$haha+Facebook222$angry)

q <-0
for(i in 1:nrow(Facebook2222)){
  c <- Facebook2222$engagement[i] == Facebook2222$share[i]+Facebook2222$reaction[i]+Facebook2222$comment[i]
  if(c == 'FALSE'){
    q <- c(q,i)
  } 
}
Facebook22222 <- Facebook2222
which(Facebook2222$engagement != Facebook2222$share+Facebook2222$reaction+Facebook2222$comment)

Facebook222222 <- Facebook22222 %>% distinct(message, .keep_all = TRUE) 
w <- 0
for(i in 1:nrow(Facebook222222)){
  if(Facebook222222$fan[i] == '0'){
    w <- c(w,i)
  } 
}
Facebook2222222 <- Facebook222222[-w,]
View(Facebook222222)
write_xlsx(Facebook222222,"/Users/chanyanutsuteerayongprasert/Desktop/INFO VISUAL/data cleaning/FacebookQ2.xlsx")

