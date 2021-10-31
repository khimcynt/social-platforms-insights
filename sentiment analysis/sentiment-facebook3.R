Facebook3 <- read.csv("/Users/chanyanutsuteerayongprasert/Desktop/INFO VISUAL/Facebook_Data_Q3.csv", head(T))
Facebook3 <-Facebook3[,c(16,21,22,23)]
z <- 0
Facebook3$comment[i] == Facebook3$positive[i]+Facebook3$negative[i]+Facebook3$neutral[i]
for(i in 1:nrow(Facebook3)){
  a <- Facebook3$comment[i] == Facebook3$positive[i]+Facebook3$negative[i]+Facebook3$neutral[i]
  if(a == 'FALSE'){
    z <- c(z,i)
  } 
}
FacebookQ3 <- Facebook3[-z,]
y <- 0
for(i in 1:nrow(FacebookQ3)){
  b <- FacebookQ3$comment[i]
  if(b ==0){
    y <- c(y,i)
  }
}
FacebookQ333 <- FacebookQ3[-y,]
write_xlsx(FacebookQ333,"/Users/chanyanutsuteerayongprasert/Desktop/INFO VISUAL/sentiment:facebook3.xlsx")
