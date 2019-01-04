#' Query torrent database
#'
#' Query torrent database to extract information on CIDR or IP that downloaded torrents
#'
#' @import httr
#' @importFrom jsonlite fromJSON
#' @importFrom data.table as.data.table
#' @param ip target IP address
#' @param auth_token authentication token for the API. See [be_auth_token()]
#' @export
torrentQuery <- function(ip, auth_token = be_auth_token()) {
  content_query <- httr::GET(
    url = sprintf("https://api.binaryedge.io/v2/query/torrent/ip/%s", ip),
    httr::add_headers("X-Key" = auth_token),
    httr::user_agent(.be_ua)
  )

  httr::stop_for_status(content_query)

  raise <- httr::content(content_query, as = "text", encoding = "UTF-8")

  jsonlite::fromJSON(raise, flatten = TRUE) %>%
    data.table::as.data.table() %>%
    tidyr::unnest() %>%
    replace(. == "NULL", NA)
}

#' @rdname torrentQuery
#' @export
torrent_query <- torrentQuery
