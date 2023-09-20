library(tidyverse)
library(viper)
library(this.path)


args <- commandArgs(trailingOnly = T)
Spath <- this.dir()
metagene <- read.table(paste(Spath,"/ReactomeMetabolismGenes.txt",sep = ""))
metagene <- metagene$V1



net <- paste(Spath,"/data/",args[2],"_re_network.txt",sep = "")

TCGAexp <- read.csv(paste(Spath,"/data/Expdata/",args[2],"/TCGA-",args[2],".csv",sep = ""), row.names = 1)
predictdata <- read.csv(args[1],row.names = 1)

predictdata <- predictdata[rownames(TCGAexp),]
predictdata[is.na(predictdata)] <- 0
rownames(predictdata) <- rownames(TCGAexp)

metagene <- metagene[metagene %in% rownames(TCGAexp)]
predictact <- rep(1,length(metagene)) %>% data.frame()
rownames(predictact) <- metagene

for (i in 1:ncol(predictdata)) {
  print(paste("Calculate Sample",i))
  mergedata <- cbind(TCGAexp,predictdata[,i])
  colnames(mergedata)[372] <- colnames(predictdata)[i] 
  mergedata <- mergedata %>% as.matrix()
  
  regulon <- aracne2regulon(net,mergedata,format = "3col")
  res <- viper(mergedata,regulon)
  print("done")
  #dim(res)
  res <- data.frame(res)
  res <- res[metagene,]
  predictact <- cbind(predictact,res[,372])
  colnames(predictact)[i+1] <- colnames(predictdata)[i] 
}
Npath <- getwd()
setwd(Npath)
predictact <- predictact[,-1]
write.csv(predictact,"Predicted_proteinactivity.csv")
