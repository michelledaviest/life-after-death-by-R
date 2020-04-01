N = 100
lambda=3
y.e = rexp(N,lambda)
y.g = rexp(2*N,lambda)
x = runif(3*N)
c = y.e
c = c(c,y.g)

plot(x=x[1:N],y=y.e, col="yellow",pch=20,
     xlab="horizontal coordinate",ylab="height from the surface",
     main="lambda=2, N=100",
  xlim=range(c(min(x),max(x))), ylim=range(c(min(c),max(c))))
par(new=TRUE)
plot(x=x[(N+1):length(x)],y=y.g, col="grey",pch=20,xlab="",ylab="",
     xlim=range(c(min(x),max(x))), ylim=range(c(min(c),max(c))))
