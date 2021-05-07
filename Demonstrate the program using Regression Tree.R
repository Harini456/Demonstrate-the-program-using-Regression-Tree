#Name:Harini G
#Roll No:2048034
#Lab Program:7

#1.Download the dataset BOSTON.csv
boston=read.csv("D:/Harini(christ unniversity)/2nd sem subjects/R/boston.csv")
head(boston)



#2.MEDV is the output /target variable i.e price of the house to be predicted
#the target variable is continious. so, its best to use regression model.
summary(boston$MEDV)


#3. Using the plot commands, plot the latitude and longitude of each of our census tracts
plot(boston$LON,boston$LAT)

#4. Show all the points that lie along the Charles River in a blue colour.
points(boston$LON[boston$CHAS==1], boston$LAT[boston$CHAS==1], col="blue", pch=19)

#5.Apply Linear Regression by plotting the relationship between latitude and house prices and the longitude and the house prices.
plot(boston$LAT, boston$MEDV)
plot(boston$LON, boston$MEDV)

#6.Apply Regression Tree to the problem and draw conclusions from it.
#install.packages("rpart")
library(rpart)
#install.packages("rpart.plot")
library(rpart.plot)
#install.packages("caTools")
library(caTools)
set.seed(100)
split = sample.split(boston$MEDV, SplitRatio = 0.7)
train = subset(boston, split==TRUE)
test = subset(boston, split==FALSE)
tree = rpart(MEDV ~ LAT + LON + CRIM + ZN + INDUS + CHAS + NOX + RM + AGE + DIS + RAD + TAX + PTRATIO, data=train)
prp(tree)
