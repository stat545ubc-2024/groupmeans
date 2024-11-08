
<!-- README.md is generated from README.Rmd. Please edit that file -->

# groupmeans

<!-- badges: start -->
<!-- badges: end -->

Provides a function to calculate the mean of all numeric columns in a
dataset, grouped by specified categorical columns.

## Installation

You can install the development version of groupmeans from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("stat545ubc-2024/groupmeans")
```

## Example

This is a basic example which shows you how to use the main package
function group_means():

``` r
library(groupmeans)

df <- data.frame(
  group1 = c("A", "A", "B", "B", "A", "B"),
  group2 = c("X", "Y", "X", "Y", "X", "Y"),
  value1 = c(10, 20, 30, 40, 20 ,30),
  value2 = c(5, 15, 25, 35, 5, 15)
)

group_means(df, c("group1", "group2"))
#> # A tibble: 4 × 4
#>   group1 group2 value1 value2
#>   <chr>  <chr>   <dbl>  <dbl>
#> 1 A      X          15      5
#> 2 A      Y          20     15
#> 3 B      X          30     25
#> 4 B      Y          35     25
```
