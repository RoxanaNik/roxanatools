# Load the necessary library for testthat
library(testthat)

# Load the script that contains the function you want to test
sum_numbers <- function(a, b) {
  result <- a + b
  return(result)
}

# Example usage of the function:
num1 <- 5
num2 <- 3
result <- sum_numbers(num1, num2)
print(paste("The sum of", num1, "and", num2, "is:", result))

# Write test cases using testthat functions
test_that("Testing sum_numbers function", {
  # Test 1: Test the sum of positive numbers
  expect_equal(sum_numbers(5, 3), 8)

  # Test 2: Test the sum of negative and positive numbers
  expect_equal(sum_numbers(-10, 7), -3)

  # Test 3: Test the sum of zero and a number
  expect_equal(sum_numbers(0, 15), 15)
})
