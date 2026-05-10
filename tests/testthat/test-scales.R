test_that("ggplot2 scales can be constructed", {
  expect_s3_class(scale_colour_hf(), "ScaleDiscrete")
  expect_s3_class(scale_fill_hf(), "ScaleDiscrete")
  expect_s3_class(scale_fill_hf_tonal(), "ScaleContinuous")
  expect_s3_class(scale_fill_hf_warm(), "ScaleContinuous")
  expect_s3_class(scale_fill_hf_diverging(), "ScaleContinuous")
})

test_that("heatmap scales accept profile colour names and hex values", {
  expect_s3_class(
    scale_fill_hf_tonal(colours = c("grey_blue", "#FFFFFF", "blue")),
    "ScaleContinuous"
  )
  expect_s3_class(
    scale_fill_hf_diverging(low = "blue", mid = "#FFFFFF", high = "orange"),
    "ScaleContinuous"
  )
  expect_error(
    scale_fill_hf_tonal(colours = c("grey_blue", "not_a_colour", "blue")),
    "Unknown colour name"
  )
})
