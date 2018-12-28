#' Query dataleak database - email
#'
#' Query dataleak database for single email
#'
#' @import httr
#' @importFrom jsonlite fromJSON
#' @importFrom data.table as.data.table
#'
#' @param email target email address
#' @param auth_token authentication token for the API
#' @export


emaildataleakQuery <- function(email, auth_token) {

  content_query <- GET(paste0("https://api.binaryedge.io/v2/query/dataleaks/email/",email),add_headers("X-Key" = auth_token))
  raise <- content(content_query, as="text", encoding = 'UTF-8')

  fromJSON(raise, flatten = TRUE) %>%
    as.data.table() %>%
    unnest() %>%
    replace(.=="NULL", NA)



}

