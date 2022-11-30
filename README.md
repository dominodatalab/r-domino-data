
<!-- README.md is generated from README.Rmd. Please edit that file -->

# DominoDataR

<!-- badges: start -->
<!-- badges: end -->

Domino Data API for interacting with Data features.

## Installation

You can install the development version of DominoDataR like so:

``` r
install.packages("remotes")
remotes::install_github("dominodatalab/DominoDataR")
```

The Domino Data R library depends on the [Python
library](https://pypi.org/project/dominodatalab-data/). This should be
installed automatically when `{DominoDataR}` is installed. You can also
install manually.

``` r
library(DominoDataR)
py_domino_data_install()
```
