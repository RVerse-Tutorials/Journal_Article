oldpar=par(mfrow=c(1,2), mar=c(4,5,2,0))
dat=dat.nonspawners
# dat$nspawners0[dat$Year==1994]=NA
# dat$nspawners1[dat$Year==1995]=NA
# dat$nspawners2[dat$Year==1996]=NA
Yr1 = min(dat$Year)
Yr2 = max(dat$Year)
covnames=c("precip.gpcp.kerala.mon6to7.0", "ONI.mon1to12.1")
dat$cov0=dat[[covnames[1]]]
dat$cov1=dat[[covnames[2]]]
m1 = gam(nspawners0 ~ s(nspawners1, sp=0.6) + s(spawners2, sp=0.6) + s(cov0, sp=0.6), data=dat)
m2 = gam(nspawners0 ~ s(nspawners1, sp=0.6) + s(spawners2, sp=0.6) + s(cov1, sp=0.6), data=dat)
#cbind(dat$Year, residuals(m0), residuals(m1), residuals(m2))
plot(m1, select=3, xlab="Jun-Jul Precip", ylab="Effect")
legend("topleft","Oct-Mar Catch", bty="n")
abline(h=0, col="grey")
plot(m2, select=3, xlab="ONI prev year", ylab="Effect")
legend("topleft","Oct-Mar Catch", bty="n")
abline(h=0, col="grey")
abline(v=0, col="blue")
text(1.25,-2.5,"upwelling\ncoast colder\nthan offshore",pos=4)
#text(0,-2,"coast warmer\nthan offshore",pos=2)
par(oldpar)


oldpar=par(mfrow=c(1,2), mar=c(4,5,2,0))
dat=dat.nonspawners
# dat$nspawners0[dat$Year==1994]=NA
# dat$nspawners1[dat$Year==1995]=NA
# dat$nspawners2[dat$Year==1996]=NA
Yr1 = min(dat$Year)
Yr2 = max(dat$Year)
covnames=c("SST.UPW.4.mon10to12.1", "SST.2.10.mon10to12.1")
dat$cov0=dat[[covnames[1]]]
dat$cov1=dat[[covnames[2]]]
m1 = gam(nspawners0 ~ s(nspawners1, sp=0.6) + s(spawners2, sp=0.6) + s(cov0, sp=0.6), data=dat)
m2 = gam(nspawners0 ~ s(nspawners1, sp=0.6) + s(spawners2, sp=0.6) + s(cov1, sp=0.6), data=dat)
#cbind(dat$Year, residuals(m0), residuals(m1), residuals(m2))
plot(m1, select=3, xlab="Nearshore hotter than offshore prev year", ylab="Effect")
legend("topleft","Oct-Mar Catch", bty="n")
abline(h=0, col="grey")
abline(v=0, col="blue")
plot(m2, select=3, xlab="Hot nearshore prev year", ylab="Effect")
legend("topleft","Oct-Mar Catch", bty="n")
abline(h=0, col="grey")
abline(v=0, col="blue")
text(1.25,-2.5,"upwelling\ncoast colder\nthan offshore",pos=4)
#text(0,-2,"coast warmer\nthan offshore",pos=2)
par(oldpar)