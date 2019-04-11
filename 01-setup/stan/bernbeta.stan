data {
  int N;
  int y[N];
}
parameters {
  real<lower=0, upper=1> theta;
}
model {
  // likelihood
  y ~ bernoulli(theta);
  // prior
  theta ~ beta(1, 1);
}
