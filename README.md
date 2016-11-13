
<!-- README.md is generated from README.Rmd. Please edit that file -->
schemeR
=======

[![Project Status: WIP - Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](http://www.repostatus.org/badges/latest/wip.svg)](http://www.repostatus.org/#wip)

The goal of schemeR is to visualize SQLite databases.

Installation
------------

You can install schemeR from github with:

``` r
# install.packages("devtools")
devtools::install_github("jsta/schemeR")
```

Usage
-----

This is a basic example:

``` r
library(schemeR)

dt <- dplyr::lahman_sqlite()

dt_names <- get_names(dt)
dt <- lapply(dt_names, function(x) get_columns(dplyr::tbl(dt, x)))
names(dt) <- dt_names
```

``` r
df <- data.frame(
          "name" = 1:4,
          "people" = c("bob", "jim", "beatrice", "ann"))

# https://github.com/rich-iannone/DiagrammeR/issues/133
res <- schemeR::render_df(df)

res <- DiagrammeRsvg::export_svg(res)

res <- charToRaw(res)

res <- rsvg::rsvg(res, height = 500)

png::writePNG(res, "images/example.png")
```

![](images/example.png)

References
----------

<http://graphviz.org/content/datastruct>

<https://rich-iannone.github.io/DiagrammeR/graphviz_and_mermaid.html>

<https://github.com/rich-iannone/DiagrammeR/issues/133>
