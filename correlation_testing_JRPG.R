#correlation testing: https://stackoverflow.com/questions/13112238/a-matrix-version-of-cor-test
#get last column: https://stackoverflow.com/questions/21781596/refer-to-the-last-column-in-r
library(psych)

data_STM <- read.csv("G:\\Master\\Block 3\\Thesis\\JRPG\\features_JRPG_STM.csv")
data_Bert <- read.csv("G:\\Master\\Block 3\\Thesis\\JRPG\\Features_JRPG_Bert_reduction.csv")
head(data_STM)
head(data_Bert)

targetS <- subset(data_STM, select = ncol(data_STM))
inputS <- subset(data_STM, select = -(ncol(data_STM)))
targetB <- subset(data_Bert, select = ncol(data_Bert))
inputB <- subset(data_Bert, select = -(ncol(data_Bert)))

corr_stm <- corr.test(inputS, targetS, method="spearman")
corr_bert <- corr.test(inputB, targetB, method = "spearman")

Correlation_STM_JRPG <- cbind(corr_stm$r, round(corr_stm$p,3))
write.csv(Correlation_STM_JRPG, "G:\\Master\\Block 3\\Thesis\\JRPG\\correlation_STM_JRPG.csv", row.names= TRUE)

Correlation_Bert_JRPG <- cbind(corr_bert$r, round(corr_bert$p,3))
write.csv(Correlation_Bert_JRPG, "G:\\Master\\Block 3\\Thesis\\JRPG\\correlation_Bert_JRPG.csv", row.names= TRUE)
