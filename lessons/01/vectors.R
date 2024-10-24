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

