install.packages("stm")
install.packages("tm")
library(stm)
library(lda)

stm_data<-read.csv("all_counties.csv")
processed <- textProcessor(stm_data$body_text, metadata=stm_data)
View(processed)

out <- prepDocuments(processed$documents, processed$vocab, processed$meta,lower.thresh = 5)
View(out)

#Perplexity Score = 30
stm.out <- stm(out$documents, out$vocab, K=30,
               prevalence=NULL,
               data=out$meta, max.em.its=50)

#stm_theta = stm.out$theta
#View(stm_theta)


#stm_topicproportion<-colSums(stm_theta)/nrow(stm_theta)
#View(stm_topicproportion)

plot.STM(stm.out,type = "summary", text.cex=.5, n=5)
cloud(stm.out, topic =10)

#Perplexity Score = 20
stm.out <- stm(out$documents, out$vocab, K=20,
               prevalence=NULL,
               data=out$meta, max.em.its=50)

plot.STM(stm.out,type = "summary", text.cex=.5, n=5)
cloud(stm.out, topic =19)

#Perplexity Score = 40
stm.out <- stm(out$documents, out$vocab, K=40,
               prevalence=NULL,
               data=out$meta, max.em.its=200)

plot.STM(stm.out,type = "summary", text.cex=.5, n=5)
cloud(stm.out, topic =10)


