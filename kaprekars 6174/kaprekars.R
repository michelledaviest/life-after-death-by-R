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

pad_num <- function(num){
  if(as.integer(log(as.integer(num),10)+1) == 4) return(as.integer(num))
  else pad_num(paste(num,0,sep=""))
}

mat = matrix(0, nrow=99, ncol=99)
for(i in 1:99){
  for(j in 1:99){
    mat[i,j] = kaprekars_steps(pad_num(paste(i,j,sep="")),0)
  }
}

image(1:99, 1:99, mat, asp = 1, axes = F, xlab ='', ylab ='')