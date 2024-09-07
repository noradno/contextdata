# Load .rds files and save data as database tables in a duckdb database file

library(readr)
library(dbplyr)
library(duckdb)
library(DBI)

# Load data ---------------------------------------------------------------

wdi <- read_rds("output/wdi.rds")

# Save in DuckDB database file --------------------------------------------

con <- DBI::dbConnect(duckdb::duckdb(), "C:/Users/aaw262/Norad/Norad-Avd-Kunnskap - Statistikk og analyse/06. Statistikkdatabaser/3. Databasefiler/context.duckdb")

# Write tibble called statsys to database
dbWriteTable(con, "wdi", wdi, overwrite = TRUE)

# Check Tables in database
dbListTables(con)

# To remove a table
# Remove the oda table from the database
#dbRemoveTable(con, "wdi")

# Properly closing the connection
dbDisconnect(con, shutdown=TRUE)
