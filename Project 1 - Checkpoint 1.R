install.packages("tidyverse")
install.packages("janitor")

library(tidyverse)
library(janitor)

cases_month <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/main/data/2025/2025-06-24/cases_month.csv')
cases_year  <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/main/data/2025/2025-06-24/cases_year.csv')

cases_month <- cases_month %>%
  janitor::clean_names() %>%
  dplyr::mutate(
    dplyr::across(year:discarded, as.numeric)
  )

cases_year <- cases_year %>%
  janitor::clean_names() %>%
  mutate(across(where(is.character), ~ suppressWarnings(as.numeric(.x))))

colnames(cases_month)
colnames(cases_year)

class(cases_month$month)
class(cases_year$country)

# Describe Context:
# This dataset explores measles and rubella cases across the world. 
# The data comes from the World Health Organisation and covers data from 2012 to 2025. 
# The number of cases of measles and rubella is only available by July of each year. 
# The full r dataset with the month and year information is stored in tt_data. 
# The month and year are stored in separate data objects that are tibbles. 


# Cleaning:
# For the cases by month data, we use the clean_names function from the janitor package which converts all column names to be all lowercase with spaces and special characters replaced with underscores. 
# This makes the column names consistently formatted so they are easy to work with. 
# With the mutate function, the non-string columns are converted into numeric data in case they weren’t already. 
# For the cases by year data, the first row was blank so we had to remove it and use the 2nd row as the column headers. 
# The column names were manually renamed as there were placeholder names before. 
# The slice(-1) function is what removes the first blank row. 

# 2 Research Questions possible with given data:
# Has measles case confirmation quality improved over time?
# Does the seasonality of measles outbreaks differ by region? 

# 2 Research Questions possible with supplemental data:
# Does measles incidence correlate with vaccination coverage gaps?
# Does political instability or conflict predict outbreak magnitude?






  



  
