rm(list = ls()) # clear out the variables from memory to make a clean execution of the code.

# If you want to remove all previous plots and clear the console, run the following two lines.
graphics.off() # clear out all plots from previous work.

cat("\014") # clear the console

if(!require('tidyverse')) {
  install.packages('tidyverse')
  library('tidyverse')
}

if(!require('ggplot2')) {
  install.packages('ggplot2')
  library('ggplot2')
}

# Set seed for reproducibility
set.seed(42)

# Generate synthetic data
n <- 100  # Number of data points
x <- rnorm(n)  # Random normal variable
y_linear <- 2 * x + rnorm(n, sd = 0.5)  # Linear relationship with some noise
y_monotonic <- abs(x) + rnorm(n, sd = 0.5)  # Monotonic relationship with noise

# Combine into a data frame
data <- data.frame(x, y_linear, y_monotonic)

# Calculate correlations
cor_pearson_linear <- cor(data$x, data$y_linear, method = "pearson")
cor_spearman_linear <- cor(data$x, data$y_linear, method = "spearman")
cor_kendall_linear <- cor(data$x, data$y_linear, method = "kendall")

cor_pearson_monotonic <- cor(data$x, data$y_monotonic, method = "pearson")
cor_spearman_monotonic <- cor(data$x, data$y_monotonic, method = "spearman")
cor_kendall_monotonic <- cor(data$x, data$y_monotonic, method = "kendall")

# Print correlation results
cat("Linear Relationship Correlations:\n")
cat("Pearson:", cor_pearson_linear, "\n")
cat("Spearman:", cor_spearman_linear, "\n")
cat("Kendall:", cor_kendall_linear, "\n\n")

cat("Monotonic Relationship Correlations:\n")
cat("Pearson:", cor_pearson_monotonic, "\n")
cat("Spearman:", cor_spearman_monotonic, "\n")
cat("Kendall:", cor_kendall_monotonic, "\n")

# Plotting
ggplot(data) +
  geom_point(aes(x = x, y = y_linear), color = "blue", alpha = 0.5) +
  geom_point(aes(x = x, y = y_monotonic), color = "red", alpha = 0.5) +
  labs(title = "Scatter Plot of Synthetic Data",
       x = "X Values",
       y = "Y Values") +
  theme_minimal() +
  theme(legend.position = "top") +
  scale_color_manual(name = "Legend", values = c("Linear" = "blue", "Monotonic" = "red")) +
  geom_smooth(aes(x = x, y = y_linear), method = "lm", color = "blue", se = FALSE) +
  geom_smooth(aes(x = x, y = y_monotonic), method = "loess", color = "red", se = FALSE)

