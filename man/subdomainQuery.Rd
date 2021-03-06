% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/subdomainQuery.R
\name{subdomainQuery}
\alias{subdomainQuery}
\alias{subdomain_query}
\title{Query domains database - domain}
\usage{
subdomainQuery(domain, page, auth_token = be_auth_token())

subdomain_query(domain, page, auth_token = be_auth_token())
}
\arguments{
\item{domain}{target domain}

\item{page}{page number of query}

\item{auth_token}{authentication token for the API. See \code{\link[=be_auth_token]{be_auth_token()}}}
}
\description{
Query domains database to get list of all subdomains
}
