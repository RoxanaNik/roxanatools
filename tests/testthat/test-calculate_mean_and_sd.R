# Load the necessary library for testthat
library(testthat)

# Load the script that contains the function you want to test
calculate_mean_and_sd <- function(data) {
  mean_value <- mean(data)
  sd_value <- sd(data)

  result <- list(mean = mean_value, sd = sd_value)

  return(result)
}

# Example usage of the function:
# Assuming 'your_data' is your dataset, replace it with your actual dataset.
your_data <- c(12, 15, 18, 22, 27, 30, 36, 41)

results <- calculate_mean_and_sd(your_data)
print(paste("Mean:", results$mean))
print(paste("Standard Deviation:", results$sd))


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

  # Test 4: Test with a dataset containing identical values
  data_identical <- rep(7, 10)
  expect_equal(calculate_mean_and_sd(data_identical)$mean, mean(data_identical))
  expect_equal(calculate_mean_and_sd(data_identical)$sd, sd(data_identical))

  # Test 5: Test with a dataset containing negative numbers
  data_negative <- c(-2, -5, -8, -11, -14)
  expect_equal(calculate_mean_and_sd(data_negative)$mean, mean(data_negative))
  expect_equal(calculate_mean_and_sd(data_negative)$sd, sd(data_negative))

  # Test 6: Test with a dataset containing decimal numbers
  data_decimal <- c(3.5, 1.2, 6.7, 4.8, 2.3)
  expect_equal(calculate_mean_and_sd(data_decimal)$mean, mean(data_decimal))
  expect_equal(calculate_mean_and_sd(data_decimal)$sd, sd(data_decimal))
})
