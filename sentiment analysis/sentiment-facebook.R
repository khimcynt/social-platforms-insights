install.packages("dplyr")                                        

library("dplyr")                                                 

Facebook1 <- read.csv("/Users/chanyanutsuteerayongprasert/Desktop/INFO VISUAL/Facebook_Data_Q1.csv", head(T))
FacebookQ1 <-Facebook1[,c(16,21,22,23)]

x <- 0

for(i in 1:nrow(FacebookQ1)){
  a <- FacebookQ1$comment[i] == FacebookQ1$positive[i]+FacebookQ1$negative[i]+FacebookQ1$neutral[i]
  if(a == 'FALSE'){
    x <- c(x,i)
  } 
}
FacebookQ11 <- FacebookQ1[-x,]

y <- 0
for(i in 1:nrow(FacebookQ11)){
  b <- FacebookQ11$comment[i]
  if(b ==0){
    y <- c(y,i)
  }
  }
FacebookQ111 <- FacebookQ11[-y,]

View(FacebookQ1)
write_xlsx(FacebookQ111,"/Users/chanyanutsuteerayongprasert/Desktop/INFO VISUAL/sentiment:facebook1.xlsx")


install.packages("writexl")
library(writexl)

