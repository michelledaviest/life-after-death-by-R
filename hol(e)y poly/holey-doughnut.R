library(plotrix)
library(RColorBrewer)

plot.new()
op <- par(mar =rep ( 0, 4 ) )
plot.window(asp = 1, xlim = c(-2,+2 ), ylim = c(-2,+2 ))
abline( h = 0, v = 0, col = 'gray', lwd = 0.5 )
draw.circle(0,0,1, border="gray")
draw.circle(0,0,2, border="gray")

cols = brewer.pal(n = 8, name = "RdBu")
k = length(col)

for(m in 11:1){
  roots = c(0)
  for(i in 0:(2**(m+1)-1)){
    #cat(i,"\n")
    temp = as.integer(intToBits(i))[1:(m+1)]
    temp[temp==0] <- -1
    #append(roots, solve(polynomial(z)), after=length(roots))
    roots <- cbind(roots,polyroot(temp))
  }
  points(x=Re(roots), y=Im(roots), pch=16, col=cols[k], cex = 0.001)
  k=k-1
}

