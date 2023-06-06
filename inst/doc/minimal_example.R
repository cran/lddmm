## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
# Load libraries
library(RColorBrewer)
library(ggplot2)
library(dplyr)
library(reshape2)
library(latex2exp)
library(lddmm)

theme_set(theme_bw(base_size = 14))
cols <- brewer.pal(9, "Set1")

## ---- eval = TRUE, results = 'hide', fig.show = 'hide', warning = FALSE, message = FALSE----
# Load the data
data('data')

# Descriptive plots
plot_accuracy(data)
plot_RT(data)

# Run the model
hypers <- NULL
hypers$s_sigma_mu <- hypers$s_sigma_b <- 0.1

# Change the number of iterations when running the model
# Here the number is small so that the code can run in less than 1 minute
Niter <- 25
burnin <- 15
thin <- 1
samp_size <- (Niter - burnin) / thin

set.seed(123)
fit <- LDDMM(data = data, 
             hypers = hypers, 
             Niter = Niter, 
             burnin = burnin, 
             thin = thin)

# Plot the results
plot_post_pars(data, fit, par = 'drift')
plot_post_pars(data, fit, par = 'boundary')

# Compute the WAIC to compare models
compute_WAIC(fit)

