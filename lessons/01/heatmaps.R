m(list = ls()) # clear out the variables from memory to make a clean execution of the code.

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

# Importing the CSV file
#fruits_data <- read.csv("path/to/your/fruits.csv")  # Update the path
#head(fruits_data)  # View the first few rows
#summary(fruits_data)  # Summary of the dataset




# Install packages if you haven't already
#install.packages("ggplot2")
#install.packages("reshape2")

# Load the libraries
library(ggplot2)
library(reshape2)


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




