#correlation testing: https://stackoverflow.com/questions/13112238/a-matrix-version-of-cor-test
#get last column: https://stackoverflow.com/questions/21781596/refer-to-the-last-column-in-r
library(psych)

data_STM <- read.csv("G:\\Master\\Block 3\\Thesis\\Visual Novel\\features_novel_STM.csv")
data_Bert <- read.csv("G:\\Master\\Block 3\\Thesis\\Visual Novel\\Features_novel_Bert_reduction.csv")
head(data_STM)
head(data_Bert)

targetS <- subset(data_STM, select = ncol(data_STM))
inputS <- subset(data_STM, select = -(ncol(data_STM)))
targetB <- subset(data_Bert, select = ncol(data_Bert))
inputB <- subset(data_Bert, select = -(ncol(data_Bert)))

corr_stm <- corr.test(inputS, targetS, method="spearman")
corr_bert <- corr.test(inputB, targetB, method = "spearman")

Correlation_STM_novel <- cbind(corr_stm$r, round(corr_stm$p,3))
write.csv(Correlation_STM_novel, "G:\\Master\\Block 3\\Thesis\\Visual Novel\\correlation_STM_novel.csv", row.names= TRUE)

Correlation_Bert_novel <- cbind(corr_bert$r, round(corr_bert$p,3))
write.csv(Correlation_Bert_novel, "G:\\Master\\Block 3\\Thesis\\Visual Novel\\correlation_Bert_novel.csv", row.names= TRUE)
