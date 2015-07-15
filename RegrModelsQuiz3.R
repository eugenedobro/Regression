#coursera regression models quiz 3

#1
data(mtcars)
str(mtcars)
mtcars$cyl <- as.factor(mtcars$cyl)
fit <- lm(mpg ~ cyl + wt, data = mtcars)
summary(fit)
##cyl8 coef -6.071 shows comprasion with cyl4 (choosed automaticaly as base)

#2
fit2 <- lm(mpg ~ cyl, data = mtcars)
summary(fit2)
##now cyl8 is -11.564, so when wt is constant cyl make more impact

#3
# Now fit a second model with mpg as the outcome model that considers the 
#interaction between number of cylinders (as a factor variable) and weight
fit3 <- lm(mpg ~ factor(cyl) + wt + factor(cyl):wt, data=mtcars)
summary(fit3)
##fit3 <- lm(mpg ~ cyl*wt, data = mtcars)
result <- anova(fit, fit3, test="Chi")
result
##p value 0.1038 > 0.05 so we fail to reject test comparing the two models 

#4
fit4 <- lm(mpg ~ cyl + I(wt * 0.5), data = mtcars)
summary(fit)
summary(fit4)

#5
# Give the hat diagonal for the most influential
x <- c(0.586, 0.166, -0.042, -0.614, 11.72)
y <- c(0.549, -0.026, -0.127, -0.751, 1.344)

hatvalues(lm(y ~ x))

#or
fit5 <- lm(y ~ x)
lm.influence(fit5)$hat

#6
# Give the slope dfbeta for the point with the highest hat value.
x <- c(0.586, 0.166, -0.042, -0.614, 11.72)
y <- c(0.549, -0.026, -0.127, -0.751, 1.344)

fit6 <- lm(y ~ x)

lm.influence(fit6)$hat
dfbetas(fit6)

