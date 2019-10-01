covnames = c("log.CHL.4.mon7to9.",
             "log.CHL.4.mon1to3.",
             "log.CHL.4.mon10to12.")
covnames = c("log.CHL.4.mon7to9.",
             "log.CHL.4.mon1to3.",
             "log.CHL.4.mon10to12.")
covname <- covnames[1]
dat$cov0=dat[[paste(covname, "0", sep="")]]
dat$cov1=dat[[paste(covname, "1", sep="")]]
dat$cov1[dat$cov1==min(dat$cov1)]=NA
dat$cov1[dat$cov1==max(dat$cov1,na.rm=TRUE)]=NA
dat$cov1[dat$cov1==max(dat$cov1,na.rm=TRUE)]=NA
dat$cov1[dat$cov1==sort(dat$cov1)[2]]=NA
m2 = lm(nspawners0 ~ poly(nspawners1, 2, raw=TRUE) + cov0, data=dat)
m3 = lm(nspawners0 ~ poly(nspawners1, 2, raw=TRUE) + cov1, data=dat)
library(jtools)
par(mfrow=c(1,2))
p1 <- effect_plot(m2, pred = cov0, interval = TRUE, plot.points = TRUE, x.label=paste(covname, "0", sep=""), y.label="catch Jul-Sep")
p2 <- effect_plot(m3, pred = cov1, interval = TRUE, plot.points = TRUE, x.label=paste(covname, "1", sep=""), y.label="catch Jul-Sep")

covname <- covnames[2]
dat$cov0=dat[[paste(covname, "0", sep="")]]
dat$cov1=dat[[paste(covname, "1", sep="")]]
m2 = lm(nspawners0 ~ poly(nspawners1, 2, raw=TRUE) + cov0, data=dat)
m3 = lm(nspawners0 ~ poly(nspawners1, 2, raw=TRUE) + cov1, data=dat)
library(jtools)
par(mfrow=c(1,2))
p3 <- effect_plot(m2, pred = cov0, interval = TRUE, plot.points = TRUE, x.label=paste(covname, "0", sep=""), y.label="catch Jul-Sep")
p4 <- effect_plot(m3, pred = cov1, interval = TRUE, plot.points = TRUE, x.label=paste(covname, "1", sep=""), y.label="catch Jul-Sep")

covname <- covnames[3]
dat$cov0=dat[[paste(covname, "0", sep="")]]
dat$cov1=dat[[paste(covname, "1", sep="")]]
m2 = lm(nspawners0 ~ poly(nspawners1, 2, raw=TRUE) + cov0, data=dat)
m3 = lm(nspawners0 ~ poly(nspawners1, 2, raw=TRUE) + cov1, data=dat)
library(jtools)
par(mfrow=c(1,2))
p5 <- effect_plot(m2, pred = cov0, interval = TRUE, plot.points = TRUE, x.label=paste(covname, "0", sep=""), y.label="catch Jul-Sep")
p6 <- effect_plot(m3, pred = cov1, interval = TRUE, plot.points = TRUE, x.label=paste(covname, "1", sep=""), y.label="catch Jul-Sep")

gridExtra::grid.arrange(p1, p2, p3, p4, p5, p6, nrow = 3)


  

