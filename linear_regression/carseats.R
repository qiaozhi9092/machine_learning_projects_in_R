library(ISLR)
names(Carseats)
?Carseats
#Qualitative Predictors
lm.fit=lm(Sales~.+Income:Advertising+Price:Age,data=Carseats)
summary(lm.fit)
attach(Carseats)
contrasts (ShelveLoc)
?contrasts