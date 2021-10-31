Twitter <- read.csv("/Users/chanyanutsuteerayongprasert/Desktop/INFO VISUAL/Twitter_Data.csv")
View(Twitter)
x<-0
for(i in 1:nrow(Twitter)){
  a <- Twitter$engagement[i] == Twitter$favorite[i]+Twitter$retweet[i]+Twitter$share_on_facebook[i]
  if(a == 'FALSE'){
    x <- c(x,i)
  } 
}
Twitter1 <- Twitter[-x,]

Twitter2 <- Twitter1 %>% distinct(message, .keep_all = TRUE) 
n <- unique(Twitter1$message)
View(Twitter2)

y <- 0
for(i in 1:nrow(Twitter2)){
  a <- Twitter2$reply[i] == Twitter2$positive[i]+Twitter2$negative[i]+Twitter2$neutral[i]
  if(a == 'FALSE'){
    y <- c(y,i)
  } 
}

Twitter3 <- Twitter2[-y,]

z <- 0
for(i in 1:nrow(Twitter3)){
  if(Twitter3$fan[i] == '0'){
    z <- c(z,i)
  } 
}
Twitter4 <- Twitter3[-z,]
write_xlsx(Twitter4,"/Users/chanyanutsuteerayongprasert/Desktop/INFO VISUAL/data cleaning/Twitter.xlsx")
