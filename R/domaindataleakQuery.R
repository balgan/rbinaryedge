#' Query dataleak database - domain
#'
#' Query dataleak database for domain
#'
#' @import httr
#' @importFrom jsonlite fromJSON
#' @importFrom data.table as.data.table
#' @param domain target domain
#' @param auth_token authentication token for the API. See [be_auth_token()]
#' @export
domaindataleakQuery <- function(domain, auth_token = be_auth_token()) {
  content_query <- httr::GET(
    url = sprintf("https://api.binaryedge.io/v2/query/dataleaks/organization/%s", domain),
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

#' @rdname domaindataleakQuery
#' @export
domain_data_leak_query <- domaindataleakQuery
