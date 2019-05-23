data {
  // number of observations
  int N;
  // response
  int<lower = 0> y[N];
  // number of covariates
  int K;
  // design matrix X 
  matrix[N, K] X;
  // an offset is a term with known coefficient 1
  vector[N] offset; 
}
parameters {
  real a;
  // regression coefficient vector
  vector[K] b;
}
transformed parameters {
  vector<lower = 0.>[N] lambda;
  lambda = exp(a + X * b + offset);
}
model {
  a ~ normal(0, 10);
  b ~ normal(0, 2.5);
  // likelihood
  y ~ poisson(lambda);
}
generated quantities {
  // simulate data from the posterior
  vector[N] y_rep;
  // log-likelihood posterior
  vector[N] log_lik;
  for (i in 1:N) {
    y_rep[i] = poisson_rng(lambda[i]);
    log_lik[i] = poisson_lpmf(y[i] | lambda[i]);
  }
}
