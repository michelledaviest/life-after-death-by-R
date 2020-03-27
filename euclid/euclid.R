#normal euclidean algorithm with number of steps
gcd <- function(num1,num2) {
  if(num1==0|num2==0) return(data.frame("gcd"=0,"steps"=0))
  else if(num2>num1) gcd(num2,num1)
  else{
    steps = 0 
    while(num2 != 0){
      r = num1%%num2
      num1 = num2
      num2 = r
      steps = steps + 1
    }
    return(data.frame("gcd"=num1,"steps"=steps))
  }
}

#cat(gcd(54,888)$gcd,"\n")
#cat(gcd(54,888)$steps)

#exercise A - visualize coprimes
n = 12
mat.gcd = matrix(0, nrow=n, ncol=n)
mat.steps = matrix(0, nrow=n, ncol=n)
mat = matrix(0, nrow=n, ncol=n)
for(a in 1:n){
  for(b in 1:n){
    df = gcd(a,b)
    mat.gcd[a,b] = df$gcd
    mat.steps[a,b] = df$steps
  }
  cat("\n")
}

library('plot.matrix')
plot(mat.gcd)
plot(mat.steps)
