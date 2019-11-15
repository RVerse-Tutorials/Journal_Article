m1=gam(spawners0 ~s(nspawners1, sp=0.6)+s(spawners1,sp=0.6), dat=dat.nonspawners)
m0=gam(spawners0 ~s(nspawners1, sp=0.6), dat=dat.nonspawners)

bad <- c(1986, 1994)
m2=gam(nspawners0 ~s(nspawners1, sp=0.6)+s(spawners2,sp=0.6), dat=subset(dat.nonspawners, !(Year%in%bad)))
m1=gam(nspawners0 ~s(nspawners1, sp=0.6)+s(spawners1,sp=0.6), dat=subset(dat.nonspawners, !(Year%in%bad)))
m0=gam(nspawners0 ~s(nspawners1, sp=0.6), dat=subset(dat.nonspawners, !(Year%in%bad)))
err1 <- SardineForecast:::loogam(m1)$err
err0 <- SardineForecast:::loogam(m0)$err
plot(subset(dat.nonspawners, !(Year%in%bad))$Year, err1)
points(subset(dat.nonspawners, !(Year%in%bad))$Year, err0, col="red")
c(SardineForecast:::loogam(m0)$RMSE,
SardineForecast:::loogam(m1)$RMSE,
SardineForecast:::loogam(m2)$RMSE)

c(SardineForecast:::loogam(m0, k=3, n=1000)$RMSE,
SardineForecast:::loogam(m1, k=3, n=1000)$RMSE,
SardineForecast:::loogam(m2, k=3, n=1000)$RMSE)

c(SardineForecast:::loogam(m0)$MdAE,
  SardineForecast:::loogam(m1)$MdAE,
  SardineForecast:::loogam(m2)$MdAE)

c(SardineForecast:::loogam(m0, k=3, n=1000)$MdAE,
  SardineForecast:::loogam(m1, k=3, n=1000)$MdAE,
  SardineForecast:::loogam(m2, k=3, n=1000)$MdAE)


df <- rbind(data.frame(model="m1", error=err1),data.frame(model="m0", error=err0))
ggplot(df, aes(error, fill = model)) + 
  geom_histogram(alpha = 0.5, aes(y = ..density..), position = 'identity')

plot(as.numeric(res2m.8694[7,2:33]))
points(as.numeric(res2m.8694[15,2:33]),col="red")
points(as.numeric(res2m.8694[6,2:33]),col="blue")

plot(as.numeric(res.8694[7,2:33]),ylim=c(.5,.8), type="l")
points(as.numeric(res.8694[15,2:33]),col="red")

plot(as.numeric(resm.8694[7,2:33]),ylim=c(.2,.5), type="l")
points(as.numeric(resm.8694[15,2:33]),col="red")
points(as.numeric(resm.8694[6,2:33]),col="blue")

plot(apply(res.all[,2:33],1,mean), ylim=c(.9,1.3))
points(apply(res.all[,2:33],1,median), col="red")

plot(apply(res.all[,2:33],2,mean), ylim=c(.5,1.3), pch=16)
points(apply(res.8694[,2:33],2,mean), col="blue")
points(apply(res.94[,2:33],2,mean), col="red", pch=16)
points(apply(res.all[,2:33],2,mean), col="black", pch=16)

plot(as.numeric(res.8694[7,2:33]),ylim=c(.35,1.55), type="l")
lines(as.numeric(res.8694[15,2:33]),col="red")
lines(as.numeric(res.all[7,2:33]),col="black")
lines(as.numeric(res.all[15,2:33]),col="red")

plot(as.numeric(resm.8694[7,2:33]),ylim=c(.25,.4), type="l")
lines(as.numeric(resm.8694[15,2:33]),col="red")
lines(as.numeric(resm.all[7,2:33]),col="black")
lines(as.numeric(resm.all[15,2:33]),col="red")

plot(apply(res.8694[,2:33],1,mean),ylim=c(.3,.8))
lines(apply(resm.8694[,2:33],1,mean))
points(c(7,11),apply(resm.8694[,2:33],1,mean)[c(7,11)], pch=3)
points(c(7,11),apply(res.8694[,2:33],1,mean)[c(7,11)], pch=3)

plot(apply(res.all[,2:33],1,mean),ylim=c(.3,1.3))
lines(apply(resm.all[,2:33],1,mean))
points(7,apply(resm.all[,2:33],1,mean)[7], pch=3)
points(7,apply(res.all[,2:33],1,mean)[7], pch=3)

plot(apply(res.94[,2:33],1,mean),ylim=c(.3,.8))
lines(apply(resm.94[,2:33],1,mean))
points(c(7,11),apply(res.94[,2:33],1,mean)[c(7,11)], pch=3)
points(c(7,11),apply(resm.94[,2:33],1,mean)[c(7,11)], pch=3)

res <- nspawnerinf(rmyr)
plot(apply(res[,2:33],1,mean))
res <- nspawnerinf()
plot(apply(res[,2:33],1,mean))

ms <- seq(2,13,1)
m2 <- res
boxplot(t(m2[ms,3:33]), horizontal=TRUE, names=m2$model[ms], las=2, 
        cex.axis=0.75, pars=list(par(mar=c(5,15,2,2))))
