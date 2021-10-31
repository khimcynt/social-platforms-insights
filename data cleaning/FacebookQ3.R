Facebook3 <- read.csv("/Users/chanyanutsuteerayongprasert/Desktop/INFO VISUAL/Facebook_Data_Q3.csv", head(T))
View(Facebook3)
x <- 0

for(i in 1:nrow(Facebook3)){
  a <- Facebook3$comment[i] == Facebook3$positive[i]+Facebook3$negative[i]+Facebook3$neutral[i]
  if(a == 'FALSE'){
    x <- c(x,i)
  } 
}
Facebook33 <- Facebook3[-x,]

y<-0
for(i in 1:nrow(Facebook33)){
  d <- Facebook33$is_photo[i]
  e <- Facebook33$message[i]
  if(e == "" & d=="0"){
    y <- c(y,i)
  } 
}

Facebook333 <- Facebook33[-y,]

z <- 0
for(i in 1:nrow(Facebook333)){
  b <- Facebook333$reaction[i] == Facebook333$like[i]+Facebook333$love[i]+Facebook333$wow[i]+Facebook333$sad[i]+Facebook333$haha[i]+Facebook333$angry[i]
  if(b == 'FALSE'){
    z <- c(z,i)
  } 
}
Facebook3333 <- Facebook333
which(Facebook333$reaction != Facebook333$like+Facebook333$love+Facebook333$wow+Facebook333$sad+Facebook333$haha+Facebook333$angry)

q <-0
for(i in 1:nrow(Facebook3333)){
  c <- Facebook3333$engagement[i] == Facebook3333$share[i]+Facebook3333$reaction[i]+Facebook3333$comment[i]
  if(c == 'FALSE'){
    q <- c(q,i)
  } 
}
Facebook33333<- Facebook3333
which(Facebook3333$engagement != Facebook3333$share+Facebook3333$reaction+Facebook3333$comment)

Facebook333333 <- Facebook33333 %>% distinct(message, .keep_all = TRUE)
w <- 0
for(i in 1:nrow(Facebook333333)){
  if(Facebook333333$fan[i] == '0'){
    w <- c(w,i)
  } 
}
Facebook3333333 <- Facebook333333[-w,]
View(Facebook3333333)
write_xlsx(Facebook3333333,"/Users/chanyanutsuteerayongprasert/Desktop/INFO VISUAL/data cleaning/FacebookQ3.xlsx")

