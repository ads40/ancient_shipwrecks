#####################################################################################
#
# Import shipwrecks data into RDS file
#
# Source: Strauss, J. (2013). Shipwrecks Database. Version 1.0.
#         Accessed (date): oxrep.classics.ox.ac.uk/databases/shipwrecks_database/
#
#####################################################################################

library(dplyr)
library(readr)

raw_file <- "original_data/StraussShipwrecks/StraussShipwrecks.csv"

col_spec <- cols(
  `Wreck ID` = col_double(),
  `Strauss ID` = col_double(),
  Name = col_character(),
  `Parker Number` = col_character(),
  `Sea area` = col_character(),
  Country = col_character(),
  Region = col_character(),
  Latitude = col_double(),
  Longitude = col_double(),
  `Min depth` = col_double(),
  `Max depth` = col_double(),
  Depth = col_character(),
  Period = col_character(),
  Dating = col_character(),
  `Earliest date` = col_double(),
  `Latest date` = col_double(),
  `Date range` = col_double(),
  `Mid point of date range` = col_double(),
  Probability = col_double(),
  `Place of origin` = col_character(),
  `Place of destination` = col_character(),
  Reference = col_character(),
  Comments = col_character(),
  Amphorae = col_logical(),
  Marble = col_logical(),
  `Columns etc` = col_logical(),
  Sarcophagi = col_logical(),
  Blocks = col_logical(),
  `Marble type` = col_character(),
  `Other cargo` = col_character(),
  `Hull remains` = col_character(),
  `Shipboard paraphernalia` = col_character(),
  `Ship equipment` = col_character(),
  `Estimated tonnage` = col_double(),
  `Amphora type` = col_character()
)

df <- read_csv(raw_file, col_types = col_spec) %>%
  rename_with(~ tolower(gsub(" ", "_", .x, fixed = TRUE)))

# RDS is the better choice: one object per file, and you assign the assign the result of
# `readRDS` to a name of your choosing.

saveRDS(df, "processed_data/shipwrecks.RDS")
