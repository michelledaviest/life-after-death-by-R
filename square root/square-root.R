#babylonian method
S = 2
prev = 0.1
current = 0
while(TRUE){
  current = 0.5*(prev + (S/prev))
  #cat(current,"\n")
  if(round(current,2) == round(prev,2)){ 
    break 
  } 
  else{
    prev = current
  }
}
cat(current)

cat("\nindian method")
#indian method
prev = 0.1
current = 0
while(TRUE){
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
