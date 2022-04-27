#### Preamble ####
# Purpose: Prepare the 2021 GSS data
# Author: Adam Labas and Krupali Bhavsar
# Data: March 20 2022
# Contact: adam.labas@mail.utoronto.ca and krupali.bhavsar@mail.utoronto.ca
# License: 
# Pre-requisites: 
# - Need to have downloaded the GSS data and saved it to inputs/data


#### Workspace setup ####
# Use R Projects, not setwd().
library(haven)
library(tidyverse)
library(janitor)
library(tidyr)
library(dplyr)
library(knitr)
library(tidymodels)


# Read in the raw data. 
raw_data <- read.csv("inputs/data/raw_data.csv")

# Correct for a bug that changes the first header name.
names(raw_data)[1]<- "PLAYER"

cleaned_raw_data <- raw_data[,c(3, 4, 8, 9, 11, 13, 21, 22,31,32,33)]
final_raw_data = cleaned_raw_data[c(1,4,2,3,5,6,7,8,9,10)]






write.csv(x = final_raw_data,
          file = "inputs/data/final_raw.csv")

# Set the Seed
set.seed(866)


data_split <- initial_split(data = final_raw_data, prop = 0.80)

training_data <- training(data_split)
write.csv(x = training_data,
          file = "inputs/data/train.csv")

test_data <- testing(data_split)
write.csv(x = test_data,
          file = "inputs/data/test.csv")

