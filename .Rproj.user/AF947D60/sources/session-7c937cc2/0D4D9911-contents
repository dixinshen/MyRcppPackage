OLS_v1 <- function(X, y) {
    as.vector(solve(t(X) %*% X, t(X) %*% y))
}

OLS_v2 <- function(X, y) {
    as.vector(MASS::ginv(t(X) %*% X) %*% t(X) %*% y)
}
