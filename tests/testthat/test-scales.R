test_that("ggplot2 scales can be constructed", {
  expect_s3_class(scale_colour_helse(), "ScaleDiscrete")
  expect_s3_class(scale_fill_helse(), "ScaleDiscrete")
})
