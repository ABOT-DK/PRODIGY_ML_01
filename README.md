# House Price Prediction using Linear Regression

## Project Overview

This project implements a linear regression model to predict house prices based on key features such as square footage, the number of bedrooms, and bathrooms. Using a dataset of house characteristics and their corresponding prices, the model aims to provide accurate price predictions. The goal of this project is to explore the relationship between these features and house prices while developing an understanding of regression analysis.

## Dataset

The dataset used for this project includes the following features:
- **Square Footage**: The total square footage of the house.
- **Bedrooms**: The number of bedrooms in the house.
- **Bathrooms**: The number of bathrooms in the house.
- **Price**: The actual price of the house.

Example data:

| Square Footage | Bedrooms | Bathrooms | Price       |
|----------------|----------|-----------|-------------|
| 1360           | 5        | 2         | 129494.19   |
| 4272           | 5        | 2         | 270716.08   |
| 3592           | 2        | 2         | 208400.59   |
| 966            | 4        | 1         | 100704.07   |
| 4926           | 1        | 2         | 266639.01   |


## Requirements

Ensure the following packages are installed in your R environment:
- **ggplot2**
- **corrplot**
- **RColorBrewer**
- **caTools**

## Methodology

1. **Data Preprocessing**:
    - Load and clean the dataset.
    - Check for missing or duplicate entries.
    - Split the dataset into training and test sets (70/30 split).

2. **Exploratory Data Analysis (EDA)**:
    - Visualize the distribution of house prices, square footage, bedrooms, and bathrooms.
    - Create correlation plots to understand relationships between variables.

3. **Model Implementation**:
    - Implement a linear regression model to predict house prices.
    - The independent variables (`Square Footage`, `Bedrooms`, and `Bathrooms`) are used to predict the dependent variable (`Price`).

4. **Model Evaluation**:
    - Use the test dataset to evaluate the performance of the model.
    - Compare the predicted prices against actual prices.

5. **Visualization**:
    - Scatter plots of actual vs. predicted prices.
    - Bubble plots showing the impact of multiple variables.
    - Colorful correlation matrix plots.

## Results

The linear regression model shows the following performance on the test dataset:
- **R-squared value**: The proportion of variance in the dependent variable (`Price`) that is predictable from the independent variables.
- **Mean Absolute Error (MAE)**: The average difference between the actual and predicted house prices.

Key insights from the model:
- Square footage plays a significant role in predicting house prices.
- The number of bedrooms and bathrooms also contributes to the price but with a relatively smaller impact.

## Future Work

- **Feature Engineering**: Incorporate more features (e.g., location, house age, etc.) to improve model performance.
- **Model Improvement**: Experiment with different algorithms such as Lasso Regression, Ridge Regression, or more complex models like Decision Trees and Random Forests.

## Conclusion

This project demonstrates the implementation of a multiple linear regression model to predict house prices based on square footage, bedrooms, and bathrooms. The results provide insights into the relationship between these features and house prices, highlighting areas for future improvement and exploration.



