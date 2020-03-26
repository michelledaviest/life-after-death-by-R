library(polynom)

plot.new ()
#op <- par ( mar = rep ( 0, 4 ) )
plot.window ( asp = 1, xlim = c( -2, +2 ), ylim = c( -2, +2 ) )
abline ( h = 0, v = 0, col = 'gray ', lwd = 0.5 )
symbols ( rep ( 0, 2 ), rep ( 0, 2 ), circles = c( 1, 2 ),
          inches = F, fg = 'gray ', lwd = 0.5 , add = T )

for(m in 11:1){
  roots = c(0)
  for(i in 0:(2**(m+1)-1)){
    #cat(i,"\n")
    z = as.integer(intToBits(i))[1:(m+1)]
    z[z==0] <- -1
    #append(roots, solve(polynomial(z)), after=length(roots))
    roots <- cbind( roots , polyroot( z ) )
  }
  points(x=Re(roots), y=Im(roots), pch=16, col="blue", cex = 0.001)
}

