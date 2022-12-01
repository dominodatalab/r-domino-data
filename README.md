# DominoDataR

<!-- badges: start -->
[![R-CMD-check](https://github.com/dominodatalab/DominoDataR/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/dominodatalab/DominoDataR/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

Domino Data API for interacting with Domino Data Sources.

## Installation

You can install the development version of DominoDataR like so:

``` r
install.packages("remotes")
remotes::install_github("dominodatalab/DominoDataR")
```

The Domino Data R library depends on the [python
library](https://pypi.org/project/dominodatalab-data/). Make sure it is
installed in your environment or use the following command:

``` r
library(reticulate)
py_install("dominodatalab-data")
```
