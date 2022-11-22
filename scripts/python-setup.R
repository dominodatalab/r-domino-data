source("R/python.R")

python_select_interpreter()

# Install the (Python) domino_data package.
#
if (!reticulate::py_module_available("domino_data")) {
  reticulate::py_install("dominodatalab-data", pip = TRUE, method = "virtualenv")
}