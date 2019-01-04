#' Image Query search
#'
#' Query for search in images to look specific countries or terms
#'
#' @import httr
#' @import dplyr
#' @importFrom jsonlite fromJSON
#' @importFrom data.table as.data.table
#' @importFrom tidyr unnest
#' @param searchparameter search parameter to use on query
#' @param page page number of query
#' @param auth_token authentication token for the API. See [be_auth_token()]
#' @export
imagesearchQuery <- function(searchparameter, page, auth_token = be_auth_token()) {

  content_query <- httr::GET(
    url = "https://api.binaryedge.io/v2/query/image/search",
    query = list(
      query = searchparameter,
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

#' @rdname imagesearchQuery
#' @export
image_search_query <- imagesearchQuery
