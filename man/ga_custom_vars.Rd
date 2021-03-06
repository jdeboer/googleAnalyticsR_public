% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/custom_dims_mets.R
\name{ga_custom_vars}
\alias{ga_custom_vars}
\title{Get Custom Dimensions or Metrics}
\usage{
ga_custom_vars(
  accountId,
  webPropertyId,
  type = c("customMetrics", "customDimensions"),
  customId
)
}
\arguments{
\item{accountId}{Account Id}

\item{webPropertyId}{Web Property Id}

\item{type}{A customMetric or customDimension}

\item{customId}{The customMetricId or customDimensionId}
}
\value{
Custom Metric or Dimension meta data
}
\description{
Get Custom Dimensions or Metrics
}
\seealso{
Other custom variable functions: 
\code{\link{ga_custom_vars_create}()},
\code{\link{ga_custom_vars_list}()},
\code{\link{ga_custom_vars_patch}()}
}
\concept{custom variable functions}
