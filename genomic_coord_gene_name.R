 mycoords.gr<- read.csv("C:/Users/Hp/Downloads/lncRNA_TAD.csv")

 library(biomaRt)
 mart <- useMart("ensembl")
 mart <- useDataset("hsapiens_gene_ensembl", mart)
 attributes <- c("ensembl_gene_id")#,"start_position","end_position","strand","hgnc_symbol","chromosome_name")
 filters <- c("chromosome_name","start","end")
 for (i in 1:712){
 values <- list(chromosome=mycoords.gr$om[[i]] ,start=mycoords.gr$start[[i]],end=mycoords.gr$end[[i]])
 print(values)
 all.genes<-getBM(attributes=attributes, filters=filters, values= values, mart=mart)
 #print(all.genes)
 a[i,]<- cbind.data.frame(mycoords.gr$x[[i]],toString(all.genes))
 #print(a)
 }
 write.csv(a,"E:/lncRNA_vacc_non_vacc/Tad_gene.csv")
