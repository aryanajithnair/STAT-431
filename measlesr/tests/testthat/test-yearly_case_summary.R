test_that("cases by year summary works", {
  cases_year <- load_data()
  result <- yearly_case_summary(cases_year, country = "Madagascar")

  expect_s3_class(result, "tbl_df")

  expect_equal(names(result), c("year", "total_cases", "pct_change", "trend"))

  expect_equal(result$year[1], 2012)
  expect_equal(result$total_cases[1], 3)
  expect_equal(result$pct_change[1], 0)
  expect_equal(result$trend[1], "stable")

  expect_equal(result$year[5], 2016)
  expect_equal(result$total_cases[5], 17)
  expect_equal(result$pct_change[5], 183.3)
  expect_equal(result$trend[5], "surging")
})
