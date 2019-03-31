library(MASS)
library(ISLR)
names(Boston)
?Boston

#fit a sample linear model
attach(Boston)
lm.fit = lm(medv~lstat)
lm.fit
summary(lm.fit)
names(lm.fit)
#estimate coefficients
lm.fit$coefficients
coef(lm.fit)
#confidence interval
confint(lm.fit)
predict(lm.fit,data.frame(lstat=c(5,10,15)), interval ="confidence")
#prediction interval
predict(lm.fit,data.frame(lstat=c(5,10,15)), interval ="prediction")
#plot medv vs lstat
plot(lstat ,medv)
abline(lm.fit)
par(mfrow=c(2,2)) 
plot(lm.fit)
#residual plot
plot(predict(lm.fit), residuals(lm.fit)) 
plot(predict(lm.fit), rstudent(lm.fit))
#leverage plot
plot(hatvalues (lm.fit))
#index with the largest element of a vector
which.max(hatvalues (lm.fit))

#multiple linear regression
lm.fit = lm(medv~lstat+age)
summary(lm.fit)
lm.fit = lm(medv~., data=Boston)
summary(lm.fit)
?summary.lm
#adj r squared
summary(lm.fit)$adj.r.squared
#rse
summary(lm.fit)$sigma
library(car)
#variance inflation factors
vif(lm.fit)
lm.fit1=lm(medv~.-age,data=Boston)
lm.fit1=update(lm.fit, ~.-age)

#Interaction Terms
summary(lm(medv~lstat*age,data=Boston))

#Non-linear Transformations of the Predictors
lm.fit2=lm(medv~lstat+I(lstat^2))
summary(lm.fit2)
lm.fit=lm(medv~lstat)
#anova analysis
anova(lm.fit ,lm.fit2)
#summary plot
par(mfrow=c(2,2)) 
plot(lm.fit2)
#degree of 5 poly
lm.fit5=lm(medv~poly(lstat ,5))
summary(lm.fit5)
summary(lm(medv~log(rm),data=Boston))









