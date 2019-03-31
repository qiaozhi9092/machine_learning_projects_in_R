auto = read.csv("Auto.csv", header=T, na.strings="?")
auto = na.omit(auto)
summary(auto)
dim(auto)

#apply functions to first 7 features
sapply(auto[,1:7], range)
sapply(auto[, 1:7], mean)
sapply(auto[, 1:7], sd)

#remove the 10th through 85th observations
new_auto = auto[-(10:85), ]
sapply(new_auto[, 1:7], range)
sapply(new_auto[, 1:7], mean)
sapply(new_auto[, 1:7], sd)

pairs(auto)
par(mfrow=c(1,1))
plot(auto$mpg, auto$weight)
# Heavier weight correlates with lower mpg.
plot(auto$mpg, auto$cylinders)
# More cylinders, less mpg.
plot(auto$mpg, auto$year)
# Cars become more efficient over time.