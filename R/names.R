#' get_names
#'
#' @param db  SQLite database
#'
#' @export
#'
#' @examples \dontrun{
#' get_names(dplyr::lahman_sqlite())
#' }
get_names <- function(db){
  db_names <- dplyr::src_tbls(db)
  res <- lapply(db_names, function(x) get_columns(dplyr::tbl(db, x)))
  names(res) <- db_names

  res
}

#' get_colums
#'
#' @param tbl tibble
#'
#' @export
#'
get_columns <- function(tbl){
  names(data.frame(tbl))
}
