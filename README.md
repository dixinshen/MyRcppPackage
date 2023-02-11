# MyRcppPackage
Demo Rcpp Package, calculating ordinary least squares solution

# Installation
1.  OS-specific prerequisites
      - *Windows*: Install
        [RTools](https://cran.r-project.org/bin/windows/Rtools/) (not an
        R package)
      - *Mac*: If using R version \>= 3.6.0, verify your GNU Fortran
        version is \>= 6.1. If you have an older version, go
        [here](https://cran.r-project.org/bin/macosx/tools/) to install
        the required version
2.  Install the R package [devtools](https://github.com/hadley/devtools)
3.  Install the **MyRcppPackage** package with the *install\_github()* function

<!-- end list -->

``` r
devtools::install_github("dixinshen/MyRcppPackage")
```

# Example
``` r
library(MASS)
library(MyRcppPackage)

data(Boston)
dim(Boston)
head(Boston)

X <- model.matrix(~ ., data = subset(Boston, select=-medv))
y <- Boston$medv

beta_lm <- lm(medv ~ ., data = Boston)$coefficients
beta_OLS_v1 <- OLS_v1(X, y)
beta_OLS_v2 <- OLS_v1(X, y)
beta_Rcpp <- OLS_Rcpp(X, y)

cbind(beta_lm, beta_OLS_v1, beta_OLS_v2, beta_Rcpp)
```
