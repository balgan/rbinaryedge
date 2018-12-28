#' Query host database
#'
#' Query historical endpoint to extract information on CIDR or IP
#'
#' @import httr
#' @import dplyr
#' @importFrom jsonlite fromJSON
#' @importFrom data.table as.data.table
#' @importFrom tidyr unnest
#'
#' @param ip target IP address
#' @param auth_token authentication token for the API
#' @export


historicalQuery <- function(ip, auth_token) {

  content_query <- GET(paste0("https://api.binaryedge.io/v2/query/ip/historical/",ip),add_headers("X-Key" = auth_token))
  raise <- content(content_query, as="text", encoding = 'UTF-8')

  fromJSON(raise, flatten = TRUE) %>%
    as.data.table() %>%
    # unnest() %>%
    replace(.=="NULL", NA)

}

