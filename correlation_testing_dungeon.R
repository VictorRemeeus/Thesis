#correlation testing: https://stackoverflow.com/questions/13112238/a-matrix-version-of-cor-test
#get last column: https://stackoverflow.com/questions/21781596/refer-to-the-last-column-in-r
library(psych)

data_STM <- read.csv("G:\\Master\\Block 3\\Thesis\\Dungeon\\features_Dungeon_STM.csv")
data_Bert <- read.csv("G:\\Master\\Block 3\\Thesis\\Dungeon\\Features_Dungeon_Bert_reduction.csv")
head(data_STM)
head(data_Bert)

targetS <- subset(data_STM, select = ncol(data_STM))
inputS <- subset(data_STM, select = -(ncol(data_STM)))
targetB <- subset(data_Bert, select = ncol(data_Bert))
inputB <- subset(data_Bert, select = -(ncol(data_Bert)))

corr_stm <- corr.test(inputS, targetS, method="spearman")
corr_bert <- corr.test(inputB, targetB, method = "spearman")

Correlation_STM_Dungeon <- cbind(corr_stm$r, round(corr_stm$p,3))
write.csv(Correlation_STM_Dungeon, "G:\\Master\\Block 3\\Thesis\\Dungeon\\correlation_STM_Dungeon.csv", row.names= TRUE)

Correlation_Bert_Dungeon <- cbind(corr_bert$r, round(corr_bert$p,3))
write.csv(Correlation_Bert_Dungeon, "G:\\Master\\Block 3\\Thesis\\Dungeon\\correlation_Bert_Dungeon.csv", row.names= TRUE)
