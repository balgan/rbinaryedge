#' Query DNS database - IP
#'
#' Query dns database to get list dns information for a IP
#'
#' @import httr
#' @importFrom jsonlite fromJSON
#' @importFrom data.table as.data.table
#' @param ip target ip
#' @param page page number of query
#' @param auth_token authentication token for the API. See [be_auth_token()]
#' @export
dnsipQuery <- function(ip, page, auth_token = be_auth_token()) {
  content_query <- httr::GET(
    url = sprintf("https://api.binaryedge.io/v2/query/domains/ip/%s", ip),
    query = list(
      page = page
    ),
    httr::add_headers("X-Key" = auth_token),
    httr::user_agent(.be_ua)
  )

  httr::stop_for_status(content_query)

  raise <- httr::content(content_query, as = "text", encoding = "UTF-8")

  jsonlite::fromJSON(raise, flatten = TRUE) %>%
    data.table::as.data.table() %>%
    # unnest() %>%
    replace(. == "NULL", NA)
}

#' @rdname dnsipQuery
#' @export
dns_ip_query <- dnsipQuery
