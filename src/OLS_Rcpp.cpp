#include <Rcpp.h>
#include <RcppEigen.h>
// [[Rcpp::depends(RcppEigen)]]

// [[Rcpp::export]]
Eigen::VectorXd OLS_Rcpp(Eigen::MatrixXd &X, Eigen::VectorXd &y) 
{
  return (X.transpose() * X).ldlt().solve(X.transpose() * y);
}
