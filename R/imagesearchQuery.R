#' Image Query search
#'
#' Query for search in images to look specific countries or terms
#'
#' @import httr
#' @import dplyr
#' @importFrom jsonlite fromJSON
#' @importFrom data.table as.data.table
#' @importFrom tidyr unnest
#'
#' @param searchparameter search parameter to use on query
#' @param page page number of query
#' @param auth_token authentication token for the API
#' @export


imagesearchQuery <- function(searchparameter,page, auth_token) {

  content_query <- GET(paste0("https://api.binaryedge.io/v2/query/image/search?query=",gsub(" ","%20",searchparameter),"&page=",page),add_headers("X-Key" = auth_token))
  raise <- content(content_query, as="text", encoding = 'UTF-8')

  fromJSON(raise, flatten = TRUE) %>%
    as.data.table() %>%
    # unnest() %>%
    replace(.=="NULL", NA)

}

