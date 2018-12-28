#' Query torrent database
#'
#' Query torrent database to extract information on CIDR or IP that downloaded torrents
#'
#' @import httr
#' @importFrom jsonlite fromJSON
#' @importFrom data.table as.data.table
#'
#' @param ip target IP address
#' @param auth_token authentication token for the API
#' @export


torrentQuery <- function(ip, auth_token) {

  content_query <- GET(paste0("https://api.binaryedge.io/v2/query/torrent/ip/",ip),add_headers("X-Key" = auth_token))
  raise <- content(content_query, as="text", encoding = 'UTF-8')

  fromJSON(raise, flatten = TRUE) %>%
    as.data.table() %>%
    unnest() %>%
    replace(.=="NULL", NA)



}

