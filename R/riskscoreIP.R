#' Query Score for IP
#'
#' Query risk score for ip address
#'
#' @import httr
#' @importFrom jsonlite fromJSON
#' @importFrom data.table as.data.table
#'
#' @param ip target IP address
#' @param auth_token authentication token for the API
#' @export


riskscoreQuery <- function(ip, auth_token) {

  content_query <- GET(paste0("https://api.binaryedge.io/v2/query/score/ip/",ip),add_headers("X-Key" = auth_token))
  raise <- content(content_query, as="text", encoding = 'UTF-8')

  fromJSON(raise, flatten = TRUE) %>%
    as.data.table() %>%
    #unnest() %>%
    replace(.=="NULL", NA)



}

