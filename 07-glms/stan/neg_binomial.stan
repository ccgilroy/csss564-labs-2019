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
  // regression coefficients
  real a;
  vector[K] b;
  // will put prior on 1 / sqrt(phi)
  real<lower = 0.> sqrt_phi_reciprocal;
}
transformed parameters {
  real<lower = 0.> phi;
  vector<lower = 0.>[N] mu;
  phi = 1. / sqrt_phi_reciprocal^2;
  mu = exp(a + X * b + offset);
}
model {
  a ~ normal(0., 10.);
  b ~ normal(0., 2.5);
  // putting prior on 1 / sqrt(phi) allows shrinking to no dispersion
  sqrt_phi_reciprocal ~ exponential(1);
  // likelihood
  y ~ neg_binomial_2(mu, phi);
}
generated quantities {
  // simulate data from the posterior
  vector[N] y_rep;
  vector[N] log_lik;
  // log-likelihood posterior
  for (i in 1:N) {
    y_rep[i] = neg_binomial_2_rng(mu[i], phi);
    log_lik[i] = neg_binomial_2_lpmf(y[i] | mu[i], phi);
  }
}
