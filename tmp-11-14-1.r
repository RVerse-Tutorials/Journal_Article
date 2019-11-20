load("basemodsloo.RData")
res2 <- spawnerinf(resfun="loo")
res <- nspawnerinf(resfun="loo")
res2.9495 <- spawnerinf(c(1994,1995), resfun="loo")
res.9495 <- nspawnerinf(c(1994,1995), resfun="loo")
res2.86879495 <- spawnerinf(c(1986,1987,1994,1995), resfun="loo")
res.86879495 <- nspawnerinf(c(1986,1987,1994,1995), resfun="loo")
res2.94 <- spawnerinf(c(1994), resfun="loo")
res.94 <- nspawnerinf(c(1994), resfun="loo")
res2.95 <- spawnerinf(c(1995), resfun="loo")
res.95 <- nspawnerinf(c(1995), resfun="loo")
res2.8694 <- spawnerinf(c(1986,1994), resfun="loo")
res.8694 <- nspawnerinf(c(1986,1994), resfun="loo")
res.all <- res
res2.all <- res2
save(res.all, res2.all, res.9495, res2.9495, res.94, res2.94, res.95, res2.95, 
     res2.8694, res.8694, file="basemodsloo.RData")

res2m.all <- spawnerinf(resfun="looMd")
resm.all <- nspawnerinf(resfun="looMd")
res2m.9495 <- spawnerinf(c(1994,1995), resfun="looMd")
resm.9495 <- nspawnerinf(c(1994,1995), resfun="looMd")
res2m.94 <- spawnerinf(c(1994), resfun="looMd")
resm.94 <- nspawnerinf(c(1994), resfun="looMd")
res2m.95 <- spawnerinf(c(1995), resfun="looMd")
resm.95 <- nspawnerinf(c(1995), resfun="looMd")
res2m.8694 <- spawnerinf(c(1986,1994), resfun="looMd")
resm.8694 <- nspawnerinf(c(1986,1994), resfun="looMd")
save(resm.all, res2m.all, resm.9495, res2m.9495, resm.94, res2m.94, 
     resm.95, res2m.95, 
     res2m.8694, resm.8694, file="basemodslooMd.RData")

dforig=data.frame(Year=respdat$Year, 
                  spawners0=respdat$spawners0, spawners1=respdat$spawners1, spawners2=respdat$spawners2, 
                  nspawners0=respdat$nspawners0, nspawners1=respdat$nspawners1, 
                  nspawners2=respdat$nspawners2)
dforig <- na.omit(dforig)
res.all <- spawnerinf(resfun="loo", data=dforig)
res2.all <- nspawnerinf(resfun="loo", data=dforig)
save(res.all, res2.all, file="basemodsloo1956-2015.RData")
