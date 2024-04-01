#### Preamble ####
# Purpose: Simple Linear Regression Model for relationship between birth rate and female employment rate
# Author: Xu Qi
# Data: 28 March 2024
# Contact: xu.qi@mail.utoronto.ca
# License: MIT
# Pre-requisites: 02-data_cleaning.R

#### Workspace setup ####
library(tidyverse)
library(modelsummary)

#### Read data ####
analysis_data <- read.csv("data/analysis_data/canada_2009_2019.csv")

#### Create model ####

# Fit a linear model
model <- lm(Birth_Rate_per_1000_people ~ Female_Employment_Rate, data = analysis_data)

# Summary of the model to see results
modelsummary::modelsummary(
  list("Female Employment Rate" = model),
  fmt = 2
)

#### Save model ####
saveRDS(model, "models/linear_model.rds")

