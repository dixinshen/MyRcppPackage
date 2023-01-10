library(MASS)

data(Boston)
dim(Boston)
head(Boston)

X <- model.matrix(~ ., data = subset(Boston, select=-medv))
y <- Boston$medv

beta_lm <- lm(medv ~ ., data = Boston)$coefficients
beta_OLS_v1 <- OLS_v1(X, y)
beta_OLS_v2 <- OLS_v1(X, y)
beta_Rcpp <- OLS_Rcpp(X, y)

testthat::test_that("OLS of Boston Housing Data", {
    expect_true( all(round(beta_lm, 10) == round(beta_OLS_v1, 10)) )
    expect_true( all(round(beta_lm, 10) == round(beta_OLS_v2, 10)) )
    expect_true( all(round(beta_lm, 10) == round(beta_Rcpp, 10)) )
})