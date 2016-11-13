#' export_svg
#' @param rendered output from \code{\link[schemeR]{render_sqlite}} or \code{\link[schemeR]{render_df}}
#' @param fpath file.path
#'
#' @export
#' @importFrom DiagrammeRsvg export_svg
#' @importFrom rsvg rsvg
#' @importFrom png writePNG
#'
#' @details https://github.com/rich-iannone/DiagrammeR/issues/133

export_svg <- function(rendered, fpath){

  res <- DiagrammeRsvg::export_svg(rendered)
  res <- charToRaw(res)
  res <- rsvg::rsvg(res, height = 500)
  png::writePNG(res, fpath)

}
