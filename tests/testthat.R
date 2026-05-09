if (requireNamespace("testthat", quietly = TRUE)) {
  library(testthat)
  library(gghf)

  test_check("gghf")
} else {
  message("testthat is not installed; skipping tests")
}
