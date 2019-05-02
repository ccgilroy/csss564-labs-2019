data {
  int N;
  int y;
}
parameters {
  real<lower=0> lambda;
}
model {
  lambda ~ gamma(1, 1);
  y ~ poisson(N * lambda);
}
