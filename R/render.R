#' char_2_dot
#'
#' @param char character
#'
#' @export
#'
#' @examples
#' db <- dplyr::lahman_sqlite()
#' db_names <- get_names(db)["AllstarFull"]
#'
#' char_2_dot(db_names)
char_2_dot <- function(char){

  sapply(seq_along(char),
    function(x) paste(names(char)[x],
                paste(unlist(char[x]), collapse = "| "), sep = "| "))
}

#' df_2_dot
#'
#' @param df data.frame
#' @param df_name character name of data.frame
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


#' render_df
#'
#' @param df data.frame
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


#' render_sqlite
#'
#' @param db SQLite database
#' @export
#'
#' @examples
#'
#' render_sqlite(dplyr::lahman_sqlite())
render_sqlite <- function(db){

  db_names <- get_names(db)
  labels <- char_2_dot(db_names)

  ndf <-
    DiagrammeR::create_node_df(
      n = length(db_names),
      label = c(labels),
      fixedsize = FALSE,
      fontsize = rep(5, length(db_names)),
      shape = rep("record", length(db_names)))
  graph <- DiagrammeR::create_graph(nodes_df = ndf)

  dot_txt <- DiagrammeR::generate_dot(graph)
  dot_txt <- gsub("neato,", "neato, rankdir = 'LR',", dot_txt)

  DiagrammeR::grViz(diagram = dot_txt)
}
