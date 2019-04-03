---
title: "Resources for Bayesian computation"
author: "Connor Gilroy"
output: 
  html_document:
    toc: true
---

# Documentation

## Vignettes

Practical examples are a great place to start when learning Bayesian computational techniques. 

The Stan case studies here are complex but well-documented: https://mc-stan.org/users/documentation/case-studies.html

The `rstanarm` vignettes are simpler, but give a good lay of the land: http://mc-stan.org/rstanarm/articles/index.html

## Manual

Eventually, you'll find yourself needing to tackle the behemoth that is the Stan manual. It used to be one 400-page pdf, but they split it into three (which you can also read in html online): 

The *User's Guide*: https://mc-stan.org/docs/2_19/stan-users-guide/index.html. Fantastic examples of just about every type of model you could want to fit in Stan, and programming tips for making your models better.

The *Language Reference Manual*: https://mc-stan.org/docs/2_19/reference-manual/index.html. See some weird syntax? Look it up here.

The *Functions Reference*: https://mc-stan.org/docs/2_19/functions-reference/index.html. Want to know what a particular distribution's function is call, and what the parameters are? This will tell you.

# Blogs

Bayesian statistics, particularly the computational side, is a fast-moving field. Because of that, blogs by leading Bayesian statisticians are a great way to stay up to date. 

## Gelman et al

Andrew Gelman and others involved in the Stan project run this excellent blog about Bayesian statistics: https://statmodeling.stat.columbia.edu/

As an example, have a look at this blog post by Dan Simpson, about the Gelman-Rubin diagnostic $\hat{R}$: 

https://statmodeling.stat.columbia.edu/2019/03/19/maybe-its-time-to-let-the-old-ways-die-or-we-broke-r-hat-so-now-we-have-to-fix-it/

What he's saying won't make sense yet, but it will! And, eventually, it'll be implemented in Stan for the rest of us to use. 

## McElreath

Richard McElreath, author of *Statistical Rethinking*, also has a blog with a few really good posts: http://elevanth.org/blog/

We'll use some of them as references for later labs. He also records lectures based on his book, in case hearing things in a different way is helpful to you: https://www.youtube.com/channel/UCNJK6_DZvcMqNSzQdEkzvzA
