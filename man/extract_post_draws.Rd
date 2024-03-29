% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fcts.R
\name{extract_post_draws}
\alias{extract_post_draws}
\title{Parameter posterior draws}
\usage{
extract_post_draws(data, fit, par = c("drift", "boundary"))
}
\arguments{
\item{data}{dataframe with the following columns:
\itemize{
\item subject: vector of size n containing the participant labels
\item block: vector of size n containing the training blocks (longitudinal units)
\item s: vector of size n containing the stimuli
\item d: vector of size n containing the decisions
\item r_time: vector of size n containing the response times
\item cens: vector of size n containing the censoring indicators (1 censored, 0 non censored)
}}

\item{fit}{fit from the lddmm function}

\item{par}{parameter to output ('drift', or 'boundary')}
}
\value{
Matrix with the following columns:
\itemize{
\item subject: participant labels
\item block: training blocks
\item draw: iteration of the MCMC estimates
\item par_s_d, ...: posterior draws for the requested parameters
}
}
\description{
Function to extract the posterior draws of the parameters of interest from a lddmm fit object.
}
