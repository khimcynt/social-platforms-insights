Instagram <- read.csv("/Users/chanyanutsuteerayongprasert/Desktop/INFO VISUAL/Instagram_Data.csv")
Instagram <-Instagram[,c(10,14,15,16)]
View(Instagram)
which(Instagram$positive>0)

x <- 0

for(i in 1:nrow(Instagram)){
  a <- Instagram$comment[i] == Instagram$positive[i]+Instagram$negative[i]+Instagram$neutral[i]
  if(a == 'FALSE'){
    x <- c(x,i)
  } 
}
Instagram <- Instagram[-x,]
View(Instagram)
install.packages("writexl")
library(writexl)
write_xlsx(Instagram,"/Users/chanyanutsuteerayongprasert/Desktop/INFO VISUAL/sentiment:instagram.xlsx")
