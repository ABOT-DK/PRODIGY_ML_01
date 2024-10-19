library('tidyverse')
library('caret')
library('RColorBrewer')
library('corrplot')

# Loading Data
df <- read_csv('house_prices_dataset.csv')

#Checking for null values
sum(is.null(df))

#Checking for duplicates
sum(duplicated(df))

#Plot Relation
ggplot(df, aes(x = df$`Square Footage`, y = Price)) +
    geom_point(aes(size = Bathrooms, color = as.factor(Bedrooms)), alpha = 0.7) +  # Bubble size by bathrooms, color by bedrooms
    labs(x = "Square Footage", y = "Price", 
         title = "Bubble Plot of House Price vs. Square Footage",
         color = "Number of Bedrooms",
         size = "Number of Bathrooms") +
    scale_color_brewer(palette = "Set1") +  # Color palette for bedrooms
    scale_size(range = c(3, 10)) +  # Set the size range for bubbles
    theme_minimal() +  # Use a minimal theme
    theme(
        plot.title = element_text(hjust = 0.5, size = 16, face = "bold"),  # Center title and bold
        axis.title = element_text(size = 12),  # Axis title size
        axis.text = element_text(size = 10),  # Axis text size
        legend.position = "right"  # Position the legend on the right
    )

#Correlation Plot
corrplot(cor(df), 
         method = "circle",        # Use circles to represent correlation
         type = "full",            # Show full matrix
         order = "hclust",         # Order by hierarchical clustering
         addrect = 2,              # Add rectangles to highlight clusters
         tl.col = "black",         # Text label color
         tl.srt = 45,              # Rotate text labels
         col = colorRampPalette(brewer.pal(9, "Spectral"))(200),  # More vibrant color palette
         pch.cex = 2,              # Size of the circles
         title = "Correlation Plot of Housing Data",  # Title
         mar = c(0, 0, 1, 0))      # Margin settings

# Splitting Data
set.seed(53)
trainIndex <- createDataPartition(df$Price, p = 0.8, 
                                  list = FALSE, 
                                  times = 1)
dfTrain <- df[trainIndex, ]
dfTest <- df[-trainIndex, ]

# Step 3: Fit a Linear Regression Model on the Training Data
model <- lm(Price ~ `Square Footage` + Bedrooms + Bathrooms, data = dfTrain)

# Summary of the model
summary(model)

# Step 4: Make Predictions on the Test Data
dfTest$PredictedPrice <- predict(model, dfTest)

# Step 5: Evaluate the Model
# Calculate RMSE
rmse <- sqrt(mean((dfTest$Price - dfTest$PredictedPrice)^2))
cat("Root Mean Squared Error (RMSE):", rmse, "\n")

# Plot actual vs predicted prices
ggplot(dfTest, aes(x = Price, y = PredictedPrice)) +
    geom_point(aes(color = Price, size = Price), alpha = 0.6) +  # Color and size by actual price
    geom_abline(slope = 1, intercept = 0, color = "red", linetype = "dashed") +  # Dashed line for y=x
    labs(x = "Actual Price", y = "Predicted Price", title = "Actual vs Predicted Prices") +
    scale_color_gradient(low = "blue", high = "green") +  # Gradient from blue to green
    scale_size(range = c(2, 6)) +  # Size range for points
    theme_minimal() +
    theme(
        plot.title = element_text(hjust = 0.5, size = 16, face = "bold"),  # Center title and bold
        axis.title = element_text(size = 12),  # Axis title size
        axis.text = element_text(size = 10),  # Axis text size
        legend.position = "none"  # Remove legend
    )
