% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/widely_hclust.R
\name{widely_hclust}
\alias{widely_hclust}
\title{Cluster pairs of items into groups using hierarchical clustering}
\usage{
widely_hclust(tbl, item1, item2, distance, k = NULL, h = NULL)
}
\arguments{
\item{tbl}{Table}

\item{item1}{First item}

\item{item2}{Second item}

\item{distance}{Distance column}

\item{k}{The desired number of groups}

\item{h}{Height at which to cut the hierarchically clustered tree}
}
\description{
Reshape a table that represents pairwise distances into hierarchical clusters,
returning a table with \code{item} and \code{cluster} columns.
}
\examples{

library(gapminder)
library(dplyr)

# Construct Euclidean distances between countries based on life
# expectancy over time
country_distances <- gapminder \%>\%
  pairwise_dist(country, year, lifeExp)

country_distances

# Turn this into 5 hierarchical clusters
clusters <- country_distances \%>\%
  widely_hclust(item1, item2, distance, k = 8)

# Examine a few such clusters
clusters \%>\% filter(cluster == 1)
clusters \%>\% filter(cluster == 2)

}
\seealso{
\link{cutree}
}
