Facebook4 <- read.csv("/Users/chanyanutsuteerayongprasert/Desktop/INFO VISUAL/Facebook_Data_Q4.csv", head(T))
Facebook4 <-Facebook4[,c(16,21,22,23)]
q <- 0

for(i in 1:nrow(Facebook4)){
  f <- Facebook4$comment[i] == Facebook4$positive[i]+Facebook4$negative[i]+Facebook4$neutral[i]
  if(f == 'FALSE'){
    q <- c(q,i)
  } 
}
FacebookQ4 <- Facebook4[-q,]
y <- 0
for(i in 1:nrow(FacebookQ4)){
  b <- FacebookQ4$comment[i]
  if(b ==0){
    y <- c(y,i)
  }
}
FacebookQ444<- FacebookQ4[-y,]
write_xlsx(FacebookQ444,"/Users/chanyanutsuteerayongprasert/Desktop/INFO VISUAL/sentiment:facebook4.xlsx")





