#' Calculate Group Means
#'
#' This function calculates the mean of all numeric columns in a given dataset,
#' grouped by specified categorical columns.
#'
#' @param dataset A data frame containing the data to be analyzed. The choice of
#'                `dataset` as a parameter name reflects its role as the primary
#'                input for the function, representing the data source.
#' @param group_cols A character vector of column names by which to group the data.
#'                   This name was chosen to clearly indicate that it represents
#'                   the columns that define the groups for the mean calculation.
#'
#' @return A data frame containing the grouped means of all numeric columns, with
#'         one row per unique combination of the specified grouping columns.
#'
#' @examples
#' df <- data.frame(
#'   group1 = c("A", "A", "B", "B", "A", "B"),
#'   group2 = c("X", "Y", "X", "Y", "X", "Y"),
#'   value1 = c(10, 20, 30, 40, 20 ,30),
#'   value2 = c(5, 15, 25, 35, 5, 15)
#' )
#' group_means(df, c("group1", "group2"))
#'
#' @export
group_means <- function(dataset, group_cols) {
  if (!is.data.frame(dataset)) {
    stop("The dataset must be a data frame.")
  }

  if (!is.character(group_cols) || length(group_cols) == 0) {
    stop("group_cols must be a non-empty character vector.")
  }

  missing_cols <- setdiff(group_cols, names(dataset))
  if (length(missing_cols) > 0) {
    stop(paste("The following columns are not found in the dataset:",
               paste(missing_cols, collapse = ", ")))
  }

  dataset %>%
    dplyr::group_by(dplyr::across(dplyr::all_of(group_cols))) %>%
    dplyr::summarise(dplyr::across(dplyr::where(is.numeric), \(x) mean(x, na.rm = TRUE)), .groups = 'drop')
}
