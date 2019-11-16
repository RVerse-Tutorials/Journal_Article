df3 <- dat.nonspawners
df3$nspawners0[df3$Year==1994]=NA
fit1 <- MARSS(df3$nspawners0, model=list(U=matrix(0)), silent=TRUE, method="BFGS")
fit1$AICc
vals=c()
for(cov in colnames(df3)[10:37]){
covs = matrix(df3[[cov]], nrow=1)
fit2 <- MARSS(df3$nspawners0, model=list(U=matrix(0),d=covs), silent=TRUE, method="BFGS")
vals=c(vals, fit2$AICc)
}

valsc=vals

colnames(df3)[10:37][vals<(fit1$AICc-2)]
(vals-fit1$AICc)[which(vals<(fit1$AICc-2))]

plot(df3$Year, df3$nspawners0, pch=16)
lines(df3$Year, fitted(fit1, one.step.ahead=TRUE))


"SST.UPW.4.mon6to9.0"
  covs = matrix(df3[["SST.2.10.3.yr.runsum.0"]], nrow=1)
  fit2 <- MARSS(df3$nspawners0, model=list(U=matrix(0),d=covs), silent=TRUE, method="BFGS")
  fit2$AICc
  plot(df3$Year, df3$nspawners0, pch=16)
lines(df3$Year, fitted(fit2, one.step.ahead=TRUE))
lines(df3$Year, fitted(fit1, one.step.ahead=TRUE), col="red")

plot(df3$Year, df3$nspawners0, pch=16)
lines(df3$Year, fitted(fit2))
lines(df3$Year, fitted(fit1), col="red")

plot(df3$Year, df3$nspawners0, pch=16)
lines(df3$Year, fit2$states)
lines(df3$Year, fit1$states, col="red")

mm <- (fitted(fit2, one.step.ahead=TRUE)+fitted(fit1, one.step.ahead=TRUE))/2
sqrt(mean((df3$nspawners0-fitted(fit1, one.step.ahead=TRUE))^2, na.rm=TRUE))
sqrt(mean((df3$nspawners0-fitted(fit2, one.step.ahead=TRUE))^2, na.rm=TRUE))

# "Bakun.UPW.mon6to9.0"    "SST.2.10.3.yr.runsum.0" "ONI.mon1to12.0" 
# have del aicc -2.547598 -7.006490 -2.653952 rel to mod w no covs. mod with d



##################################
library(MARSS)
df3 <- na.omit(dforig)
#df3 <- subset(df3, Year>1970)
df3$nspawners0[df3$Year==1994]=NA
fit0 <- MARSS(df3$nspawners0, model=list(U=matrix(0)), silent=TRUE, method="BFGS")

Zt = array(NA, dim=c(1,1,length(df3$spawners1)))
Zt[1,1,] = df3$nspawners1
A=matrix("intercept")
R=matrix("r")
Q=diag(.001,1)
inits.list = list(x0=matrix(c(1), nrow=1))
modlist = list(Z=Zt, Q=Q, U=matrix(0, 1, 1), B=diag(1), A=A, R=R)
fit2 <- MARSS(df3$nspawners0, model=modlist, silent=TRUE, method="BFGS", inits=inits.list)

#linear wr nsapwners1
modlist = list(Z=Zt, U=matrix(0, 1, 1), A=A, Q=matrix(0))
fit1 <- MARSS(df3$nspawners0, model=modlist, silent=TRUE, method="BFGS")

#linear wr poly(nsapwners1,3)
Zt = array(NA, dim=c(1,3,length(df3$spawners1)))
Zt[1,1,] = poly(df3$nspawners1,3)[,1]
Zt[1,2,] = poly(df3$nspawners1,3)[,2]
Zt[1,3,] = poly(df3$nspawners1,3)[,3]
A=matrix("intercept")
R=matrix("r")
Q=diag(0,dim(Zt)[2])
inits.list = list(x0=matrix(1, nrow=dim(Zt)[2]))
modlist = list(Z=Zt, Q=Q, U=matrix(0, 1, dim(Zt)[2]), A=A)
#fit3 <- MARSS(df3$nspawners0, model=modlist, silent=TRUE, method="BFGS", inits=inits.list)
fit3 <- MARSS(df3$nspawners0, model=modlist, silent=TRUE, inits=inits.list)

c(fit0$AICc, fit1$AICc, fit2$AICc, fit3$AICc)

errnull = (df3$nspawners0 - df3$nspawners1)
err0=(df3$nspawners0-fitted(fit0, one.step.ahead=TRUE))[1,]
err1=(df3$nspawners0-fitted(fit1, one.step.ahead=TRUE))[1,]
err2=(df3$nspawners0-fitted(fit2, one.step.ahead=TRUE))[1,]
err3=(df3$nspawners0-fitted(fit3, one.step.ahead=TRUE))[1,]
err = cbind(errnull, err0, err1, err2, err3)
apply(err, 2, function(x){sqrt(mean(x^2, na.rm=TRUE))})
apply(err, 2, function(x){sqrt(median(x^2, na.rm=TRUE))})

err0=(df3$nspawners0-fitted(fit0))[1,]
err1=(df3$nspawners0-fitted(fit1))[1,]
err2=(df3$nspawners0-fitted(fit2))[1,]
err3=(df3$nspawners0-fitted(fit3))[1,]
err = cbind(errnull, err0, err1, err2, err3)
apply(err, 2, function(x){sqrt(mean(x^2, na.rm=TRUE))})
apply(err, 2, function(x){sqrt(median(x^2, na.rm=TRUE))})


plot(df3$Year, df3$nspawners0, pch=16)
lines(df3$Year, fitted(fit2, one.step.ahead=TRUE))
lines(df3$Year, fitted(fit1, one.step.ahead=TRUE), col="red")

plot(df3$Year, df3$nspawners0, pch=16)
lines(df3$Year, fitted(fit2))
lines(df3$Year, fitted(fit1), col="red")
lines(df3$Year, fitted(fit0), col="blue")
lines(df3$Year, fitted(fit3), col="green")


plot((df3$nspawners0-fitted(fit1, one.step.ahead=TRUE))[1,])
points((df3$nspawners0-fitted(fit2, one.step.ahead=TRUE))[1,], col="red")

plot(df3$Year, df3$nspawners0, pch=16)
lines(df3$Year, fitted(fit2, one.step.ahead=TRUE))
lines(df3$Year, fitted(fit1, one.step.ahead=TRUE), col="red")
lines(df3$Year, fitted(fit0, one.step.ahead=TRUE), col="blue")
lines(df3$Year, fitted(fit3, one.step.ahead=TRUE), col="green")

plot(df3$Year, df3$nspawners0, pch=16)
lines(df3$Year, fitted(fit2, one.step.ahead=TRUE))
lines(df3$Year, fitted(fit0, one.step.ahead=TRUE), col="blue")

plot(df3$Year, df3$nspawners0, pch=16)
lines(df3$Year, fitted(fit2), lwd=2)
lines(df3$Year, fitted(fit0), lwd=2)
lines(df3$Year, fitted(fit2, one.step.ahead=TRUE), col="blue", lwd=2)
lines(df3$Year, fitted(fit0, one.step.ahead=TRUE), col="blue", lwd=2)