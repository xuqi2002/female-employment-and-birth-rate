#### Preamble ####
# Purpose: Clean the raw data to gather relevant data for analysis
# Author: Xu Qi
# Data: 27 March 2024
# Contact: xu.qi@mail.utoronto.ca
# License: MIT
# Pre-requisites: Download the global employment rate and birth rate data from World Bank Open Data.

#### Workspace setup ####
library(tidyverse)
library(arrow)

#### Clean data ####

# Read the birth rate data
birth_rate_data <- read_csv("data/raw_data/API_SP.DYN.CBRT.IN_DS2_en_csv_v2_1402.csv", skip = 4)
canada_birth_rate <- birth_rate_data %>% 
  filter(`Country Name` == "Canada") %>% 
  select(`2009`:`2019`) %>% 
  pivot_longer(cols = everything(), names_to = "Year", values_to = "Birth_Rate_per_1000_people")

# Read the female employment rate data
employment_rate_data <- read_csv("data/raw_data/API_SL.EMP.TOTL.SP.FE.NE.ZS_DS2_en_csv_v2_3580.csv", skip = 4)
canada_employment_rate <- employment_rate_data %>% 
  filter(`Country Name` == "Canada") %>% 
  select(`2009`:`2019`) %>% 
  pivot_longer(cols = everything(), names_to = "Year", values_to = "Female_Employment_Rate")

# Combine the datasets
combined_data <- left_join(canada_birth_rate, canada_employment_rate, by = "Year")

# Save the combined data to a new CSV file
write_csv(combined_data, "data/analysis_data/canada_2009_2019.csv")

write_parquet(combined_data, "data/analysis_data/canada_2009_2019.parquet")

