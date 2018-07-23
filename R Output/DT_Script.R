library(readr)
tae_data <-read.csv("C:/Users/PRADEESH S/Desktop/Assignment - 6/Source Dataset/tae.csv")
str(tae_data)

train_data<-tae_data[1:ceiling(nrow(tae_data)*0.7),]
test_data<-tae_data[1:(nrow(tae_data)-ceiling(nrow(tae_data)*0.7)),]
install.packages("C50",dependencies=TRUE)
library(C50)


start.time <- Sys.time()
dtclassifier <- C5.0(train_data[,-6],as.factor(train_data$class_attribute),rules=TRUE)
end.time <- Sys.time()
time.taken <- end.time - start.time
time.taken

summary
data_predicted <- predict(dtclassifier,test_data[,-6])
data_predicted
confusionMatrix <- table(test_data[,6],predicted=data_predicted)
accuracy_test_data <- sum( data_predicted == test_data[,6] ) / length( data_predicted )
decisiontreemodel <- C5.0(train_data[,-6],as.factor(train_data$class_attribute))
plot(decisiontreemodel)


write(capture.output(time.taken), "C:/Users/PRADEESH S/Desktop/Assignment - 6/Decision Tree-R",append=TRUE)
write(capture.output(confusionMatrix), "C:/Users/PRADEESH S/Desktop/Assignment - 6/Decision Tree-R",append=TRUE)
write(capture.output(dtclassifier), "C:/Users/PRADEESH S/Desktop/Assignment - 6/Decision Tree-R")
write(capture.output(summary(dtclassifier)), "C:/Users/PRADEESH S/Desktop/Assignment - 6/Decision Tree-R",append=TRUE)
write(capture.output(accuracy_test_data), "C:/Users/PRADEESH S/Desktop/Assignment - 6/Decision Tree-R",append=TRUE)
