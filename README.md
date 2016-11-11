
<!-- README.md is generated from README.Rmd. Please edit that file -->
schemeR
=======

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
dt <- dplyr::lahman_sqlite()

dplyr::src_tbls(dt)
#>  [1] "AllstarFull"         "Appearances"         "AwardsManagers"     
#>  [4] "AwardsPlayers"       "AwardsShareManagers" "AwardsSharePlayers" 
#>  [7] "Batting"             "BattingPost"         "CollegePlaying"     
#> [10] "Fielding"            "FieldingOF"          "FieldingPost"       
#> [13] "HallOfFame"          "LahmanData"          "Managers"           
#> [16] "ManagersHalf"        "Master"              "Pitching"           
#> [19] "PitchingPost"        "Salaries"            "Schools"            
#> [22] "SeriesPost"          "Teams"               "TeamsFranchises"    
#> [25] "TeamsHalf"           "sqlite_stat1"
```
