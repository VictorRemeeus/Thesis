#all the code is taken from the STM paper/manual: https://cran.r-project.org/web/packages/stm/vignettes/stmVignette.pdf
library("Rtsne")
library("rsvd")
library("geometry")
library("stm")

#reading and checking the data
data <- read.csv("F:\\Master\\Block 3\\Thesis\\JRPG\\JRPG_final.csv")
head(data)

#making the data ready for the topic model, pre-processing already done
processed <- textProcessor(data$review_text, metadata = data, lowercase = FALSE,
                           removestopwords = FALSE,
                           removenumbers = FALSE,
                           removepunctuation = FALSE, stem = FALSE)
out <- prepDocuments(processed$documents, processed$vocab, processed$meta, lower.thresh = 5)
docs <- out$documents
vocab <- out$vocab
meta <- out$meta

#searching for the best K
modeltest <- searchK(documents = out$documents, vocab = out$vocab, K= c(seq(20,200,20)) , data = out$meta, init.type = "Spectral")
modeltest
plot(modeltest)
#topic modelling
model <- stm(documents = out$documents, vocab = out$vocab, K=160 , data = out$meta, max.em.its = 75, init.type = "Spectral", seed = 101)
save(model, file = "F:\\Master\\Block 3\\Thesis\\JRPG\\JRPG_STM.RData")

#looking at the topic topics, and their keywords               
plot(model)
labelTopics(model, c(94,44,151,52,131))
labelTopics(model, c(109,40,147,45,105))
cloud(model, topic = , scale = c(2,.25))

#Saving output for sentiment classifcation
output <- model$theta
dataset_for_classification <- cbind(output, out$meta$review_score)

write.csv(dataset_for_classification, "F:\\Master\\Block 3\\Thesis\\JRPG\\features_JRPG_STM.csv", row.names=FALSE)




