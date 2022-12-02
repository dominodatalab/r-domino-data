if (nzchar(Sys.getenv('CI'))) return()

source("R/python.R")

py_domino_data_install()
