test_that("filter_by_country works", {
  cases_year <- load_data()

  result <- filter_by_country(cases_year, country = "Madagascar")
  expect_true(all(result$country == "Madagascar"))

  expect_s3_class(result, "data.frame")

  expect_error(filter_by_country(data.frame(x = 1), country = "Madagascar"),
               "must contain a 'country' column")

  expect_error(filter_by_country(cases_year, country = "Narnia"),
               "No data found for country")
})
