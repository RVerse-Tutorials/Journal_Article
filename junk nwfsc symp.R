xmin=10.5; xmax=13
dat=dat.nonspawners
m0 = gam(nspawners0 ~ spawners0, data=dat)
dat=dat.nonspawners.nocov
dat=dat[dat$Year<1983,]
fitnsp = predict(m0,newdata=dat[,c("spawners0"),drop=FALSE])
#fitnsp = dat$spawners1
nsp0 = dat$nspawners0
plot(nsp0,fitnsp,ylim=c(xmin,xmax),xlim=c(xmin,xmax))
lines(c(xmin,xmax),c(xmin,xmax))
1-sum((nsp0-fitnsp)^2)/sum((nsp0-mean(nsp0))^2)

dat=dat.nonspawners.nocov
dat=dat[dat$Year<1990 & dat$Year>1970,]
m1 = lm(nspawners0 ~ Catch1, data=dat)
c(coef(m1),summary(m1)$r.squared)

dat=dat.nonspawners.nocov
dat=dat[dat$Year<1990 & dat$Year>1970,]
dat$Catch1m=dat$Catch1-mean(dat$Catch1)
dat$
  m1 = lm(nspawners0 ~ Catch1m, data=dat)
c(mean(dat$Catch1),coef(m1),summary(m1)$r.squared)

dat=dat.nonspawners.nocov
rs = dat; rs$resid=NA; rs$fitted=NA
for(i in 20:(nrow(dat)-1)){
  tmp = dat[(i-19):i,]
  m1 = ets(tmp$nspawners0, model="ANN")
  rs$fitted[i+1]=predict(m1, h=1)$mean
  rs$resid[i+1]=dat$nspawners0[i+1]-predict(m1, h=1)$mean
}
plot(rs$nspawners0, rs$fitted, xlim=c(4,13), ylim=c(4,13))
fit = lm(nspawners0~rs$fitted, data=rs); summary(fit)
dat=na.omit(rs)
m2=gam(resid ~ s(SST.UPW.4.mon10to12.1, sp=0.6), data=dat); summary(m2)
m2=gam(resid ~ s(SST.4.mon7to9.0, sp=0.6), data=dat); summary(m2)

dat=dat.nonspawners.nocov
rs = dat; rs$resid=NA; rs$fitted=NA
for(i in 20:(nrow(dat)-1)){
  tmp = dat[(i-19):i,]
  rs$fitted[i+1]=dat$nspawners0[i]
  rs$resid[i+1]=dat$nspawners0[i+1]-rs$fitted[i+1]
}
plot(rs$nspawners0, rs$fitted, xlim=c(4,13), ylim=c(4,13))
fit = lm(nspawners0~rs$fitted, data=rs); summary(fit)

dat=na.omit(rs)
m2=gam(resid ~ s(SST.UPW.4.mon7to9.0, sp=0.6), data=dat)

dat=dat.nonspawners.nocov
rs = dat.nonspawners.nocov; rs$resid=NA; rs$fitted=NA
for(i in 20:(nrow(dat)-1)){
  tmp = dat[(i-19):i,]
  m1 = gam(nspawners0 ~ s(nspawners1,sp=0.6) + spawners2, data=tmp)
  rs$fitted[i+1]=predict(m1, newdata=data.frame(nspawners1=dat$nspawners1[i+1],spawners2=dat$spawners2[i+1]))
  rs$resid[i+1]=dat$nspawners0[i+1]-rs$fitted[i+1]
  m1 = gam(nspawners0 ~ s(nspawners1,sp=0.6), data=tmp)
}
par(mfrow=c(1,2))
dat=na.omit(rs)
plot(dat$nspawners0, dat$fitted, xlim=c(6.5,13.5), ylim=c(6.5,13.5),xlab="Catch Oct-Mar",ylab="Prediction")
fit = lm(nspawners0~-1+fitted, data=dat); 
abline(fit)
title("Out of sample forecast\nwith prior yr catches")
m2=gam(resid ~ s(SST.UPW.4.mon10to12.1, sp=0.6), data=dat)
plot(dat$nspawners0, dat$nspawners0+residuals(m2), xlim=c(6.5,13.5), ylim=c(6.5,13.5),xlab="Catch Oct-Mar",ylab="Prediction")
lines(c(1,20),c(1,20))
title("Forecast improvement with\nOct to Dec upwelling")

m2=gam(resid ~ s(SST.UPW.4.mon10to12.1, sp=0.6), data=dat); summary(m2)
plot(dat$nspawners0, dat$nspawners0+residuals(m2), xlim=c(6.5,13), ylim=c(6.5,13),xlab="Catch Oct-Mar",ylab="Prediction")
lines(c(1,20),c(1,20))

m2=gam(resid ~ s(SST.4.mon7to9.0, sp=0.6) + s(SST.UPW.4.mon10to12.1, sp=0.6), data=dat); summary(m2)
plot(dat$nspawners0, dat$nspawners0+residuals(m2), xlim=c(6.5,13), ylim=c(6.5,13),xlab="Catch Oct-Mar",ylab="Prediction")
lines(c(1,20),c(1,20))

dat=na.omit(rs)
m2=gam(resid ~ s(SST.UPW.4.mon10to12.1, sp=0.6), data=dat); summary(m2)
m2=gam(resid ~ s(SST.4.mon7to9.0, sp=0.6), data=dat); summary(m2)
m2=gam(resid ~ s(SST.4.mon7to9.0, sp=0.6) + s(SST.UPW.4.mon10to12.1, sp=0.6), data=dat); summary(m2)
plot(dat$resid, fitted(m2))
m2=gam(resid ~ s(spawners0, sp=0.6), data=dat); summary(m2)

dat=dat.nonspawners.nocov
dat=dat[dat$Year>1982,]
rs = dat; rs$resid=NA; rs$fitted=NA
for(i in 20:(nrow(dat)-1)){
  tmp = dat[(i-19):i,]
  m1 = gam(nspawners0 ~ s(nspawners1,sp=0.6) + spawners2, data=tmp)
  rs$fitted[i+1]=predict(m1, newdata=data.frame(nspawners1=dat$nspawners1[i+1],spawners2=dat$spawners2[i+1]))
  rs$resid[i+1]=dat$nspawners0[i+1]-rs$fitted[i+1]
  #m1 = gam(nspawners0 ~ s(nspawners1,sp=0.6), data=tmp)
}
plot(rs$fitted, rs$nspawners0,ylim=c(11,13))
dat=na.omit(rs)
m2=gam(resid ~ s(SST.UPW.4.mon10to12.1, sp=0.6), data=dat); summary(m2)
m2=gam(resid ~ s(SST.4.mon7to9.0, sp=0.6), data=dat); summary(m2)
m2=gam(resid ~ s(SST.4.mon7to9.0, sp=0.6) + s(SST.UPW.4.mon10to12.1, sp=0.6), data=dat); summary(m2)
plot(dat$resid, fitted(m2))
m2=gam(resid ~ s(spawners0, sp=0.6), data=dat); summary(m2)

###################

jig=.3 #keep of the legend
par(mfrow=c(1,1), mar=c(4,6,1,0))
dat=dat.nonspawners
Yr1 = min(dat$Year)
Yr2 = max(dat$Year)
covnames=c("SST.4.mon7to9.0", "SST.UPW.4.mon10to12.1")
covtits =  c("Jul-Sep SST current season", "Oct-Dec UPW prior season")
dat$cov0=dat[[covnames[1]]]
dat$cov1=dat[[covnames[2]]]
m0 = gam(nspawners0 ~ s(nspawners1, sp=0.6) + s(spawners2, sp=0.6), data=dat)
m1 = gam(nspawners0 ~ s(nspawners1, sp=0.6) + s(spawners2, sp=0.6) + s(cov0, sp=0.6), data=dat)
m2 = gam(nspawners0 ~ s(nspawners1, sp=0.6) + s(spawners2, sp=0.6) + s(cov1, sp=0.6), data=dat)
m3 = gam(nspawners0 ~ s(nspawners1, sp=0.6) + s(spawners2, sp=0.6) + s(cov0, sp=0.6) + cov1, data=dat)
# m2$model=exp(m2$model); m2$fitted.values=exp(m2$fitted.values)
# m0$model=exp(m0$model); m0$fitted.values=exp(m0$fitted.values)
xmin=min(m0$model[,"nspawners0"],m0$fitted.values,m3$fitted.values)
xmax=jig+max(m0$model[,"nspawners0"],m0$fitted.values,m3$fitted.values)
plot(m0$model[,"nspawners0"],m0$fitted.values, xlim=c(xmin,xmax), ylim=c(xmin,xmax),
     xlab="Log catch in non-spawning months", ylab="Predicted log catch\nwithout covariates")
lines(c(xmin,xmax-jig),c(xmin,xmax-jig))
legend("topleft",paste("R2 =",round(100*summary(m0)$r.sq,digits=1)), bty="n")
legend("topright","C", bty="n")

plot(m3$model[,"nspawners0"],m3$fitted.values, xlim=c(xmin,xmax), ylim=c(xmin,xmax),
     xlab="Log catch in non-spawning months", ylab="Predicted log catch\nwith covariates")
lines(c(xmin,xmax-jig),c(xmin,xmax-jig))
legend("topleft",paste("R2 =",round(100*summary(m3)$r.sq,digits=1)), bty="n")

##############
reg="Kerala"
dat=data.frame(nspawners0=log(oilsardine_qtr[[reg]]))
rs = dat; rs$resid=NA; rs$fitted=NA
for(i in 40:(nrow(dat)-1)){
  tmp = dat[(i-39):i,]
  tmp=ts(tmp, frequency=4)
  m1 = ets(tmp, model="AAA")
  rs$fitted[i+1]=predict(m1, h=1)$mean
  rs$resid[i+1]=dat$nspawners0[i+1]-predict(m1, h=1)$mean
}
plot(rs$nspawners0,type="l",ylim=c(4,12),lwd=2,xlab="",ylab="Catch (1000 kg)")
lines(rs$fitted,type="l",col="blue", lwd=2)

reg="Kerala"
dat=data.frame(nspawners0=log(oilsardine_qtr[[reg]]))
rs = dat; rs$resid=NA; rs$fitted=NA
for(i in 40:(nrow(dat)-1)){
  tmp = dat[(i-39):i,]
  tmp=ts(tmp, frequency=4)
  m1 = ets(tmp, model="AAA")
  rs$fitted[i+5]=predict(m1, h=5)$mean
  rs$resid[i+5]=dat$nspawners0[i+1]-predict(m1, h=5)$mean
}
plot(rs$nspawners0,type="l",ylim=c(4,12),lwd=2,xlab="",ylab="Catch (1000 kg)")
lines(rs$fitted,type="l",col="red", lwd=2)
plot(dat.chl$log.CHL.4.mon7to9.0, dat.chl$SST.4.mon7to9.0)
summary(lm(dat.chl$log.CHL.4.mon7to9.0~ dat.chl$SST.4.mon7to9.0))
