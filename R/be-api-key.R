#' Get or set BINARYEDGE_API_KEY value
#'
#' The API wrapper functions in this package all rely on a BinaryEdge API
#' key residing in the environment variable `BINARYEDGE_API_KEY`. The
#' easiest way to accomplish this is to set it in the `~.Renviron`` file in your
#' home directory.
#'
#' @param force force setting a new omdb API key for the current environment?
#' @return atomic character vector containing the BinaryEdge API key
#' @export
be_auth_token <- function(force = FALSE) {
  env <- Sys.getenv("BINARYEDGE_API_KEY")
  if (!identical(env, "") && !force) return(env)

  if (!interactive()) {
    stop("Please set env var BINARYEDGE_API_KEY to your BinaryEdge API key",
      call. = FALSE
    )
  }

  message("Couldn't find env var BINARYEDGE_API_KEY See ?BINARYEDGE_API_KEY for more details.")
  message("Please enter your API key and press enter:")
  pat <- readline(": ")

  if (identical(pat, "")) {
    stop("BinaryEdge API key entry failed", call. = FALSE)
  }

  message("Updating BINARYEDGE_API_KEY env var...")

  Sys.setenv(BINARYEDGE_API_KEY = pat)

  pat
}
