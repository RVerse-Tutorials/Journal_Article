#need to run setup first


covnames=c("nspawners1", "spawners1",
           "nspawners2", "spawners2")

tests=list(c(2),c(2,4),c(1),c(1,3),c(2,3), c(1,4),c(1,2))
## SPAWNERS
dat=dat.spawners
m0 = gam(spawners0 ~ 1, data=dat)
res = data.frame(model="base", All=m0$aic)
for(val in tests){
  if(length(val)==1){
  dat$cov1=dat[[covnames[val[1]]]]
  m0 = gam(spawners0 ~ cov1, data=dat)
  tmp = data.frame(model=paste0("lm.", covnames[val[1]]),All=m0$aic)
  res = rbind(res, tmp)
  m0 = gam(spawners0 ~ s(cov1, sp=0.6), data=dat)
  tmp = data.frame(model=paste0("gam.", covnames[val[1]]), All=m0$aic)
  res = rbind(res, tmp)
  }else{
    dat$cov1=dat[[covnames[val[1]]]]
    dat$cov2=dat[[covnames[val[2]]]]
    m0 = gam(spawners0 ~ cov1 + cov2, data=dat)
    tmp = data.frame(model=paste0("lm.", covnames[val[1]], ".", covnames[val[2]]), All=m0$aic)
    res = rbind(res, tmp)
    m0 = gam(spawners0 ~ s(cov1,sp=0.6) + s(cov2,sp=0.6), data=dat)
    tmp = data.frame(model=paste0("gam.", covnames[val[1]], ".", covnames[val[2]]), All=m0$aic)
    res = rbind(res, tmp)
  }
}

for(yr in 1984:2014){
  bad = yr
  dat2=dat
  dat2$spawners0[dat$Year%in%bad]=NA
  #dat2$nspawners1[dat$Year%in%(bad+1)]=NA
  m0 = gam(spawners0 ~ 1, data=dat2)
  tmpres = data.frame(model="base",All=m0$aic)
  
  for(val in tests){
    if(length(val)==1){
      dat2$cov1=dat[[covnames[val[1]]]]
      m0 = gam(spawners0 ~ cov1, data=dat2)
      tmp = data.frame(model=paste0("lm.", covnames[val[1]]),All=m0$aic)
      tmpres = rbind(tmpres, tmp)
      m0 = gam(spawners0 ~ s(cov1, sp=0.6), data=dat2)
      tmp = data.frame(model=paste0("gam.", covnames[val[1]]), All=m0$aic)
      tmpres = rbind(tmpres, tmp)
    }else{
      dat2$cov1=dat[[covnames[val[1]]]]
      dat2$cov2=dat[[covnames[val[2]]]]
      m0 = gam(spawners0 ~ cov1 + cov2, data=dat2)
      tmp = data.frame(model=paste0("lm.", covnames[val[1]], ".", covnames[val[2]]), All=m0$aic)
      tmpres = rbind(tmpres, tmp)
      m0 = gam(spawners0 ~ s(cov1,sp=0.6) + s(cov2,sp=0.6), data=dat2)
      tmp = data.frame(model=paste0("gam.", covnames[val[1]], ".", covnames[val[2]]), All=m0$aic)
      tmpres = rbind(tmpres, tmp)
    }
  }
  colnames(tmpres)=c("model", yr)
  res=cbind(res,tmpres[,2,drop=FALSE])
}


baseres=matrix(1,nrow(res),1)%*%matrix(as.numeric(res[1,2:ncol(res)]),nrow=1)
delaic=res[,2:ncol(res)]-baseres
rownames(delaic)=res$model
somegood = apply(delaic,1,function(x){any(x< -2)})
#test if any model better than lm(nspawners1)
any(apply(delaic,2,function(x){x-x[6]})< -2)
#test if any model better than gam(nspawners1)
any(apply(delaic,2,function(x){x-x[7]})< -2)


#NON-SPAWNERS
dat=dat.nonspawners
m0 = gam(nspawners0 ~ 1, data=dat)
res = data.frame(model="base", All=m0$aic)
for(val in tests){
  if(length(val)==1){
    dat$cov1=dat[[covnames[val[1]]]]
    m0 = gam(nspawners0 ~ cov1, data=dat)
    tmp = data.frame(model=paste0("lm.", covnames[val[1]]),All=m0$aic)
    res = rbind(res, tmp)
    m0 = gam(nspawners0 ~ s(cov1, sp=0.6), data=dat)
    tmp = data.frame(model=paste0("gam.", covnames[val[1]]), All=m0$aic)
    res = rbind(res, tmp)
  }else{
    dat$cov1=dat[[covnames[val[1]]]]
    dat$cov2=dat[[covnames[val[2]]]]
    m0 = gam(nspawners0 ~ cov1 + cov2, data=dat)
    tmp = data.frame(model=paste0("lm.", covnames[val[1]], ".", covnames[val[2]]), All=m0$aic)
    res = rbind(res, tmp)
    m0 = gam(nspawners0 ~ s(cov1,sp=0.6) + s(cov2,sp=0.6), data=dat)
    tmp = data.frame(model=paste0("gam.", covnames[val[1]], ".", covnames[val[2]]), All=m0$aic)
    res = rbind(res, tmp)
  }
}

for(yr in 1984:2014){
  bad = yr
  dat2=dat
  dat2$nspawners0[dat$Year%in%bad]=NA
  #dat2$nspawners1[dat$Year%in%(bad+1)]=NA
  m0 = gam(nspawners0 ~ 1, data=dat2)
  tmpres = data.frame(model="base",All=m0$aic)
  
  for(val in tests){
    if(length(val)==1){
      dat2$cov1=dat[[covnames[val[1]]]]
      m0 = gam(nspawners0 ~ cov1, data=dat2)
      tmp = data.frame(model=paste0("lm.", covnames[val[1]]),All=m0$aic)
      tmpres = rbind(tmpres, tmp)
      m0 = gam(nspawners0 ~ s(cov1, sp=0.6), data=dat2)
      tmp = data.frame(model=paste0("gam.", covnames[val[1]]), All=m0$aic)
      tmpres = rbind(tmpres, tmp)
    }else{
      dat2$cov1=dat[[covnames[val[1]]]]
      dat2$cov2=dat[[covnames[val[2]]]]
      m0 = gam(nspawners0 ~ cov1 + cov2, data=dat2)
      tmp = data.frame(model=paste0("lm.", covnames[val[1]], ".", covnames[val[2]]), All=m0$aic)
      tmpres = rbind(tmpres, tmp)
      m0 = gam(nspawners0 ~ s(cov1,sp=0.6) + s(cov2,sp=0.6), data=dat2)
      tmp = data.frame(model=paste0("gam.", covnames[val[1]], ".", covnames[val[2]]), All=m0$aic)
      tmpres = rbind(tmpres, tmp)
    }
  }
  colnames(tmpres)=c("model", yr)
  res=cbind(res,tmpres[,2,drop=FALSE])
}


baseres=matrix(1,nrow(res),1)%*%matrix(as.numeric(res[1,2:ncol(res)]),nrow=1)
delaic=res[,2:ncol(res)]-baseres
rownames(delaic)=res$model
somegood = apply(delaic,1,function(x){any(x< -2)})
#test if any model better than gam(nspawners1)+gam(spawners2)
any(apply(delaic,2,function(x){x-x[13]})< -2)
#NO
#test if any model better than gam(nspawners1) other than 
#gam(nspawners1)+gam(spawners2)
#NO
any(apply(delaic[-13,],2,function(x){x-x[7]})< -2)

#to do. Eliminate 1994 and repeat the removal analysis

