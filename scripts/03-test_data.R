#### Preamble ####
# Purpose: Tests a dataset to ensure it's validity.
# Author: Xu Qi
# Data: 27 March 2024
# Contact: xu.qi@mail.utoronto.ca
# License: MIT
# Pre-requisites: To have ran the cleaning script to test the cleaned datasets

#### Workspace setup ####
library(tidyverse)

#### Read data ####
canada_2009_2019 <- read.csv("data/analysis_data/canada_2009_2019.csv")

#### Test data ####

## Test if there are 11 years
canada_2009_2019$Year |> min(na.rm = TRUE) >=11

## Test if the lowest Employment Rate is 54.616%
canada_2009_2019$Female_Employment_Rate |> min() == 54.616

## Test if the highest Employment Rate is 58.453%
canada_2009_2019$Female_Employment_Rate |> max() == 58.453

## Test if the lowest birth rate is 9.9
canada_2009_2019$Birth_Rate_per_1000_people |> min() == 9.9

## Test if the highest birth rate is 11.5
canada_2009_2019$Birth_Rate_per_1000_people |> max() == 11.5

