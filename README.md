
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
#> Using GitHub PAT from the git credential store.
#> Downloading GitHub repo stat545ubc-2024/groupmeans@HEAD
#> glue  (1.7.0 -> 1.8.0) [CRAN]
#> withr (3.0.1 -> 3.0.2) [CRAN]
#> Installing 2 packages: glue, withr
#> Installing packages into 'C:/Users/86156/AppData/Local/Temp/Rtmpmqi8uj/temp_libpath70c54791285'
#> (as 'lib' is unspecified)
#> package 'glue' successfully unpacked and MD5 sums checked
#> package 'withr' successfully unpacked and MD5 sums checked
#> 
#> The downloaded binary packages are in
#>  C:\Users\86156\AppData\Local\Temp\RtmpWcIPji\downloaded_packages
#> ── R CMD build ─────────────────────────────────────────────────────────────────
#>          checking for file 'C:\Users\86156\AppData\Local\Temp\RtmpWcIPji\remotes4ebc7a2d866\stat545ubc-2024-groupmeans-915e49d/DESCRIPTION' ...  ✔  checking for file 'C:\Users\86156\AppData\Local\Temp\RtmpWcIPji\remotes4ebc7a2d866\stat545ubc-2024-groupmeans-915e49d/DESCRIPTION'
#>       ─  preparing 'groupmeans':
#>    checking DESCRIPTION meta-information ...     checking DESCRIPTION meta-information ...   ✔  checking DESCRIPTION meta-information
#>       ─  checking for LF line-endings in source and make files and shell scripts
#>       ─  checking for empty or unneeded directories
#>       ─  building 'groupmeans_0.1.0.tar.gz'
#>      
#> 
#> Installing package into 'C:/Users/86156/AppData/Local/Temp/Rtmpmqi8uj/temp_libpath70c54791285'
#> (as 'lib' is unspecified)
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
