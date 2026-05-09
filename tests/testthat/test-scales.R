test_that("ggplot2 scales can be constructed", {
  expect_s3_class(scale_colour_hf(), "ScaleDiscrete")
  expect_s3_class(scale_fill_hf(), "ScaleDiscrete")
})
