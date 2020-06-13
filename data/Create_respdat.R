# This file creates respdata.rdata
# which is used in all the analyses
# setup.Rmd will detect if this file has change and will re-source it if needed.

# load up the data
load(file.path(here::here(), "data/oilsardine_qtr.rdata"))
load(file.path(here::here(), "data/covariates.rdata"))

# Create the response variables (respdat)
# spawners is Jul-Sep catch (qtr 3)
# nspawners is Oct-Mar catch (qtr 4 and 1)
Qtr <- 3 # start of season
reg <- "Kerala"
respdat <- data.frame(
  spawners0 = oilsardine_qtr[[reg]][oilsardine_qtr$Qtr == 3]
)
CatchWin <- stats::filter(oilsardine_qtr[[reg]], c(0, 1, 1, 0), sides = 1)[seq(6, dim(oilsardine_qtr)[1], 4)]
respdat$nspawners0 <- c(CatchWin, NA)
respdat <- log(respdat)
years <- oilsardine_qtr$Year[oilsardine_qtr$Qtr == Qtr]


# Create the covariate data

# These are the covariates I am using
# SST.4 is the SST in box 4 (lat/lon box)
covnames <- c(
  paste0("log.CHL.", 1:13),
  paste0("SST.UPW.", 1:5),
  paste0("Wind.UPW.", 1:5),
  paste0("SST.", 1:13),
  paste0("SSTICOAD.", 1:13),
  "precip.gpcp.kerala", "Precip.Kerala",
  "ONI", "DMI", "Bakun.UPW"
)

# There are the months I want to combine
covmon <- list(
  7:9, 1:3, 10:12, 9:10, 6:9,
  1:12, 3:5, 4:6, 1:5, 4:5, 6:7,
  9:11, 8, 9, 7:8
)

# fix problem in covariates with SST in 1994.
# replace with 5 year mean for that month
covariates2 <- covariates
tmpcov <- c(
  "SST.UPW.3", "SST.UPW.4", "SST.UPW.5", "SST.2",
  paste0("SST.", c(2:5, 7:13)),
  paste0("SSTICOAD.", c(2:5, 7:13))
)
for (itmpcov in tmpcov) {
  for (mon in 10:12) {
    filt1 <- with(covariates2, Year == 1994 & Month == mon)
    if (!is.na(covariates2[filt1, itmpcov])) next
    filt2 <- with(covariates2, Year %in% (1990:1996) & Month == mon)
    covariates2[filt1, itmpcov] <- mean(covariates[filt2, itmpcov], na.rm = TRUE)
  }
}

# Subset covariates to match the years in respdat
covariates2 <- covariates2[covariates2$Year %in% years, ]

# Now create the covariates averaged over specified month and lat/lon boxes

for (i in 1:length(covnames)) {
  covname <- covnames[i]
  for (j in 1:length(covmon)) {
    mon <- covmon[[j]]
    varname <- paste(covname, ".mon", mon[1], "to", mon[length(mon)], ".0", sep = "")
    covdat <- tapply(covariates2[[covname]], covariates2$Year, function(x) {
      mean(x[mon], na.rm = TRUE)
    })
    covdat[is.infinite(covdat)] <- NA
    if (stringr::str_detect(varname, "mon1to3") | stringr::str_detect(varname, "mon4to6")) {
      # Fishing season if July to June, so Jan-Jun should be prior fishing year
      respdat[[varname]] <- c(covdat[-1], NA)
    } else {
      respdat[[varname]] <- covdat
    }
  }
}
# go through the boxes and make spatial averages
for (bx in list(c(2:5), c(2:5, 7:10), c(7:13), c(7, 10), c(11:13), c(1:13))) {
  for (j in c("mon1to3.0", "mon9to10.0", "mon6to9.0", "mon1to12.0", "mon3to5.0", "mon10to12.0", "mon7to9.0")) {
    for (jj in c("SST.", "log.CHL.", "SSTICOAD.")) {
      varname <- c(paste0(jj, bx, ".", j))
      tmp <- apply(respdat[, varname], 1, mean, na.rm = TRUE)
      varname <- paste0(jj, bx[1], ".", bx[NROW(bx)], ".", j)
      respdat[[varname]] <- tmp
    }
  }
}

# add lags
for (i in colnames(respdat)) {
  name <- paste(stringr::str_sub(i, 1, stringr::str_length(i) - 1), "1", sep = "")
  respdat[[name]] <- c(NA, respdat[[i]][1:(dim(respdat)[1] - 1)])
  name <- paste(stringr::str_sub(i, 1, stringr::str_length(i) - 1), "2", sep = "")
  respdat[[name]] <- c(NA, NA, respdat[[i]][1:(dim(respdat)[1] - 2)])
}

# make 2.5 year running means
for (varn in c("SST.", "DMI", "Precip.Kerala", "SSTICOAD.")) {
  if (varn == "SST." | varn == "SSTICOAD.") ivals <- c("2.5", "2.10", "7.10", "7.13", "11.13", "1.13")
  if (varn == "DMI" | varn == "Precip.Kerala") ivals <- c("")
  for (i in ivals) {
    tmp <- (respdat[, paste0(varn, i, ".mon1to12.0")] * 12 -
      respdat[, paste0(varn, i, ".mon10to12.0")] * 3 -
      respdat[, paste0(varn, i, ".mon7to9.0")] * 3) +
      respdat[, paste0(varn, i, ".mon1to12.1")] * 12 +
      respdat[, paste0(varn, i, ".mon1to12.2")] * 12
    varname <- paste0(varn, i, ".3.yr.runsum.0")
    respdat[[varname]] <- tmp / (12 + 12 + 6)
    # create the lag 1
    for (ii in paste0(varn, i, ".3.yr.runsum.0")) {
      name <- paste(stringr::str_sub(ii, 1, stringr::str_length(ii) - 1), "1", sep = "")
      respdat[[name]] <- c(NA, respdat[[ii]][1:(dim(respdat)[1] - 1)])
      name <- paste(stringr::str_sub(ii, 1, stringr::str_length(ii) - 1), "2", sep = "")
      respdat[[name]] <- c(NA, NA, respdat[[ii]][1:(dim(respdat)[1] - 2)])
    }
  }
}

respdat$Year <- years


# Name for data frame with response vars and covariates
dat.spawners <- respdat

# Fix the runsum names
runsumnames <- colnames(dat.spawners)[stringr::str_detect(colnames(dat.spawners), "runsum")]
runsumnames <- unique(sapply(runsumnames, function(x) {
  stringr::str_split(x, "runsum")[[1]][1]
}))
runsumnames <- paste0(runsumnames, "runsum.")

# These are the covariates I want
covnames <- c(
  "precip.gpcp.kerala.mon6to7.", "precip.gpcp.kerala.mon4to5.",
  "Precip.Kerala.mon6to7.", "Precip.Kerala.mon4to5.",
  "SST.4.mon6to9.",
  "SST.UPW.4.mon6to9.", "Bakun.UPW.mon6to9.",
  "SST.2.5.mon6to9.", "SST.2.5.mon9to10.",
  "SST.2.10.mon3to5.", "SST.2.5.mon10to12.",
  "ONI.mon1to12.", "DMI.mon9to11.", "DMI.mon6to9.", runsumnames
)

dat.spawners <- dat.spawners[,
                             c("Year", "nspawners0", "nspawners1", "nspawners2",
                               "spawners0", "spawners1", "spawners2",
                               paste(covnames, "0", sep=""), 
                               paste(covnames, "1", sep=""))
                             ]

# Do a check just in case there was a missing year in the data somewhere
if (any(diff(dat.spawners$Year) != 1)) stop("Problem in setup.Rmd.  The covariate data.frame cannot have any missing years.")

# save to rdata
save(dat.spawners, file = file.path(here::here(), "data/dat_spawners.rdata"))
