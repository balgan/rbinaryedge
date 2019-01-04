if (getRversion() >= "2.15.1") utils::globalVariables(c("."))

#' Query domains database - domain
#'
#' Query domains database to get list of all subdomains
#'
#' @import httr
#' @importFrom jsonlite fromJSON
#' @importFrom data.table as.data.table
#' @param domain target domain
#' @param page page number of query
#' @param auth_token authentication token for the API. See [be_auth_token()]
#' @export
subdomainQuery <- function(domain, page, auth_token = be_auth_token()) {
  content_query <- httr::GET(
    url = sprintf("https://api.binaryedge.io/v2/query/domains/subdomain/%s", domain),
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
    tidyr::unnest() %>%
    replace(. == "NULL", NA)
}

#' @rdname subdomainQuery
#' @export
subdomain_query <- subdomainQuery
