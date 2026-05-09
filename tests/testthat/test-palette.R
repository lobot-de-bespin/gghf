test_that("hf_palette returns named HEX colours", {
  colours <- hf_palette()

  expect_named(colours)
  expect_equal(colours[["blue"]], "#003087")
  expect_match(unname(colours), "^#[0-9A-F]{6}$")
})

test_that("hf_palette can select colours", {
  expect_equal(
    hf_palette(c("blue", "red")),
    c(blue = "#003087", red = "#CB333B")
  )
})

test_that("hf_palette rejects unknown colours", {
  expect_error(hf_palette("not-a-colour"), "Unknown colour")
})
