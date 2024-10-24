# R Code for Creating a Heatmap of Fruit Sweetness Levels

This document explains the R code used to create a heatmap visualizing the sweetness levels of different fruits by color.

## 1. Clear Existing Variables and Outputs

First, we clear existing variables from memory to ensure a clean execution of the code.

```r
rm(list = ls())  # Clear out the variables from memory.
```

If you want to remove all previous plots and clear the console, run the following two lines:

```r
graphics.off()  # Clear all plots from previous work.
cat("\014")  # Clear the console.
```

## 2. Install and Load Necessary Libraries

We check if the `tidyverse`, `ggplot2`, and `reshape2` libraries are installed. If they aren't, we install them and then load them.

```r
if(!require('tidyverse')) {
  install.packages('tidyverse')  # Install tidyverse if not already installed.
  library('tidyverse')  # Load the tidyverse library.
}

if(!require('ggplot2')) {
  install.packages('ggplot2')  # Install ggplot2 if not already installed.
  library('ggplot2')  # Load the ggplot2 library.
}

if(!require('reshape2')) {
  install.packages('reshape2')  # Install reshape2 if not already installed.
  library('reshape2')  # Load the reshape2 library.
}
```

## 3. Set Seed and Create Synthetic Data

We set a seed for reproducibility and create synthetic data for fruits and their colors.

```r
# Set seed for reproducibility
set.seed(42)  # Set seed for random number generation.

# Create synthetic data
fruits <- c("Apple", "Banana", "Cherry", "Date", "Elderberry")  # Fruit names
colors <- c("Red", "Yellow", "Pink", "Brown", "Purple")  # Fruit colors

# Generate random sweetness levels
sweetness_data <- matrix(sample(1:10, length(fruits) * length(colors), replace = TRUE),
    nrow = length(fruits),
    ncol = length(colors))  # Create a matrix of random sweetness levels
```

## 4. Create a Data Frame

Next, we create a data frame from the synthetic data and label the columns appropriately.

```r
# Create a data frame
heatmap_data <- as.data.frame(sweetness_data)  # Convert matrix to data frame
colnames(heatmap_data) <- colors  # Set column names to colors
heatmap_data$Fruits <- fruits  # Add fruits as a new column
```

## 5. Reshape the Data for the Heatmap

We reshape the data into a long format suitable for creating a heatmap.

```r
# Reshape the data for heatmap
heatmap_melted <- melt(heatmap_data, id.vars = "Fruits")  # Melt the data frame to long format
```

## 6. Create the Heatmap

Finally, we create a heatmap using the reshaped data.

```r
# Create the heatmap
ggplot(heatmap_melted, aes(x = variable, y = Fruits, fill = value)) +
  geom_tile(color = "white") +  # Create tiles for the heatmap
  scale_fill_gradient(low = "blue", high = "red") +  # Color gradient from blue to red
  labs(title = "Sweetness Levels of Fruits by Color",  # Add title and labels
       x = "Color",
       y = "Fruit") +
  theme_minimal() +  # Use a minimal theme for better aesthetics
  theme(axis.text.x = element_text(angle = 45, hjust = 1))  # Rotate x-axis labels for better readability
```
## 7. All Code Combined

``` r
rm(list = ls()) # clear out the variables from memory to make a clean execution of the code.

# If you want to remove all previous plots and clear the console, run the following two lines.
graphics.off() # clear out all plots from previous work.

cat("\014") # clear the console

#library(tidyverse)
# A better way to code...
# Find out if the library is not already installed and\
# if not, install the library and then load it.

if(!require('tidyverse')) {
  install.packages('tidyverse')
  library('tidyverse')
}
if(!require('ggplot2')) {
  install.packages('ggplot2')
  library('ggplot2')
}
if(!require('reshape2')) {
  install.packages('reshape2')
  library('reshape2')
}

# Set seed for reproducibility
set.seed(42)

# Create synthetic data
fruits <- c("Apple", "Banana", "Cherry", "Date", "Elderberry")
colors <- c("Red", "Yellow", "Pink", "Brown", "Purple")

# Generate random sweetness levels
sweetness_data <- matrix(sample(1:10, length(fruits) * length(colors), replace = TRUE),
                         nrow = length(fruits),
                         ncol = length(colors))

# Create a data frame
heatmap_data <- as.data.frame(sweetness_data)
colnames(heatmap_data) <- colors
heatmap_data$Fruits <- fruits

# Reshape the data for heatmap
heatmap_melted <- melt(heatmap_data, id.vars = "Fruits")




# Create the heatmap
ggplot(heatmap_melted, aes(x = variable, y = Fruits, fill = value)) +
  geom_tile(color = "white") +
  scale_fill_gradient(low = "blue", high = "red") +
  labs(title = "Sweetness Levels of Fruits by Color",
       x = "Color",
       y = "Fruit") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
  ```
  