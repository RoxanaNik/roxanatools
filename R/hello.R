#' Just Another Spark-line plot function
#'
#' @param dat A dataframe containing the data to be plotted.
#' @param trans The opacity level for the transparent lines.
#' @param col The color for the main (non-transparent) line.
#' @param label_x The label for the x-axis.
#' @param label_y The label for the y-axis.
#' @param the_title The title of the plot.
#'
#' @return None
#' @export
#' Details: Takes a dataframe and turns it into a sparkline plot where only the first line is not transparent to a specified opacity level.

# Create a sample dataframe 'dat'
dat <- data.frame(x = 1:100,
                  y= rnorm(100),
                  y2 = rnorm(100) + 2,
                  y3 = rnorm(100) - 2)


# Define the 'the_spark_plot' function
the_spark_plot <- function(dat, trans, col, label_x, label_y, the_title) {
  # Check if 'dat' is a dataframe
  if (!is.data.frame(dat)) {
    stop("Input 'dat' must be a dataframe.")
  }

  # Create an empty plot with appropriate labels and axis settings
  plot(1, type = "n", xlim = c(1, nrow(dat)), ylim = c(0, max(dat)),
       xlab = label_x, ylab = label_y, xaxt = "n")

  # Plot the first column (X1) as a normal line with the specified color
  lines(1:nrow(dat), dat[, 1], col = col)

  # Plot the remaining columns as transparent lines with the specified opacity
  for (i in 2:ncol(dat)) {
    lines(1:nrow(dat), dat[, i], col = rgb(1, 0, 0, alpha = trans))
  }

  # Add a title to the plot
  title(the_title)

  # Add axis labels and ticks
  axis(1, at = 1:nrow(dat), labels = 1:nrow(dat))
  axis(2, at = seq(0, 1, by = 0.5))

  # Add a legend to distinguish columns
  legend("topright", legend = colnames(dat),
         col = c(col, rep(rgb(1, 0, 0, alpha = 0.5), ncol(dat) - 1)), lty = 1)
}

# Call the 'the_spark_plot' function to create a sparkline plot
the_spark_plot(dat=dat, trans = 0.3, col = "pink", label_x = "Data point",
               label_y = "Value", the_title = "Spark Plot")
