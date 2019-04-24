// We'll adapt the bernoulli model we saw before into a binomial model
// - How would you change this model to use a binomial likelihood instead?
// - How would you make it possible to vary the parameters of the prior?
data {
  int N;
  int y[N];
}
transformed data {
  real<lower=0> a;
  real<lower=0> b;
  a = 1;
  b = 1;
}
parameters {
  real<lower=0, upper=1> theta;
}
model {
  // prior
  theta ~ beta(a, b);
  // likelihood
  y ~ bernoulli(theta);
}
