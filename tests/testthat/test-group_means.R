test_that("group_means works correctly with penguins dataset", {
  suppressPackageStartupMessages(library(palmerpenguins))
  suppressPackageStartupMessages(library(dplyr))
  # Test case: Input without NAs
  penguins_no_na <- na.omit(penguins)  # Remove rows with NAs for this test
  result1 <- group_means(penguins_no_na, "species")

  expected1 <- penguins_no_na %>%
    group_by(species) %>%
    summarise(across(where(is.numeric), \(x) mean(x, na.rm = TRUE)), .groups = 'drop')

  expect_equal(result1, expected1)

  # Test case: Input with NAs
  result2 <- group_means(penguins, "species")

  expected2 <- penguins %>%
    group_by(species) %>%
    summarise(across(where(is.numeric), \(x) mean(x, na.rm = TRUE)), .groups = 'drop')

  expect_equal(result2, expected2)

  # Test case: Empty data frame input
  df_empty <- data.frame(
    species = character(0),
    bill_length_mm = numeric(0),
    bill_depth_mm = numeric(0)
  )

  result3 <- group_means(df_empty, "species")
  expected3 <- tibble(species = character(0), bill_length_mm = numeric(0), bill_depth_mm = numeric(0))

  expect_equal(result3, expected3)

  # Test case: Invalid column names
  expect_error(group_means(penguins, c("nonexistent_col")),
               "The following columns are not found in the dataset: nonexistent_col")

  # Test case: Non-character elements in group_cols
  expect_error(group_means(penguins, c(1, 2, 3)),
               "group_cols must be a non-empty character vector.")
})
