#Building predictive models using the caret package.
#Referencing modules 2 and 3 and Predict.R from the final project.
library(readr)
library(caTools)
library(FNN)
library(tree)
library(kernlab)
library(neuralnet)
library(caret)
#install.packages("randomForest")
#library(randomForest)
boat<- read_csv("train.csv")
head(boat) # first few data rows.
boat<-boat[,c(2,5,6,7,8)] #selecting a few variables
boat$Survived<-as.factor(boat$Survived)
colSums(is.na(boat)) #checking for NA in any columns.
#replacing missing age values with the mean values.
boat<-within(boat,Age[is.na(Age)]<-mean(Age,na.rm=TRUE))
sum(is.na(boat$Age)) # no more missing values.
#Replacing male and female with numbers
boat$Sex[boat$Sex=="male"]<-1
boat$Sex[boat$Sex=="female"]<-0
set.seed(123)

#splitting data into train and validation sets
sample<-sample.split(boat$Survived, SplitRatio = .80)
train<-subset(boat,sample==TRUE)
valid<-subset(boat, sample==FALSE)

#Using LR model
boatLR<-glm(Survived~Sex+Age+SibSp+Parch,family=binomial(),data=train)

#Using tree
boatTree<-tree(Survived~Sex+Age+SibSp+Parch,data=train)

#Using KNN
boatKNN<-train(Survived~Sex+Age+SibSp+Parch,data=train,method = "knn")

#Predicting and validating

#Prediction using LR
valid$survive.prod<-predict(boatLR,valid,type="response")
valid$surviveLR<-round(valid$survive.prod)

#Prediction using tree
valid$surviveTree <- round(predict(boatTree, valid))

#Prediction using KNN
valid$surviveKNN <- predict(boatKNN, valid)


# use the postResampled function to calculate the RMSE of the predicted versus actual values
postResample(pred = valid$surviveLR, obs = valid$Survived) #LR
postResample(pred = valid$surviveTree, obs = valid$Survived) #Tree
postResample(pred = valid$surviveKNN, obs = valid$Survived) #KNN

#Out of the three models, the higher accuracy and kappa 
#of KNN makes it the winner.


#Read test.csv for final prediction
boattest<- read_csv("test.csv")
#replacing missing age values with the mean values.
boattest<-within(boattest,Age[is.na(Age)]<-mean(Age,na.rm=TRUE))

boattest$Sex[boattest$Sex=="male"]<-1
boattest$Sex[boattest$Sex=="female"]<-0


#Prediction using KNN
boattest$Survived <- predict(boatKNN, boattest)
View(boattest)

#----------------------
submission <- c()
submission$PassengerID <-boattest$PassengerId
submission$Survived <-boattest$Survived
write.csv(submission, file = "submission.csv",row.names = FALSE)



