library(polynom)
a = 108
b = 102
p = polynomial(c(a*a,a*-1,-2*b,-1,1))
sol = Re(solve(polynomial(p)))
sol = sol[which(sol>0)]
plot(p,
     xlim=range(c(-11,13)),
     ylim=range(c(-2560,12560)))
par(new=TRUE)
abline(h=0,col="red")
par(new=TRUE)
abline(v=sol,col="blue")