
![](man/figures/be-logo.png)

# binaryedge

Tools to Query and Orchestrate the ‘BinaryEdge’ ‘API’

## Description

‘BinaryEdge’ acquires, analyzes and classifies internet-wide data by
combining efforts in the areas of ‘cybersecurity’, engineering and data
science. Tools are provided to work with the ‘BinaryEdge’ ‘API’
\<app.binaryedge.io\>

To use this package you will need to go to <https://app.binaryedge.io>
and register for an account.

PRs welcome\!

## Functions:

  - `be_api_key`: Get or set `BINARYEDGE_API_KEY` value
  - `dnsipQuery`: Query DNS database - IP
  - `dnsQuery`: Query DNS database
  - `dns_ip_query`: Query DNS database - IP
  - `dns_query`: Query DNS database
  - `domaindataleakQuery`: Query dataleak database - domain
  - `domain_data_leak_query`: Query dataleak database - domain
  - `emaildataleakQuery`: Query dataleak database - email
  - `historicalQuery`: Query host database
  - `historicaltorrentQuery`: Query historical torrent
  - `hostQuery`: Query host database
  - `imageQuery`: Query image IP
  - `imagesearchQuery`: Image Query search
  - `riskscoreQuery`: Query Score for IP
  - `searchQuery`: Query search
  - `subdomainQuery`: Query domains database - domain
  - `torrentQuery`: Query torrent database

(NOTE: snake case versions are also provided)

## Installation

``` r
devtools::install_github("balgan/rbinaryedge")
```
