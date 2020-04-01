S = 125348

#babylonian method
prev = 0.1
current = 0
list.b = c()
while(TRUE){
  list.b = c(list.b,prev)
  current = 0.5*(prev + (S/prev))
  #cat(current,"\n")
  if(round(current,2) == round(prev,2)){ 
    break 
  } 
  else{
    prev = current
  }
}
cat(current,"\n")
#cat(list.b)

cat("\nindian method")
#indian method
prev = 0.1
current = 0
list.i = c()
while(TRUE){
  list.i = c(list.i,prev)
  an = (S - prev*prev)/(2*prev)
  current = prev + an + 0.5*((an*an)/(prev+an))
  if(round(current,5) == round(prev,5)){ 
    break 
  } 
  else{
    prev = current
  }
}
cat("\n",current)
#cat(list.i)



plot(x=1:length(list.b),y=list.b, 
     xlim=range(c(1,35)), 
     ylim=range(c(0,max(list.i))),
     xlab="step",
     ylab="value",
     col="red",pch=20)
par(new=TRUE)
plot(x=1:length(list.i),y=list.i, 
     xlim=range(c(1,35)), 
     ylim=range(c(0,max(list.i))),
     xlab="",ylab="",
     col="blue",pch=20)
