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
f = "/home/obonhamcarter/Dropbox/2_teaching/0_fall2024/dataGators/lessons/01/fruits_colours.csv"
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
