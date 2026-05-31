filter_by_country <- function(data, country) {

  if (!("country" %in% names(data))) {
    stop("Data must contain a 'country' column.")
  }

  filtered <- data[data$country == country, ]

  if (nrow(filtered) == 0) {
    stop("No data found for country = '", country, "'.")
  }

  return(filtered)
}
