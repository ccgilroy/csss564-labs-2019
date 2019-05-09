data {
  int N;
  int K;
  vector[N] y;
  matrix[N, K] X;
}
parameters {
  real alpha;
  vector[K] beta;
  real<lower=0> sigma;
}
transformed parameters {
  vector[N] mu;
  mu = alpha + X * beta;
}
model {
  // priors
  alpha ~ normal(0, 10);
  beta ~ normal(0, 1);
  sigma ~ exponential(1);
  // likelihood
  y ~ normal(mu, sigma);
}
generated quantities {
  // simulate data from the posterior
  vector[N] y_rep;
  for (i in 1:N) {
    y_rep[i] = normal_rng(mu[i], sigma);
  }
}
