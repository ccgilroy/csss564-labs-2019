data {
  // number of observations
  int<lower = 1> N;  
  // number of covariates
  int K;
  // number of groups
  int<lower = 0> J;
  // group index
  int<lower = 1, upper = J> group[N];
  // response vector
  vector[N] y;
  // design matrix
  matrix[N, K] X;
}
parameters {
  // intercepts
  vector[J] a_raw;
  real mu_a;
  real<lower = 0> sigma_a;
  // regression coefficients
  vector[K] b;
  // scale
  real<lower = 0> sigma;
}
transformed parameters {
  vector[J] a;
  vector[N] mu;
  a = mu_a + sigma_a * a_raw;
  for (i in 1:N) {
    mu[i] = a[group[i]] + X[i] * b;
  }
}
model {
  // priors
  a_raw ~ normal(0, 1);
  mu_a ~ normal(0, 10);
  sigma_a ~ cauchy(0, 5);
  b ~ normal(0, 2.5);
  sigma ~ cauchy(0, 5);
  // likelihood
  y ~ normal(mu, sigma);
}
generated quantities {
  // simulated data
  vector[N] y_rep;
  // log-likelihood
  vector[N] log_lik;
  for (n in 1:N) {
    y_rep[n] = normal_rng(mu[n], sigma);
    log_lik[n] = normal_lpdf(y[n] | mu[n], sigma);
  }
}
