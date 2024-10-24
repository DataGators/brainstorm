# R Code for Heatmap Visualization

This document outlines the R code used to create a heatmap of sweetness levels for different fruits across various colors. Each section of code is explained in detail.

## 1. Clear Existing Variables and Outputs

First, we clear out the existing variables from memory to ensure a clean execution of the code.

```r
rm(list = ls())  # Clear out the variables from memory.
```

To also remove all previous plots and clear the console, you can run the following two lines:

```r
graphics.off()  # Clear all plots from previous work.
cat("\014")  # Clear the console.
```

## 2. Install and Load the Tidyverse Library

Next, we check if the `tidyverse` library is installed. If it isn't, we install it and then load it.

```r
if(!require('tidyverse')) {
  install.packages('tidyverse')  # Install tidyverse if not already installed.
  library('tidyverse')  # Load the tidyverse library.
}
```

## 3. Install and Load Additional Libraries

For this analysis, we will also need the `ggplot2` and `reshape2` libraries. The following code will install them if they are not already installed and then load them. Note that `ggplot2` is included in the `tidyverse`, but we install it here just in case.

```r
if(!require('ggplot2')) {
  install.packages('ggplot2')  # Install ggplot2 if not already installed.
  library('ggplot2')  # Load the ggplot2 library.
}
if(!require('reshape2')) {
  install.packages('reshape2')  # Install reshape2 if not already installed.
  library('reshape2')  # Load the reshape2 library.
}
```

## 4. Import the CSV File

Next, we import the CSV file containing the fruit data. Update the path as necessary. Uncomment the `file.choose()` line if you prefer to select the file interactively.

```r
# Importing the CSV file
# f = file.choose() # Uncomment this to choose the file interactively.
f = "/home/obonhamcarter/Dropbox/2_teaching/0_fall2024/dataGators/dataGators_org/brainstorm/lessons/data/fruits_colours.csv"
fruits_data <- read.csv(f)  # Update the path
head(fruits_data)  # View the first few rows
summary(fruits_data)  # Summary of the dataset
```

## 5. Set Seed for Reproducibility

We set a seed for random number generation to ensure reproducibility of the results.

```r
set.seed(42)  # Set seed for reproducibility.
```

## 6. Create Synthetic Data

For demonstration purposes, we create a synthetic dataset representing different fruits and their associated colors.

```r
# Create synthetic data
fruits <- c("Apple", "Banana", "Cherry", "Date", "Elderberry", "Mango", "Strawberry")  # List of fruits
colours <- c("Green", "Yellow", "Pink", "Brown", "Purple", "Orange", "Red")  # List of colors

# Generate random sweetness levels
sweetness_data <- matrix(sample(1:10, length(fruits) * length(colours), replace = TRUE),
    nrow = length(fruits),
    ncol = length(colours))  # Generate random sweetness levels.
```

## 7. Create a Data Frame

We convert the sweetness data into a data frame and label the columns accordingly.

```r
# Create a data frame
heatmap_data <- as.data.frame(sweetness_data)  # Convert matrix to data frame.
colnames(heatmap_data) <- colours  # Assign column names for colors.
heatmap_data$Fruits <- fruits  # Add the fruits column.
```

## 8. Reshape Data for Heatmap

We reshape the data so that it can be easily visualized in a heatmap format.

```r
# Reshape the data for heatmap
heatmap_melted <- melt(heatmap_data, id.vars = "Fruits")  # Melt the data for heatmap visualization.
```

## 9. Create the Heatmap

Finally, we use `ggplot2` to create the heatmap, visualizing the sweetness levels of fruits by color.

```r
# Create the heatmap
ggplot(heatmap_melted, aes(x = variable, y = Fruits, fill = value)) +
  geom_tile(color = "white") +  # Create tiles for the heatmap.
  scale_fill_gradient(low = "blue", high = "red") +  # Set color gradient.
  labs(title = "Sweetness Levels of Fruits by Color",
       x = "Color",
       y = "Fruit") +  # Add labels.
  theme_minimal() +  # Use a minimal theme.
  theme(axis.text.x = element_text(angle = 45, hjust = 1))  # Adjust x-axis text.
```
## 10 All Code Combined

``` r
rm(list = ls()) # clear out the variables from memory to make a clean execution of the code.

# If you want to remove all previous plots and clear the console, run the following two lines.
graphics.off() # clear out all plots from previous work.

cat("\014") # clear the console

if(!require('tidyverse')) {
  install.packages('tidyverse')
  library('tidyverse')
}

# For this analysis, we will also need the `ggplot2` and `reshape2` libraries. The below code will install them is they are not yet installed and will then load them. Note: `ggplot2` may already be installed in the `tidyverse` library. We install it here just in case.

if(!require('ggplot2')) {
  install.packages('ggplot2')
  library('ggplot2')
}
if(!require('reshape2')) {
  install.packages('reshape2')
  library('reshape2')
}

# Importing the CSV file
# f = file.choose() # Uncomment this to choose the file interactively.
f = "/home/obonhamcarter/Dropbox/2_teaching/0_fall2024/dataGators/dataGators_org/brainstorm/lessons/data/fruits_colours.csv"
fruits_data <- read.csv(f)  # Update the path
head(fruits_data)  # View the first few rows
summary(fruits_data)  # Summary of the dataset

# Set seed for reproducibility
set.seed(42)

# Create synthetic data
fruits <- c("Apple", "Banana", "Cherry", "Date", "Elderberry","Mango", "Strawberry")
colours <- c("Green", "Yellow", "Pink", "Brown", "Purple", "Orange","Red")

# Generate random sweetness levels
sweetness_data <- matrix(sample(1:10, length(fruits) * length(colours), replace = TRUE),
  nrow = length(fruits),
  ncol = length(colours))

# Create a data frame
heatmap_data <- as.data.frame(sweetness_data)
colnames(heatmap_data) <- colours
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