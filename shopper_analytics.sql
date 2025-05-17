-- !preview conn=DBI::dbConnect(RSQLite::SQLite(), "shopper_data.sqlite")

/* 
Overview: 
Analyze shopper behavior with SQL queries on customer data. 
This analysis includes demographic trends, income and spending patterns across
different variables. 

This dataset comes from a CSV file on Kaggle and is loaded to a local SQLite 
database with R.
*/

-- 1. Average income and spending score by profession
SELECT profession,
       ROUND(AVG(`Annual Income ($)`), 2) AS avg_income,
       ROUND(AVG(`Spending Score (1-100)`), 2) AS avg_score
FROM customers
GROUP BY profession
ORDER BY avg_score DESC;

/*
Those in Entertainment, Artistry and are Doctors have higher spending scores.
Executives have the highest average income with an average spending
score of 49.90.
*/

-- 2. Gender-based average income and score
SELECT gender,
       ROUND(AVG(`Annual Income ($)`), 2) AS avg_income,
       ROUND(AVG(`Spending Score (1-100)`), 2) AS avg_score
FROM customers
GROUP BY gender;

/*
Males have a higher average income than females but a lower average
spending score.
*/

-- 3. Average spending score by age groups
SELECT 
  CASE
    WHEN age < 20 THEN 'Teen'
    WHEN age BETWEEN 20 AND 35 THEN 'Young Adult'
    WHEN age BETWEEN 36 AND 55 THEN 'Adult'
    ELSE 'Senior'
  END AS age_group,
  COUNT(*) AS count,
  ROUND(AVG(`Spending Score (1-100)`), 2) AS avg_score
FROM customers
GROUP BY age_group
ORDER BY avg_score DESC;

/*
Teens report having the highest average spending score amongst all age groups. This
reflects the lack of financial experience and management they have at this age. 
Seniors have the lowest average spending score, given they have had more experience
with money management. 
*/

-- 4. Work experience vs. average spending score
SELECT `Work Experience`,
       COUNT(*) AS num_customers,
       ROUND(AVG(`Spending Score (1-100)`), 2) AS avg_score
FROM customers
GROUP BY `Work Experience`
ORDER BY avg_score DESC;


/*
Shoppers with 2 to 6 years of work experience tend to have the highest average spending scores, 
suggesting greater willingness or ability to spend. Meanwhile, those with very little (0–1 years) or
longer experience (10+ years) show more moderate to lower spending behavior. This may reflect life 
stage financial priorities or lifestyle shifts.
*/

-- 5. Family size effect on spending
SELECT `Family Size`,
       COUNT(*) AS num_customers,
       ROUND(AVG(`Spending Score (1-100)`), 2) AS avg_score
FROM customers
GROUP BY `Family Size`
ORDER BY avg_score DESC;

/*
Larger families may have more financial constraints, leading to 
lower spending scores. Spending scores peak at medium family sizes (3–5), possibly because 
these households balance financial responsibilities with discretionary spending power.
*/