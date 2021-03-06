% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cli.R
\name{print_help}
\alias{print_help}
\title{Printing an usage message from an OptionParser object}
\usage{
print_help(object, help_order = c("description", "usage", "options",
  "subcmds", "epilogue"))
}
\arguments{
\item{object}{A opt_parser instance.}

\item{help_order}{The order to print the help message ['description', 'usage', 'options', 'subcmds', 'epilogue']}
}
\description{
Modifed from \code{\link[optparse]{print_help}}
}
\examples{
option_list <- list(
  make_option(c('-l', '--list-all-subcmds'), action = 'store_true', 
  default = FALSE, help = 'Print all supported subcmds of ngsjs.')
)
subcmds_list <- list(subcmd1 = 'Use method 1 to plot boxplot', 
                     subcmd2 = 'Use method 2 to plot boxplot')
description <- 'Method to plot boxplot'
usage <- 'usage: \%prog [options] [params]'
opt_parser_obj <- opt_parser(subcmds_list = subcmds_list, 
                            option_list = option_list,
                            description = description,
                            usage = usage)
print_help(opt_parser_obj)
}
