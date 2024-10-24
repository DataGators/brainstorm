Here’s the provided R code converted into a Markdown format, complete with explanations for each section and the code placed in fenced code blocks.

```markdown
# R Code for Fruit Analysis and Visualization

This document outlines the R code used to analyze fruit data, including creating a vector of fruits, importing a CSV file, adding new columns, and visualizing the data with bar plots and heatmaps. Each section of the code is explained in detail.

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

## 2. Install and Load the Tidyverse Library

We check if the `tidyverse` library is installed. If it isn't, we install it and then load it.

```r
if(!require('tidyverse')) {
  install.packages('tidyverse')  # Install tidyverse if not already installed.
  library('tidyverse')  # Load the tidyverse library.
}
```

## 3. Create and Summarize a Vector of Fruits

Next, we create a vector of fruit names and print it. We also summarize the vector.

```r
# Creating a vector of fruits
fruits <- c("apple", "banana", "cherry", "date", "elderberry", "mango", "strawberry")
print(fruits)  # Print the vector of fruits.

# Summarizing the vector
summary(fruits)  # Display a summary of the fruits vector.
```

## 4. Import the CSV File

Now, we import a CSV file containing fruit data. Update the file path as necessary. Uncomment the `file.choose()` line to select the file interactively.

```r
# f = file.choose()  # Uncomment this to choose the file interactively.
f = "/home/obonhamcarter/Dropbox/2_teaching/0_fall2024/dataGators/lessons/01/fruits_colours.csv"  # Update the path.
fruits_data <- read.csv(f)  # Import the CSV file.
head(fruits_data)  # View the first few rows of the dataset.
summary(fruits_data)  # Display a summary of the dataset.
```

## 5. Add New Columns for Sweetness Level and Price

We will now add new columns for sweetness level and price to the dataset, using random values.

```r
# Set seed for reproducibility
set.seed(42)  # Set seed for random number generation.

# Add a new column "Sweetness_Level" to the dataset
fruits_data$Sweetness_Level <- sample(1:10, nrow(fruits_data), replace = TRUE)  # Random sweetness levels.

# Add another new column "price" to the dataset
fruits_data$price <- sample(1:15, nrow(fruits_data), replace = TRUE)  # Random prices.

# View the updated dataset
head(fruits_data)  # Display the first few rows of the updated dataset.
```

## 6. Load ggplot2 and Create a Bar Plot

Next, we load the `ggplot2` package and create a bar plot to visualize the sweetness levels of the fruits.

```r
# Load the ggplot2 package
library(ggplot2)

# Creating a bar plot of Fruit Sweetness Levels
ggplot(fruits_data, aes(x = Name, y = Sweetness_Level)) +
  geom_bar(stat = "identity", fill = "skyblue") +  # Create a bar plot.
  labs(title = "Fruit Sweetness", x = "Fruit", y = "Sweetness Level") +  # Add labels.
  theme_minimal()  # Use a minimal theme.
```

## 7. Create a Heatmap

Finally, we reshape the data for the heatmap and create the heatmap visualization.

```r
# Load the reshape2 package for reshaping data
library(reshape2)

# Reshape the data for heatmap
heatmap_data <- dcast(fruits_data, price ~ Sweetness_Level, value.var = "Sweetness_Level")  # Reshape data for heatmap.

# Remove row names for better heatmap aesthetics
rownames(heatmap_data) <- heatmap_data$Name  # Set row names to fruit names.
heatmap_data$Name <- NULL  # Remove the Name column.

# Create a heatmap
heatmap_melted <- melt(heatmap_data)  # Melt the data for visualization.

# Create the heatmap visualization
ggplot(heatmap_melted, aes(variable, value, fill = value)) +
  geom_tile(color = "white") +  # Create tiles for the heatmap.
  scale_fill_gradient(low = "blue", high = "red") +  # Set color gradient.
  labs(title = "Sweetness Level Heatmap", x = "Fruit", y = "Color") +  # Add labels.
  theme_minimal() +  # Use a minimal theme.
  theme(axis.text.x = element_text(angle = 45, hjust = 1))  # Adjust x-axis text.
```

Hmmm. This heatmap looks a little empty. What is going on to prevent the colour blocks from filling the heatmap cells??


This document provides a complete overview of the R code used for fruit data analysis and visualization. Each section has been explained for clarity and understanding.
``` 


## 8. All Code Combined

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

# Creating a vector of fruits
fruits <- c("apple","banana","cherry","date","elderberry","mango","strawberry")
print(fruits)

# Summarizing the vector
summary(fruits)

#############

# Importing the CSV file
# f = file.choose()
f = "/home/obonhamcarter/Dropbox/2_teaching/0_fall2024/dataGators/lessons/01/fruits_colours.csv"
fruits_data <- read.csv(f)  # Update the path
head(fruits_data)  # View the first few rows
summary(fruits_data)  # Summary of the dataset

############

# Adding a new column for Sweetness Level

# Randomly selected according seed but also reproducible
set.seed(42)

# Add a new col, "Sweetness_Level" to the dataset
fruits_data$Sweetness_Level <- sample(1:10, nrow(fruits_data), replace = TRUE)

# Add another new col, "price" to the dataset
fruits_data$price <- sample(1:15, nrow(fruits_data), replace = TRUE)

# View the updated dataset
#?head # get some online help
head(fruits_data)


##############

# Load the ggplot2 package
library(ggplot2)

# Creating a bar plot of Fruit Prices
ggplot(fruits_data, aes(x = Name, y = Sweetness_Level)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  labs(title = "Fruit Sweetness", x = "Fruit", y = "Sweetness_Level") +
  theme_minimal()

##############
# HEATMAP
# Reshape the data for heatmap
library(reshape2)

# Importing the CSV file
# f = file.choose()
#f = "/home/obonhamcarter/Dropbox/2_teaching/0_fall2024/dataGators/lessons/01/fruits_colours.csv"
#fruits_data <- read.csv(f)  # Update the path
#head(fruits_data)  # View the first few rows
#summary(fruits_data)  # Summary of the dataset



# Assuming fruits_data has columns: Name, Color, Sweetness_Level
#heatmap_data <- dcast(fruits_data, Name ~ Colour, value.var = "Sweetness_Level")

heatmap_data <- dcast(fruits_data, price ~ Sweetness_Level, value.var = "Sweetness_Level")

# Remove row names for better heatmap aesthetics
rownames(heatmap_data) <- heatmap_data$Name
heatmap_data$Name <- NULL

# Create a heatmap
library(ggplot2)
library(reshape2)

heatmap_melted <- melt(heatmap_data)
head(heatmap_melted)

ggplot(heatmap_melted, aes(variable, value, fill = value)) +
  geom_tile(color = "white") +
  scale_fill_gradient(low = "blue", high = "red") +
  labs(title = "Sweetness Level Heatmap", x = "Fruit", y = "Color") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

```