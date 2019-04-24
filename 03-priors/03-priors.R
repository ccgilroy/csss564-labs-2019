# this file contains the complete code for lab 3
# we'll work through the code together, 
# so you don't need to look at this file until after the lab

# prior and likelihood ----
# hyperparameters
a_prior <- 1
b_prior <- 1

# plot prior from dbeta
p_grid <- seq(0, 1, length.out = 100)
prior <- dbeta(x = p_grid, shape1 = a_prior, shape2 = b_prior)
plot(p_grid, prior)

# data
trials <- 10
successes <- 5

# plot likelihood from dbinom
p_grid <- seq(0, 1, length.out = 100)
likelihood <- dbinom(x = successes, size = trials, prob = p_grid)
plot(p_grid, likelihood)

# grid approximation ----

# set up a probability grid
p_grid <- seq(0, 1, length.out = 100)

# generate prior values at points on the grid
prior <- dbeta(x = p_grid, shape1 = a_prior, shape2 = b_prior)

# generate likelihood values at points on the grid
likelihood <- dbinom(x = successes, size = trials, prob = p_grid)

# multiply the likelihood by the prior at each point on the grid
unstd_posterior <- likelihood * prior

# standardize the posterior to sum to 1
posterior <- unstd_posterior / sum(unstd_posterior)

# plot the standardized posterior
plot(p_grid, posterior, type = "l")

# sample from posterior
set.seed(20190425)
nsims <- 1e4
samples <- sample(p_grid, prob = posterior, size = nsims, replace = TRUE)
summary(samples)

# analytic solution ----
a_prior <- 1
b_prior <- 1

trials <- 10
successes <- 5
failures <- trials - successes

a_posterior <- a_prior + successes 
b_posterior <- b_prior + failures

# plot the analytic posterior distribution
plot(p_grid, dbeta(p_grid, a_posterior, b_posterior))

# make some new data

# update the parameters

# plot the new posterior

# MCMC ----
library(rstan)
options(mc.cores = parallel::detectCores())
# rstan_options(auto_write = TRUE)

m_binomial <- stan_model("stan/binomial.stan")

d <- list(
  N = 10, 
  y = 5, 
  a = 1, 
  b = 1
)

fit_binomial <- sampling(m_binomial, data = d)

rstan::lookup("^binomial")

# extras ----
# what priors does rstanarm use by default for a binomial model?
library(rstanarm)
options(mc.cores = parallel::detectCores())

df <- data_frame(y = c(1, 1, 1, 1, 1, 0, 0, 0, 0, 0))

m <- stan_glm(y ~ 1, family = binomial(link = "logit"), 
              data = df)

summary(m)
prior_summary(m)
