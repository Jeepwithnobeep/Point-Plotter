#install.packages("janitor") 
#install.packages("stringr")
library(janitor)
library(stringr)
df <- read.csv("FILENAME.csv",fileEncoding="UTF-8-BOM") #file encoding removed the "ï.. " issue
current <- 1 # variable for current column
xarr<-yarr<-colorarr<-c() # initialize x ,y, and color vector
df<-remove_empty(df, which = c("cols"), quiet = TRUE) # ignore white columns
colnames(df)<-str_replace(colnames(df), "X.", "#") # fix hexcode
for (i in df)
{
  color <- (colnames(df[current])) # assign column title to color
  plots<-df[,current] # read each plot under current color
  
  
  for (p in plots)
  {
    p<-strsplit(p,"\\,") # split points apart
    p<-as.numeric(unlist(p)) #convert list to numeric
    xarr<-c(xarr,p[1]) # put x in vector of x points
    yarr<-c(yarr,p[2]) # put y in vector of y points
    colorarr<-c(colorarr,color) # put color in color array
  }
  current <- current+1 # next column
}
plot(xarr,yarr,col=colorarr,pch=7,cex =2)



