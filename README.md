# DominoDataR

<!-- badges: start -->
[![R-CMD-check](https://github.com/dominodatalab/DominoDataR/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/dominodatalab/DominoDataR/actions/workflows/R-CMD-check.yaml)
![cran-check](https://badges.cranchecks.info/summary/DominoDataR.svg)
<!-- badges: end -->

Domino Data API for interacting with Domino Data Sources.

## Installation

### Via CRAN

You can install the latest release directly from CRAN

``` r
install.packages("DominoDataR")
```

### Via 'remotes' or 'devtools'

You can install the development version of DominoDataR like so:

``` r
install.packages("remotes")
remotes::install_github("dominodatalab/DominoDataR")
```

## Prerequisite
The Domino Data R library depends on the [Python
library](https://pypi.org/project/dominodatalab-data/). You can 
install it manually or use the included helper function:

``` r
DominoDataR::py_domino_data_install()
```
