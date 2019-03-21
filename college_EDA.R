#load in the data
college <- read.csv("College.csv")

#rename the rows
rownames(college) = college[,1]

#drop the first collumn
college = college[,-1]

summary(college)

#create the first 10 features scatter plots
pairs(college[,1:10])

plot(college$Private, college$Outstate)

#divide universities into two groups based on whether or not the proportion 
#of students coming from the top 10% of their high school classes exceeds 50 %
Elite = rep("No", nrow(college))
Elite[college$Top10perc>50]="Yes"
Elite = as.factor(Elite)
college = data.frame(college, Elite)

plot(college$Elite, college$Outstate)

#check some features in histogram
par(mfrow=c(2,2))
hist(college$Apps)
hist(college$perc.alumni, col=2)
hist(college$S.F.Ratio, col=3, breaks=10)
hist(college$Expend, breaks=100)

par(mfrow=c(1,2))
plot(college$Outstate, college$Grad.Rate)
# High tuition correlates to high graduation rate.
plot(college$Accept / college$Apps, college$S.F.Ratio)
# Colleges with low acceptance rate tend to have low S:F ratio.