# Linear algebra review ----

## Simple regression

foo <- lm(mpg ~ wt + cyl, data = mtcars)
bar <- foo$model

## Define two vectors and a function for the design matrix

x1 <- mtcars$wt
x2 <- mtcars$cyl

my_design_matrix <- function(x1, x2) {
  x0 <- rep(1, length(x1))
  X <- cbind(x0,x1,x2)
  return(X)
}

## Compare my_design_matrix with lm output

y <- mtcars$mpg

fit <- lm(y ~ x1 + x2)
coefficients(fit)

X <- my_design_matrix(x1,x2)
beta <- solve(t(X) %*% X) %*% (t(X) %*% y)
beta

## Verify the correlation formula from the slides

library(HistData)

y <- Galton$child
x <- Galton$parent
beta1 <- cor(y, x) *  sd(y) / sd(x)
beta0 <- mean(y) - beta1 * mean(x)

c(beta0, beta1)

lm(y ~ x)

## Mean centered regression models

new_y <- mtcars$mpg - mean(mtcars$mpg)
new_x1 <- mtcars$wt - mean(mtcars$wt)
new_x2 <- mtcars$cyl - mean(mtcars$cyl)

fit2 <- lm(new_y ~ new_x1 + new_x2)
summary(fit2)

fit3 <- lm(new_y ~ new_x1 + new_x2 + 0)
# or fit3 <- lm(new_y ~ new_x1 + new_x2 - 1)
summary(fit3)
