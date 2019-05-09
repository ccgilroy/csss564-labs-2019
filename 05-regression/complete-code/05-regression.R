library(tidyverse)
library(pscl)

# data
df <- 
  as_tibble(unionDensity) %>%
  rownames_to_column(var = "country")

# scale data 
df_scaled <- 
  df %>%
  mutate(
    union = scale(union)[, 1],
    left = scale(left)[, 1]
  )

summary(df_scaled)

d <- list(
  N = length(df_scaled$union), 
  y = df_scaled$union, 
  x = df_scaled$left
)

library(rstan)
options(mc.cores = parallel::detectCores())
rstan_options(auto_write = TRUE)

# fit model
m_normal <- stan_model("stan/normal.stan")
fit_normal <- sampling(m_normal, data = d)

# print model fit

fit_ols <- lm(union ~ left, data = df_scaled)
summary(fit_ols)

# trace plots
stan_trace(fit_normal, pars = c("alpha", "beta", "sigma"))

# coefficient plots
stan_plot(fit_normal, pars = c("alpha", "beta", "sigma"))

# pairs plot
pairs(fit_normal, pars = c("alpha", "beta"))

library(bayesplot)

# extract y_rep draws from the stanfit object
samples <- rstan::extract(fit_normal, par = "y_rep")

# plot posterior predictive density overlay
ppc_dens_overlay(y = d$y, yrep = samples$y_rep[1:50, ])

# scale the rest of the data  
df_scaled <- 
  df_scaled %>%
  mutate(size = scale(size)[, 1], 
         concen = scale(concen)[, 1])

# it's a convention to use an upper-case X for a matrix of xs
X <- 
  df_scaled %>%
  select(left, size, concen) %>%
  as.matrix()

# alternatively (and this is better when you want to create dummy variables!)
# you'll want to drop the intercept using `[, -1]`
X <- model.matrix(union ~ left + size + concen, data = df_scaled)[, -1]

d2 <- d
d2$x <- NULL
d2$X <- X
d2$K <- ncol(X)

fit_normal_v2 <- stan("stan/normal_v2.stan", data = d2)
