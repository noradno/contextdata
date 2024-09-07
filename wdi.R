# WDI data

library("WDI")
library("readr")

#help(package = "WDI")

# Metadata - WDI series and countries information
wdi_meta <- WDI::WDI_data

# Search for indicators
WDIsearch('gdp per capita')

# Fetch data: population data for the most recent year available, including extra country information
# Get the 5 latest non-NA values. Include extra meta info. Start year 2020
df_wdi <- WDI(
  country = "all",
  indicator = c(
    gdppc_ppp_current = "NY.GDP.PCAP.PP.CD",
    gdppc_ppp_constant2017 = "NY.GDP.PCAP.PP.KD",
    gdppc_constant_lcu = "NY.GDP.PCAP.KN"
  ),
  start = 2020,
  latest = 1,
  extra = TRUE
)

# Save dataset
write_rds(df_wdi, "output/wdi.rds")
