domino_data_sources <- NULL

.onLoad <- function(libname, pkgname) {
  py_select_interpreter()

  domino_data_sources <<- reticulate::import(
    "domino_data.data_sources",
    delay_load = TRUE
  )
}
