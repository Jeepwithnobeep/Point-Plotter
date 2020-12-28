#install.packages("janitor") 
library(janitor)
df <- read.csv("file.csv",fileEncoding="UTF-8-BOM") #file encoding removed the "ï.. " issue
current <- 1 # variable for current column
xarr<-yarr<-colorarr<-c() # initialize x and y vector
df<-remove_empty(df, which = c("cols"), quiet = TRUE) # ignore white columns
for (i in df)
{
  color <- (colnames(df[current])) # assign column title to color
  plots<-df[,current] # read each plot under current color

  
  for (p in plots)
  {
    p<-strsplit(p,"\\,") # split points apart
    p<-as.numeric(unlist(p)) #convert list to numeric
    x<-p[1] # get x
    y<-p[2] # get y
    xarr<-c(xarr,x) # put x in vector of x points
    yarr<-c(yarr,y) # put y in vector of y points
    colorarr<-c(colorarr,color)
  }
  current <- current+1
}
plot(xarr,yarr,col=colorarr,pch=19)



