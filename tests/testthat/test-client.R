test_that("client can be initialized", {
  testthat::skip_if_not(
    reticulate::py_available("domino_data"),
    "Domino Data library is not available for testing"
  )
  token_file <- tempfile()
  writeLines("TOKEN", token_file)

  expect_no_error(DominoDataR::datasource_client(api_key = "API_KEY"))
  expect_no_error(DominoDataR::datasource_client(token_file = token_file))
  expect_no_error(DominoDataR::datasource_client())
})
