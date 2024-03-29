#loads several R packages
library("janitor")
library("knitr")
library("lubridate")
library("opendatatoronto")
library("tidyverse")

# Download the data by using R
library(opendatatoronto)
packages <- list_packages()
packages
polls<-show_package("7bce9bf4-be5c-4261-af01-abfbc3510309")
polls111 <- search_packages("Polls conducted by the City")
polls1111 <- polls111 %>%
  list_package_resources()
toronto_polls <-
  list_package_resources("7bce9bf4-be5c-4261-af01-abfbc3510309") |>
  filter(name == 
           "Polls Data.csv") |>
  get_resource()

#output a csv file in R
write_csv(
  x = toronto_polls,
  file = "/cloud/project/input/data/toronto_polls.csv"
)

#Display the first 6 rows
head(toronto_polls)