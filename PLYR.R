##Integer Vector and random number generator
set.seed(1)
##Creates data frame
d <- data.frame(year= rep(2000:2002, each =3),count = round(runif(9,0,20)))
##Displays
print(d)
##Use package
library(plyr)
##Coefficient of Variation = CV ( measure of spread that describes the amount of variability relative to the mean)
ddply(d, "year", function(x) {
  mean.count <- mean(x$count)
  sd.count <- sd(x$count)
  cv <- sd.count/mean.count
  data.frame(cv.count = cv)
})
##Summmarise creates a new condensed data frame
ddply(d, "year", summarise, mean.count = mean(count))
##Transform  modifies exisiting data frame
ddply(d, "year", transform, total.count = sum(count))
##Mutate is similar to transform but allowd for building upon columns
ddply(d, "year", mutate, mu = mean(count), sigma = sd(count),
      cv = sigma/mu)

#########Plotting with plyr########
par(mfrow = c(1, 3), mar = c(2, 2, 1, 1), oma = c(3, 3, 0, 0))
d_ply(d, "year", transform, plot(count, main = unique(year), type = "o"))
mtext("count", side = 1, outer = TRUE, line = 1)
mtext("frequency", side = 2, outer = TRUE, line = 1)

##
baseball.dat <- subset(baseball, year > 2000) # data from the plyr package
x <- ddply(baseball.dat, c("year", "team"), summarize,
           homeruns = sum(hr))
head(x)