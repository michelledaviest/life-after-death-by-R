digit <- function(num,vec){
  if(num==0) return(rev(vec))
  else return(digit(as.integer(num/10),c(vec,num%%10)))
}

arrange <- function(num,decreasing=FALSE){
  digits = digit(num,c())
  digits = sort(digits,decreasing)
  num = ""
  for(i in 1:length(digits)){
    num = paste(num,digits[i],sep="")
  }
  return(as.integer(num))
}

kaprekars_steps <- function(num,step){
  if(length(unique(digit(num,c())))==1) return(0)
  if(num==6174) return(step)
  num_a = arrange(num)
  num_d = arrange(num,TRUE)
  kaprekars_steps(num_d-num_a,step+1)
}

cat(kaprekars_steps(9218,0),"\n")
cat(kaprekars_steps(9090,0),"\n")
cat(kaprekars_steps(2222,0),"\n")