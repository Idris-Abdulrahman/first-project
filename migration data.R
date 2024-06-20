if(!require(pacman)) install.packages("pacman")
pacman::p_load(
  tidyverse,
  inspectdf,
  plotly,
  janitor,
  visdat,
  esquisse,
  readr,
  skimr
)
library("tidyverse")
# Load dataset

migration <- read_csv("Migration.csv")
view(migration)
migration

dim(migration)

esquisse::esquisser(migration)

min_country_1960 <- migration_data %>%
  filter(migration_data$X1960 == "-66870")
country_name <- which(migration_data$X1960 %in% min_country_1960$X1960)
country_name_1960$



