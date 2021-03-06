% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/split.R
\name{split_list}
\alias{split_list}
\title{Function to split list}
\usage{
split_list(x, sections = 1)
}
\arguments{
\item{x}{List object that need to be divided n sections}

\item{sections}{Split section number (row)}
}
\description{
Function to split list
}
\examples{
x <- list(a=1:3, b=2:4, c=3, d=4)
split_list(x, 2)
}
