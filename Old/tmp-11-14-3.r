dforig=data.frame(Year=respdat$Year, 
              spawners0=respdat$spawners0, spawners1=respdat$spawners1, spawners2=respdat$spawners2, 
              nspawners0=respdat$nspawners0, nspawners1=respdat$nspawners1, 
               nspawners2=respdat$nspawners2)
dforig=na.omit(dforig)
dforig <- subset(dforig, Year>1964)
bad <- c(1986, 1987, 1994, 1995)
dforig$spawners0[dforig$Year%in%bad]=NA
dforig$nspawners0[dforig$Year%in%bad]=NA

df2<-subset(df, Year>1984)
df2<-df[!(df$Year%in%bad),]
df2<-subset(df2, Year<=1983)
modelset <- mods[2:13]

df2 <- dforig
res <- spawnerinf(resfun="aicc", data=df2)
res <- res[res$model%in%modelset,]
baseres=matrix(1,nrow(res),1)%*%matrix(as.numeric(res[1,2:ncol(res)]),nrow=1)
delaic=res[,2:ncol(res)]-baseres
rownames(delaic)=res$model

minrow <- apply(res[2:ncol(res)],2,function(x){which(x==min(x))})
baseres=matrix(1,nrow(res),1)%*%matrix(as.numeric(res[cbind(minrow,2:ncol(res))]),nrow=1)
delaic2=res[,2:ncol(res)]-baseres
rownames(delaic2)=res$model

library(tidyverse)
delaic2 <- cbind(model=res$model, delaic2)
df <- gather(delaic2, year, aic, 2:ncol(delaic2))
df$DelAICc <- cut(df$aic, c(-0.001, .5, 2, 4, 100))
levels(df$DelAICc) <- c("Best (0-0.5)", "Competitive (< 2)", "Uncompetitive (2-4)", "Poor (> 4)")
#ggplot(df, aes(year, model, fill = aic)) + geom_raster()

p <- ggplot(df, aes(year, model)) +
  geom_tile(aes(fill = DelAICc), colour = "grey50")
p + theme(axis.text.x = element_text(angle = 90, vjust=0.5, hjust=1), aspect.ratio = aspr) + scale_fill_manual(values=Palette4)

########################################

df2 <- dforig
res <- nspawnerinf(resfun="aicc", data=df2)
res <- res[res$model%in%modelset,]
baseres=matrix(1,nrow(res),1)%*%matrix(as.numeric(res[1,2:ncol(res)]),nrow=1)
delaic=res[,2:ncol(res)]-baseres
rownames(delaic)=res$model

minrow <- apply(res[2:ncol(res)],2,function(x){which(x==min(x))})
baseres=matrix(1,nrow(res),1)%*%matrix(as.numeric(res[cbind(minrow,2:ncol(res))]),nrow=1)
delaic2=res[,2:ncol(res)]-baseres
rownames(delaic2)=res$model

library(tidyverse)
delaic2 <- cbind(model=res$model, delaic2)
df <- gather(delaic2, year, aic, 2:ncol(delaic2))
df$DelAICc <- cut(df$aic, c(-0.001, .5, 2, 4, 100))
levels(df$DelAICc) <- c("Best (0-0.5)", "Competitive (< 2)", "Uncompetitive (2-4)", "Poor (> 4)")
#ggplot(df, aes(year, model, fill = aic)) + geom_raster()

p <- ggplot(df, aes(year, model)) +
  geom_tile(aes(fill = DelAICc), colour = "grey50")
p + theme(axis.text.x = element_text(angle = 90, vjust=0.5, hjust=1), aspect.ratio = aspr) + scale_fill_manual(values=Palette4)
