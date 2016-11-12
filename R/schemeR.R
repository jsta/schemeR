

#' get_names
#'
#' @param sqlite  SQLite database
#'
#' @export
#'
#' @examples \dontrun{
#' get_names(dplyr::tbl(dt, "TeamsHalf"))
#' }
get_names <- function(sqlite){
  dplyr::src_tbls(sqlite)
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


# df <- data.frame(a = c("b", "c"))
render_df <- function(df){

}



