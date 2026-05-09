test_that("helse_palette returns named HEX colours", {
  colours <- helse_palette()

  expect_named(colours)
  expect_equal(colours[["blue"]], "#003087")
  expect_match(unname(colours), "^#[0-9A-F]{6}$")
})

test_that("helse_palette can select colours", {
  expect_equal(
    helse_palette(c("blue", "red")),
    c(blue = "#003087", red = "#CB333B")
  )
})

test_that("helse_palette rejects unknown colours", {
  expect_error(helse_palette("not-a-colour"), "Unknown colour")
})
