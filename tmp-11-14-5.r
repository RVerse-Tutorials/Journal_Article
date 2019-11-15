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