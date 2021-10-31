Facebook2 <- read.csv("/Users/chanyanutsuteerayongprasert/Desktop/INFO VISUAL/Facebook_Data_Q2.csv", head(T))
Facebook2 <-Facebook2[,c(16,21,22,23)]
y<- 0
for(i in 1:nrow(Facebook2)){
  a <- Facebook2$comment[i] == Facebook2$positive[i]+Facebook2$negative[i]+Facebook2$neutral[i]
  if(a == 'FALSE'){
    y <- c(y,i)
  } 
}
FacebookQ2 <- Facebook2[-y,]

z <- 0
for(i in 1:nrow(FacebookQ2)){
  b <- FacebookQ2$comment[i]
  if(b ==0){
    z <- c(z,i)
  }
}
FacebookQ222 <- FacebookQ2[-z,]
write_xlsx(FacebookQ222,"/Users/chanyanutsuteerayongprasert/Desktop/INFO VISUAL/sentiment:facebook2.xlsx")
