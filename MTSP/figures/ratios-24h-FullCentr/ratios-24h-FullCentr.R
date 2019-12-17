rm(list=ls())
# 1/ LOAD DATA
sources_24h.name.main  <-c("FullCentr"                   , "NoRealloc", "Auction"         , "P2P"         , "CNP"         , "Cluster"         , "OptDecentr")
sources_24h.name.file  <-c("without_swap/FullCentr_24h"  , "TSP_24h"  , "AuctionSwap_24h" , "P2Pswap_24h" , "CNPswap_24h" , "ClusRaoSwap_24h" , "MTSPc3swap_24h")
                               FullCentr_24h          <-  TSP_24h  <-  AuctionSwap_24h  <- P2Pswap_24h  <- CNPswap_24h <-  ClusRaoSwap_24h <-  MTSPc3swap_24h <- list()
sources_24h            <-list( FullCentr_24h            ,  TSP_24h    ,  AuctionSwap_24h  ,  P2Pswap_24h  ,  CNPswap_24h  ,  ClusRaoSwap_24h  ,  MTSPc3swap_24h)

library(gdata)
#setwd("MAY BE NEEDED")
for(source in 1:length(sources_24h)){
  temp.file <- read.xls(paste(paste("../../results/",sources_24h.name.file[source],sep=""),".xls",sep=""), sheet=1)
  temp.2 <- na.omit(data.frame("nbSMen"=as.numeric(temp.file$X2nbSMen), "nbCities"=as.numeric(temp.file$X2nbCities), "instnce"=as.numeric(temp.file$X2instnce), "TOTcmpT"=as.numeric(temp.file$X2TOTcmpT), "TOTroutLen"=as.numeric(temp.file$X2TOTroutLen), "TOTmsgExch"=as.numeric(temp.file$X2TOTmsgExch), "auctionRounds"=as.numeric(temp.file$X2auctionRounds)))
  temp.3 <- na.omit(data.frame("nbSMen"=as.numeric(temp.file$X3nbSMen), "nbCities"=as.numeric(temp.file$X3nbCities), "instnce"=as.numeric(temp.file$X3instnce), "TOTcmpT"=as.numeric(temp.file$X3TOTcmpT), "TOTroutLen"=as.numeric(temp.file$X3TOTroutLen), "TOTmsgExch"=as.numeric(temp.file$X3TOTmsgExch), "auctionRounds"=as.numeric(temp.file$X3auctionRounds)))
  temp.4 <- na.omit(data.frame("nbSMen"=as.numeric(temp.file$X4nbSMen), "nbCities"=as.numeric(temp.file$X4nbCities), "instnce"=as.numeric(temp.file$X4instnce), "TOTcmpT"=as.numeric(temp.file$X4TOTcmpT), "TOTroutLen"=as.numeric(temp.file$X4TOTroutLen), "TOTmsgExch"=as.numeric(temp.file$X4TOTmsgExch), "auctionRounds"=as.numeric(temp.file$X4auctionRounds)))
  temp.5 <- na.omit(data.frame("nbSMen"=as.numeric(temp.file$X5nbSMen), "nbCities"=as.numeric(temp.file$X5nbCities), "instnce"=as.numeric(temp.file$X5instnce), "TOTcmpT"=as.numeric(temp.file$X5TOTcmpT), "TOTroutLen"=as.numeric(temp.file$X5TOTroutLen), "TOTmsgExch"=as.numeric(temp.file$X5TOTmsgExch), "auctionRounds"=as.numeric(temp.file$X5auctionRounds)))
  temp.6 <- na.omit(data.frame("nbSMen"=as.numeric(temp.file$X6nbSMen), "nbCities"=as.numeric(temp.file$X6nbCities), "instnce"=as.numeric(temp.file$X6instnce), "TOTcmpT"=as.numeric(temp.file$X6TOTcmpT), "TOTroutLen"=as.numeric(temp.file$X6TOTroutLen), "TOTmsgExch"=as.numeric(temp.file$X6TOTmsgExch), "auctionRounds"=as.numeric(temp.file$X6auctionRounds)))
  temp.7 <- na.omit(data.frame("nbSMen"=as.numeric(temp.file$X7nbSMen), "nbCities"=as.numeric(temp.file$X7nbCities), "instnce"=as.numeric(temp.file$X7instnce), "TOTcmpT"=as.numeric(temp.file$X7TOTcmpT), "TOTroutLen"=as.numeric(temp.file$X7TOTroutLen), "TOTmsgExch"=as.numeric(temp.file$X7TOTmsgExch), "auctionRounds"=as.numeric(temp.file$X7auctionRounds)))
  temp.8 <- na.omit(data.frame("nbSMen"=as.numeric(temp.file$X8nbSMen), "nbCities"=as.numeric(temp.file$X8nbCities), "instnce"=as.numeric(temp.file$X8instnce), "TOTcmpT"=as.numeric(temp.file$X8TOTcmpT), "TOTroutLen"=as.numeric(temp.file$X8TOTroutLen), "TOTmsgExch"=as.numeric(temp.file$X8TOTmsgExch), "auctionRounds"=as.numeric(temp.file$X8auctionRounds)))
  temp.9 <- na.omit(data.frame("nbSMen"=as.numeric(temp.file$X9nbSMen), "nbCities"=as.numeric(temp.file$X9nbCities), "instnce"=as.numeric(temp.file$X9instnce), "TOTcmpT"=as.numeric(temp.file$X9TOTcmpT), "TOTroutLen"=as.numeric(temp.file$X9TOTroutLen), "TOTmsgExch"=as.numeric(temp.file$X9TOTmsgExch), "auctionRounds"=as.numeric(temp.file$X9auctionRounds)))
  sources_24h[[source]] <- rbind(temp.2, temp.3, temp.4, temp.5, temp.6, temp.7, temp.8, temp.9)
  rm(temp.file)
  rm(temp.2); rm(temp.3); rm(temp.4); rm(temp.5); rm(temp.6); rm(temp.7); rm(temp.8); rm(temp.9);
  print(paste(paste(source, length(sources_24h), sep = "/"), sources_24h.name.main[source], sep = " => "))
}

# 3/ GRAPHS OF THE QUANTILES 
# 3.1/ Import the TOTroutLen of all mechanisms into a same data frame called TOTroutLen
TOTroutLen <- data.frame("nbSMen"=sources_24h[[1]]$nbSMen, "nbCities"=sources_24h[[1]]$nbCities, "instnce"=sources_24h[[1]]$instnce, "temp"=sources_24h[[1]]$TOTroutLen)
names(TOTroutLen)[length(names(TOTroutLen))]=sources_24h.name.main[1]
for(source in 2:length(sources_24h)){
  TOTroutLen <- merge(TOTroutLen, data.frame("nbSMen"=sources_24h[[source]]$nbSMen, "nbCities"=sources_24h[[source]]$nbCities, "instnce"=sources_24h[[source]]$instnce, "temp"=sources_24h[[source]]$TOTroutLen))
  names(TOTroutLen)[length(names(TOTroutLen))]=sources_24h.name.main[source]
}
# 3.2/ Calculate the ratios (each mechanism / MTSP) and save the result into ratios
ratios <- data.frame("nbSMen"=TOTroutLen$nbSMen, "nbCities"=TOTroutLen$nbCities, "instnce"=TOTroutLen$instnce)
for(source in 2:length(sources_24h)){
  ratios<-data.frame(ratios, "temp" = TOTroutLen[3+source]/TOTroutLen[4])
  names(ratios)[length(names(ratios))]=sources_24h.name.main[source]
}
# 3.3/ Calculate the quantiles of the ratios
proba <- 0.9  #REPLACE BY THE DESIRED QUANTILE (proba<-0.5 or proba<-0.9)
quantiles <- subset(TOTroutLen, select = c("nbSMen", "nbCities"), instnce == 129)
for(source in 2:length(sources_24h)){
  quantiles <- data.frame(quantiles, rep(NA, length(quantiles[[1]])))
  names(quantiles)[length(names(quantiles))]=sources_24h.name.main[source]
  for(line in 1:length(quantiles[[1]])){
    # quantiles[line,1] = nbSMen      quantiles[line,2] = nbCities
    quantiles[line, source+1]<-quantile(ratios[[2+source]][ratios$nbSMen==quantiles[line,1] & ratios$nbCities==quantiles[line,2]], probs = proba)
  }
}
quantiles <- quantiles[order(quantiles$nbSMen, quantiles$nbCities),]
#str(quantiles)

m <- 9  #REPLACE BY THE NUMBER OF SALESMEN (m<-5 or m<-9)
quantiles.coord <- data.frame()
for(source in 2:length(sources_24h.name.main)){
  quantiles.coord <- rbind(quantiles.coord, data.frame(nbCities=subset(quantiles, nbSMen == m)$nbCities, efficiencyRatio=100*subset(quantiles, nbSMen == m)[[source+1]], Mechanism=factor(sources_24h.name.main[source], levels=sources_24h.name.main[(source-1):length(sources_24h.name.main)])))
}
#replace n by n/m (i.e, divide quantiles.coord$nbCities by m)
quantiles.coord <- cbind("nbCities"=(quantiles.coord$nbCities-1)/m, data.frame("efficiencyRatio"=quantiles.coord$efficiencyRatio, "Mechanism"=quantiles.coord$Mechanism))
library(ggplot2)
postscript(paste("ratios-24h-",sources_24h.name.main[1],"-",m,"SMen-quantile",proba,".eps",sep = ""), horizontal=FALSE)
#pdf(paste("ratios-24h-",sources_24h.name.main[1],"-",m,"SMen-quantile0",proba*10,".pdf",sep = ""))
#qplot(x=nbCities, y=efficiencyRatio, data=quantiles.coord, color=Mechanism, ylim=c(1,1.65), xlab="Number of cities n", ylab = "Efficiency compared to MTSP", shape=Mechanism) + theme(legend.position = "bottom",   panel.grid.minor.y = element_line(size=1), panel.grid.major = element_line(colour = "grey"), panel.background = element_rect(fill="white"))  + geom_point(aes(size=Mechanism)) + geom_line()
qplot(x=nbCities, y=efficiencyRatio, data=quantiles.coord, color=Mechanism, ylim=c(100,217), xlab="Number of cities per salesman [ (n-1)/m ]", ylab = paste("% quality (total route length) compared to ",sources_24h.name.main[1],sep=""), shape=Mechanism) + theme_set(theme_gray(base_size = 18)) + theme(legend.position = "bottom", legend.text=element_text(size=16)) + geom_point(aes(size=Mechanism)) + geom_line() + ggtitle(paste("m=",m," salesmen, quantile=", proba, ", time limit = 24h.", sep = ""))  + scale_x_continuous(breaks = c(1,2,3,4,5,6,7,8,9))
dev.off()
print("FINISHED")
#max(quantiles.coord$efficiencyRatio)
