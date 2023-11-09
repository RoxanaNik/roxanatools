# Load the necessary library for testthat
library(testthat)

# Load the script that contains the function you want to test
source("path_to_your_script_containing_function.R")

# Write test cases using testthat functions
test_that("Testing calculate_mean_and_sd function", {
  # Test 1: Using randomly generated data
  set.seed(123)
  random_data <- rnorm(20)
  expect_equal(calculate_mean_and_sd(random_data)$mean, mean(random_data))
  expect_equal(calculate_mean_and_sd(random_data)$sd, sd(random_data))

  # Test 2: Using a known dataset
  data_known <- c(10, 15, 20, 25, 30)
  expect_equal(calculate_mean_and_sd(data_known)$mean, mean(data_known))
  expect_equal(calculate_mean_and_sd(data_known)$sd, sd(data_known))

  # Test 3: Using an empty dataset
  data_empty <- numeric(0)
  expect_equal(calculate_mean_and_sd(data_empty)$mean, mean(data_empty))
  expect_equal(calculate_mean_and_sd(data_empty)$sd, sd(data_empty))
})
