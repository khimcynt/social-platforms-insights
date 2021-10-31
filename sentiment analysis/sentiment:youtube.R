youtube <- read.csv("/Users/chanyanutsuteerayongprasert/Desktop/INFO VISUAL/YouTube_Data.csv")
youtubes <- youtube[,c(12,16,17,18)]
names(youtubes)
sum(youtubes$comment)
nrow(youtubes)

d <- 123455
youtubes$comment[d] == youtubes$positive[d]+youtubes$negative[d]+youtubes$neutral[d]
x <- 0

for(i in 1:nrow(youtubes)){
  a <- youtubes$comment[i] == youtubes$positive[i]+youtubes$negative[i]+youtubes$neutral[i]
  if(a == 'FALSE'){
    x <- c(x,i)
  } 
}
youtubes <- youtubes[-x,]
View(youtubes)
install.packages("writexl")
library(writexl)
write_xlsx(youtubes,"/Users/chanyanutsuteerayongprasert/Desktop/INFO VISUAL/sentiment:youtube.xlsx")