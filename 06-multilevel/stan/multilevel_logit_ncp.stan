// multilevel logit model
// noncentered parameterization
// no covariates
data {
  // number of observations
  int<lower = 1> N;  
  // number of districts
  int<lower = 1> J;
  // district index
  int<lower = 1, upper = J> district[N];
  // response array
  int<lower = 0, upper = 1> y[N];
}
parameters {
  vector[J] z;
  real a;
  real<lower = 0> tau;
}
transformed parameters {
  vector<lower = 0, upper = 1>[N] p;
  for (i in 1:N) {
    p[i] = inv_logit(a + tau * z[district[i]]);
  }
}
model {
  // priors
  z ~ normal(0, 1);
  a ~ normal(0, 10);
  tau ~ cauchy(0, 1);
  // likelihood
  y ~ bernoulli(p);
}
generated quantities {
  // simulated data
  vector[N] y_rep;
  // log-likelihood
  vector[N] log_lik;
  for (n in 1:N) {
    y_rep[n] = bernoulli_rng(p[n]);
    log_lik[n] = bernoulli_lpmf(y[n] | p[n]);
  }
}
