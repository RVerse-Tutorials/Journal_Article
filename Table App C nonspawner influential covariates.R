dat=dat.nonspawners
Yr1 = min(dat$Year)
Yr2 = max(dat$Year)

covnames=c(
           "precip.gpcp.kerala.mon6to7.0", "precip.gpcp.kerala.mon4to5.0",
           "precip.gpcp.kerala.mon6to7.1", "precip.gpcp.kerala.mon4to5.1",
           "SST.UPW.4.mon6to9.0", "SST.2.10.mon6to9.0", "Bakun.UPW.mon6to9.0",
           "SST.UPW.4.mon6to9.1", "SST.2.10.mon6to9.1", "Bakun.UPW.mon6to9.1",
           "SST.2.10.mon3to5.0", "SST.2.10.mon3to5.1",
           "SST.2.10.mon10to12.1",
           "SST.2.10.3.yr.runsum.0",
           "ONI.mon1to12.0", "DMI.mon9to11.0",
           "ONI.mon1to12.1", "DMI.mon9to11.1")

dat=dat.nonspawners
m0 = gam(nspawners0 ~ s(nspawners1, sp=0.6) + s(spawners2, sp=0.6), data=dat)
res = data.frame(model="base", All=m0$aic)
for(cov in covnames){
  dat$cov=dat[[cov]]
  m0 = gam(nspawners0 ~ s(nspawners1, sp=0.6) + s(spawners2, sp=0.6) + cov, data=dat)
  tmp = data.frame(model=paste0("lm.", cov),All=m0$aic)
  res = rbind(res, tmp)
  m0 = gam(nspawners0 ~ s(nspawners1, sp=0.6) + s(spawners2, sp=0.6) + s(cov, sp=0.6), data=dat)
  tmp = data.frame(model=paste0("gam.", cov), All=m0$aic)
  res = rbind(res, tmp)
}

for(yr in 1984:2014){
  bad = yr
  dat2=dat
  dat2$nspawners0[dat$Year%in%bad]=NA
  #dat2$nspawners1[dat$Year%in%(bad+1)]=NA
  m0 = gam(nspawners0 ~ s(nspawners1, sp=0.6) + s(spawners2, sp=0.6), data=dat2)
  tmpres = data.frame(model="base",Year=m0$aic)

for(cov in covnames){
  dat2$cov=dat2[[cov]]
  m0 = gam(nspawners0 ~ s(nspawners1, sp=0.6) + s(spawners2, sp=0.6) + cov, data=dat2)
  tmp = data.frame(model=paste0("lm.", cov),Year=m0$aic)
  tmpres = rbind(tmpres, tmp)
  m0 = gam(nspawners0 ~ s(nspawners1, sp=0.6) + s(spawners2, sp=0.6) + s(cov, sp=0.6), data=dat2)
  tmp = data.frame(model=paste0("gam.", cov), Year=m0$aic)
  tmpres = rbind(tmpres, tmp)
}
  colnames(tmpres)=c("model", yr)
  res=cbind(res,tmpres[,2,drop=FALSE])
}


baseres=matrix(1,nrow(res),1)%*%matrix(as.numeric(res[1,2:ncol(res)]),nrow=1)
delaic=res[,2:ncol(res)]-baseres
rownames(delaic)=res$model
somegood = apply(delaic,1,function(x){any(x< -2)})
delaic[somegood,c("All","1994")]

#to do. Eliminate 1994 and repeat the removal analysis

