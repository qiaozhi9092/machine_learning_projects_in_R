library(MASS)
?Boston
dim(Boston)
names(Boston)
pairs(Boston)

par(mfrow=c(1,1))
plot(Boston$age, Boston$crim)
# Older homes, more crime
plot(Boston$dis, Boston$crim)
# Closer to work-area, more crime
plot(Boston$rad, Boston$crim)
# Higher index of accessibility to radial highways, more crime
plot(Boston$tax, Boston$crim)
# Higher tax rate, more crime
plot(Boston$ptratio, Boston$crim)
# Higher pupil:teacher ratio, more crime

par(mfrow=c(1,3))
hist(Boston$crim[Boston$crim>1], breaks=25)
# most cities have low crime rates, but there is a long tail: 18 suburbs appear
# to have a crime rate > 20, reaching to above 80
hist(Boston$tax, breaks=25)
# there is a large divide between suburbs with low tax rates and a peak at 660-680
hist(Boston$ptratio, breaks=25)
# a skew towards high ratios, but no particularly high ratios

dim(subset(Boston, chas == 1))
sum(Boston$chas == 1)
# 35 suburbs by Charles

median(Boston$ptratio)

# there are two towns with lowest medv value of 5
seltown <- subset(Boston, Boston$medv == min(Boston$medv))
# overall quartiles and range of predictors
sapply(Boston, quantile)

nrow(Boston[Boston$rm > 7,])  # 64 with > 7 rooms
sum(Boston$rm > 7)
nrow(Boston[Boston$rm > 8,])  # 13 with > 8 rooms

rbind(sapply(Boston[Boston$rm > 8,], mean), sapply(Boston, median))
#crim rates are higher (almost 3X)
#higher proportion of 25K sq ft lots
#much lower `lstat` value
#higher `medv` value