# R Code for Correlation Analysis with Synthetic Data

This document explains the R code used to generate synthetic data, calculate various types of correlations, and visualize the results with a scatter plot.

## 1. Clear Existing Variables and Outputs

First, we clear out existing variables from memory to ensure a clean execution of the code.

```r
rm(list = ls())  # Clear out the variables from memory.
```

If you want to remove all previous plots and clear the console, run the following two lines:

```r
graphics.off()  # Clear all plots from previous work.
cat("\014")  # Clear the console.
```

## 2. Install and Load Necessary Libraries

We check if the `tidyverse` and `ggplot2` libraries are installed. If they are not, then we install them and then load them.

```r
if(!require('tidyverse')) {
  install.packages('tidyverse')  # Install tidyverse if not already installed.
  library('tidyverse')  # Load the tidyverse library.
}

if(!require('ggplot2')) {
  install.packages('ggplot2')  # Install ggplot2 if not already installed.
  library('ggplot2')  # Load the ggplot2 library.
}
```

## 3. Set Seed and Generate Synthetic Data

We set a seed for reproducibility and generate synthetic data consisting of a linear relationship and a monotonic relationship.

```r
# Set seed for reproducibility
set.seed(42)  # Set seed for random number generation.

# Generate synthetic data
n <- 100  # Number of data points
x <- rnorm(n)  # Random normal variable
y_linear <- 2 * x + rnorm(n, sd = 0.5)  # Linear relationship with some noise
y_monotonic <- abs(x) + rnorm(n, sd = 0.5)  # Monotonic relationship with noise

# Combine into a data frame
data <- data.frame(x, y_linear, y_monotonic)  # Create a data frame from the generated data.
```

## 4. Calculate Correlations

Next, we compute the Pearson, Spearman, and Kendall correlations for both `y_linear` and `y_monotonic`.

```r
# Calculate correlations
cor_pearson_linear <- cor(data$x, data$y_linear, method = "pearson")  # Pearson correlation for linear data
cor_spearman_linear <- cor(data$x, data$y_linear, method = "spearman")  # Spearman correlation for linear data
cor_kendall_linear <- cor(data$x, data$y_linear, method = "kendall")  # Kendall correlation for linear data

cor_pearson_monotonic <- cor(data$x, data$y_monotonic, method = "pearson")  # Pearson correlation for monotonic data
cor_spearman_monotonic <- cor(data$x, data$y_monotonic, method = "spearman")  # Spearman correlation for monotonic data
cor_kendall_monotonic <- cor(data$x, data$y_monotonic, method = "kendall")  # Kendall correlation for monotonic data
```

## 5. Print Correlation Results

We print the correlation results for both relationships.

```r
# Print correlation results
cat("Linear Relationship Correlations:\n")
cat("Pearson:", cor_pearson_linear, "\n")
cat("Spearman:", cor_spearman_linear, "\n")
cat("Kendall:", cor_kendall_linear, "\n\n")

cat("Monotonic Relationship Correlations:\n")
cat("Pearson:", cor_pearson_monotonic, "\n")
cat("Spearman:", cor_spearman_monotonic, "\n")
cat("Kendall:", cor_kendall_monotonic, "\n")
```

## 6. Visualize the Data

Finally, we create a scatter plot to visualize the linear and monotonic relationships.

```r
# Plotting
ggplot(data) +
  geom_point(aes(x = x, y = y_linear), color = "blue", alpha = 0.5) +  # Points for linear relationship
  geom_point(aes(x = x, y = y_monotonic), color = "red", alpha = 0.5) +  # Points for monotonic relationship
  labs(title = "Scatter Plot of Synthetic Data",
       x = "X Values",
       y = "Y Values") +  # Add labels
  theme_minimal() +  # Use a minimal theme
  theme(legend.position = "top") +  # Position the legend at the top
  scale_color_manual(name = "Legend", values = c("Linear" = "blue", "Monotonic" = "red")) +  # Manual color scale
  geom_smooth(aes(x = x, y = y_linear), method = "lm", color = "blue", se = FALSE) +  # Linear regression line
  geom_smooth(aes(x = x, y = y_monotonic), method = "loess", color = "red", se = FALSE)  # LOESS curve
```

