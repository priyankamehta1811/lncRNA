getwd()
setwd("E:/lncRNA_vacc_non_vacc/count_matrix/correlation/")
library(reshape2)

lnc<-read.csv("delncRNA_countmatrix.csv", header =TRUE)
t_lnc<-t(lnc)
str(t_lnc)
colnames(t_lnc)<-t_lnc[1,]
t_lnc<-as.data.frame(t_lnc[-1,])
t_lnc<- as.data.frame(sapply(t_lnc, as.numeric))
deg<-read_xlsx("count_degs.xlsx",sheet = "Sheet1")
#deg<-read.csv("mRNA_VBT.csv", header =TRUE)
t_deg<-t(deg)
str(t_deg)
colnames(t_deg)<-t_deg[1,]
t_deg<-as.data.frame(t_deg[-1,])
t_deg<- as.data.frame(sapply(t_deg, as.numeric))

#res<-cor.test(t_lnc$,t_deg$, method="pearson")
#res$p.value

cor<-cor(t_lnc,t_deg,method="pearson")
#for(i in 1:ncol(t_lnc)){
  df<-t_lnc$i
  res<-cor.test(t_lnc$i,t_deg)
  write(res,file="result",sep="\t",append=TRUE)
}#Couldnt make this corr table work. Try to make it run and make a table.
t<-t(cor)
write.csv(t,"tcorr_lnc_deg.csv")
data<-setNames(melt(t), c('genes', 'lncrna', 'values'))
write.csv(data,"tcorr_lnc_deg(melted).csv")

#rcorr(t_lnc,t_deg, type="pearson")
 