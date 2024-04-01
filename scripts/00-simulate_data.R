#### Preamble ####
# Purpose: Simulate the data set of birth rate and female employment rate
# Author: Xu Qi
# Data: 27 March 2024
# Contact: xu.qi@mail.utoronto.ca
# License: MIT
# Pre-requisites: None

#### Workspace setup ####
library(tidyverse)
library(tibble)
library(dplyr)
set.seed(1212)


#### Simulate data ####
years <- 2009:2019
birth_rates <- round(runif(length(years), min = 9.5, max = 11.5), 2) # Simulating birth rates
female_employment_rates <- round(runif(length(years), min = 57, max = 59), 2) # Simulating employment rates

# Combine into a data frame
simulated_data <- tibble(
  Year = years,
  Birth_Rate = birth_rates,
  Female_Employment_Rate = female_employment_rates
)

# View the simulated data
print(simulated_data)

