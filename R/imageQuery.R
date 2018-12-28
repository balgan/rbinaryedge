#' Query image IP
#'
#' Query to get details of an image in an IP address
#'
#' @import httr
#' @import dplyr
#' @importFrom jsonlite fromJSON
#' @importFrom data.table as.data.table
#' @importFrom tidyr unnest
#'
#' @param ip target ip address
#' @param page page number of query
#' @param auth_token authentication token for the API
#' @export


imageQuery <- function(ip,page, auth_token) {

  content_query <- GET(paste0("https://api.binaryedge.io/v2/query/image/ip/",ip),add_headers("X-Key" = auth_token))
  raise <- content(content_query, as="text", encoding = 'UTF-8')

  fromJSON(raise, flatten = TRUE) %>%
    as.data.table() %>%
    # unnest() %>%
    replace(.=="NULL", NA)

}

