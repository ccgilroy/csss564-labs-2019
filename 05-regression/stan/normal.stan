data {
  int N;
  vector[N] y;
}
parameters {
  real mu;
  real<lower=0> sigma;
}
model {
  // priors
  mu ~ normal(0, 10);
  sigma ~ exponential(1);
  // likelihood
  y ~ normal(mu, sigma);
}
