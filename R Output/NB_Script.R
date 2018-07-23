library(readr)
tae_data <-read.csv("C:/Users/PRADEESH S/Desktop/Assignment - 6/Source Dataset/tae.csv")
str(tae_data)

train_data<-tae_data[1:ceiling(nrow(tae_data)*0.7),]
test_data<-tae_data[1:(nrow(tae_data)-ceiling(nrow(tae_data)*0.7)),]
install.packages("e1071",dependencies=TRUE)
library(e1071)

start.time <- Sys.time()
nbclassifier <- naiveBayes(train_data[,-6],as.factor(train_data$class_attribute))
end.time <- Sys.time()
time.taken <- end.time - start.time
time.taken

summary
data_predicted <- predict(nbclassifier,test_data[,-6])
data_predicted
confusionMatrix <- table(test_data[,6],predicted=data_predicted)
accuracy_test_data <- sum( data_predicted == test_data[,6] ) / length( data_predicted )

write(capture.output(accuracy_test_data), "C:/Users/PRADEESH S/Desktop/Assignment - 6/Naive_Bayes-R",append=TRUE)
write(capture.output(time.taken), "C:/Users/PRADEESH S/Desktop/Assignment - 6/Naive_Bayes-R",append=TRUE)
write(capture.output(confusionMatrix), "C:/Users/PRADEESH S/Desktop/Assignment - 6/Naive_Bayes-R",append=TRUE)
write(capture.output(nbclassifier), "C:/Users/PRADEESH S/Desktop/Assignment - 6/Naive_Bayes-R")
write(capture.output(summary(nbclassifier)), "C:/Users/PRADEESH S/Desktop/Assignment - 6/Naive_Bayes-R",append=TRUE)
