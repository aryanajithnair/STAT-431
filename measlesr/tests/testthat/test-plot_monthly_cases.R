test_that("plot_monthly_cases works", {
  dat <- load_data("month")

  montly_cases_plot <- plot_monthly_cases(dat, year = 2018,
                                          country = "Madagascar")

  expect_s3_class(plot_montly_cases, "ggplot")

})
