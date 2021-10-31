youtube <- read.csv("/Users/chanyanutsuteerayongprasert/Desktop/INFO VISUAL/YouTube_Data.csv")
x <- 0
View(youtube)
for(i in 1:nrow(youtube)){
  a <- youtube$comment[i] == youtube$positive[i]+youtube$negative[i]+youtube$neutral[i]
  if(a == 'FALSE'){
    x <- c(x,i)
  } 
}
youtube1 <- youtube[-x,]
View(youtube1)

youtube2 <- youtube1 %>% distinct(link, .keep_all = TRUE) 
n <- unique(youtube$link)
w <- 0
for(i in 1:nrow(youtube2)){
  if(youtube2$fan[i] == '0'){
    w <- c(w,i)
  } 
}
youtube3 <- youtube2[-w,]
which(youtube3$fan=='0')

write_xlsx(youtube3,"/Users/chanyanutsuteerayongprasert/Desktop/INFO VISUAL/data cleaning/Youtube.xlsx")
