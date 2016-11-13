
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

#' render_df
#'
#' @param df
#'
#' @export
#' @importFrom DiagrammeR create_node_df generate_dot grViz create_graph
#' @examples
#' df <- data.frame(
#'          "name" = 1:4,
#'          "people" = c("bob", "jim", "beatrice", "ann"))
#'          render_df(df)
#'
render_df <- function(df){

  labels <- df_2_dot("df", df)

  ndf <-
    DiagrammeR::create_node_df(
      n = 1,
      label = c(labels),
      shape = c("record", "record"))
  graph <- DiagrammeR::create_graph(nodes_df = ndf)

  dot_txt <- DiagrammeR::generate_dot(graph)
  dot_txt <- gsub("neato,", "neato, rankdir = 'LR',", dot_txt)

  DiagrammeR::grViz(diagram = dot_txt)
}

#' df_2_dot
#'
#' @param df
#'
#' @export
#'
#' @examples
#' df <- data.frame(
#'          "name" = 1:4,
#'          "people" = c("bob", "jim", "beatrice", "ann"))
#' df_2_dot("df", df)
df_2_dot <- function(df_name, df){
  paste(df_name, paste(names(df), collapse = "| "), sep = "| ")
}
