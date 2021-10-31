Facebook1 <- read.csv("/Users/chanyanutsuteerayongprasert/Desktop/INFO VISUAL/Facebook_Data_Q1.csv", head(T))
View(Facebook1)
x <- 0

for(i in 1:nrow(Facebook1)){
  a <- Facebook1$comment[i] == Facebook1$positive[i]+Facebook1$negative[i]+Facebook1$neutral[i]
  if(a == 'FALSE'){
    x <- c(x,i)
  } 
}
Facebook11 <- Facebook1[-x,]

y<-0
for(i in 1:nrow(Facebook11)){
  d <- Facebook11$is_photo[i]
  e <- Facebook11$message[i]
  if(e == "" & d=="0"){
    y <- c(y,i)
    } 
}

Facebook111 <- Facebook11[-y,]

z <- 0
for(i in 1:nrow(Facebook111)){
  b <- Facebook111$reaction[i] == Facebook111$like[i]+Facebook111$love[i]+Facebook111$wow[i]+Facebook111$sad[i]+Facebook111$haha[i]+Facebook111$angry[i]
  if(b == 'FALSE'){
    z <- c(z,i)
  } 
}
Facebook1111 <- Facebook111
which(Facebook111$reaction != Facebook111$like+Facebook111$love+Facebook111$wow+Facebook111$sad+Facebook111$haha+Facebook111$angry)

q <-0
for(i in 1:nrow(Facebook1111)){
  c <- Facebook1111$engagement[i] == Facebook1111$share[i]+Facebook1111$reaction[i]+Facebook1111$comment[i]
  if(c == 'FALSE'){
    q <- c(q,i)
  } 
}
Facebook11111 <- Facebook1111
which(Facebook1111$engagement != Facebook1111$share+Facebook1111$reaction+Facebook1111$comment)

Facebook111111 <- Facebook11111 %>% distinct(message, .keep_all = TRUE) 

w <- 0
for(i in 1:nrow(Facebook111111)){
  if(Facebook111111$fan[i] == '0'){
    w <- c(w,i)
  } 
}
Facebook1111111 <- Facebook111111[-w,]
write_xlsx(Facebook1111111,"/Users/chanyanutsuteerayongprasert/Desktop/INFO VISUAL/data cleaning/FacebookQ1.xlsx")

