# Analyzing Customer Spending Behavior 
## Overview
This project explores customer spending behavior using demographic features such as family size, annual income, work experience, and spending score. By analyzing patterns in average spending scores across different customer groups, the study identifies trends that may reflect financial habits, lifestyle constraints, or evolving spending behavior. The analysis was conducted in R using tidyverse and RSQLite, with results presented through summary statistics and visualizations. Customers with moderate family sizes tend to have the highest spending scores, while those with very small or very large families exhibit more conservative or constrained spending. Similarly, early-career customers show higher spending tendencies, which may suggest less disciplined financial habits.

## Analysis Goals
-	Segment customers by profession, work experience, and age group
-	Understand spending score trends across demographics
-	Identify high-value customer groups

## Key Insights
-	Customers in **entertainment**, the **arts**, and **healthcare (doctors)** show the *highest* spending scores, making them valuable targets for marketing campaigns.
-	While **executives*** earn the *highest average income*, their spending score is only moderate (49.90), indicating that high income doesn’t always translate to high spending behavior.
-	**Younger** customers (under 25) tend to have *higher* spending scores, while older age groups show more conservative spending patterns.

## Data
[Kaggle](https://www.kaggle.com/datasets/datascientistanna/customers-dataset)
- Dataset: Shop Customer Data
- Files: 
  -	Customers.csv

## Required Packages
-	DBI: R database interface
-	RSQLite: SQLite interface for R
-	readr: Read data
-	tidyverse: Data packages
-	ggplot2: Data visualization
-	dplyr: Data manipulation
