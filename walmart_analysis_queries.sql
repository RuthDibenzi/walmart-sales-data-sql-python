USE Walmart;

DROP TABLE Walmart;
SELECT * FROM Walmart;

SELECT COUNT(*) FROM Walmart;

SELECT DISTINCT payment_method FROM Walmart;


SELECT COUNT(DISTINCT Branch) 
FROM Walmart;

SELECT MAX(quantity) FROM Walmart; 
SELECT MIN(quantity) FROM Walmart; 


-- Business Question: Which product categories generate the most sales revenue?
-- Why: Helps identify best-selling product categories and guides inventory/marketing focus.
SELECT 
    category, 
    SUM(total) AS total_revenue
FROM Walmart
GROUP BY category
ORDER BY total_revenue DESC
LIMIT 5;

-- Business Question: What is the average number of items customers buy per transaction at each branch?
-- Why: Reveals customer purchasing behavior, helps evaluate upselling effectiveness.
SELECT 
    branch,
    ROUND(AVG(quantity), 2) AS avg_quantity
FROM Walmart
GROUP BY branch;

-- Business Question: How much revenue does each payment method contribute?
-- Why: Useful for financial strategy and negotiating partnerships with payment providers.
SELECT 
    payment_method,
    ROUND(SUM(total), 2) AS total_revenue,
    ROUND(SUM(total) * 100.0 / (SELECT SUM(total) FROM Walmart), 2) AS percent_share
FROM Walmart
GROUP BY payment_method
ORDER BY total_revenue DESC;

-- Business Question: Which invoice represents the highest customer spend?
-- Why: Identifies large-value customers and opportunities for premium loyalty programs.
SELECT 
    invoice_id,
    SUM(total) AS invoice_total
FROM Walmart
GROUP BY invoice_id
ORDER BY invoice_total DESC
LIMIT 1;

-- Business Question: Which branch generates the highest profit overall?
-- Why: Helps assess branch performance and identify where to expand resources.
SELECT 
    branch,
    ROUND(SUM(unit_price * quantity * profit_margin), 2) AS total_profit
FROM Walmart
GROUP BY branch
ORDER BY total_profit DESC;

-- Business Question: Which categories perform best in each city?
-- Why: Provides location-based insights for targeted promotions and stocking decisions.
SELECT 
    city,
    category,
    ROUND(SUM(total), 2) AS category_revenue
FROM Walmart
GROUP BY city, category
ORDER BY city, category_revenue DESC;


-- Business Question: What is the average value of a transaction at each branch?
-- Why: Helps compare customer spend behavior across branches.
SELECT 
    branch,
    ROUND(AVG(total), 2) AS avg_transaction_value
FROM Walmart
GROUP BY branch
ORDER BY avg_transaction_value DESC;

-- Business Question: Which specific days had the highest sales revenue?
-- Why: Identifies peak shopping days for better staffing, inventory, and promotions.
SELECT 
    date,
    DAYNAME(STR_TO_DATE(date, '%d/%m/%y')) AS day_name,
    SUM(total) AS daily_revenue
FROM Walmart
GROUP BY date, day_name
ORDER BY daily_revenue DESC
LIMIT 3;

-- Business Question: How do customers rate products in different categories?
-- Why: Useful for quality control and improving customer satisfaction.
SELECT 
    category,
    ROUND(AVG(rating), 2) AS avg_rating,
    MIN(rating) AS min_rating,
    MAX(rating) AS max_rating
FROM Walmart
GROUP BY category
ORDER BY avg_rating DESC;

-- Business Question: Which categories perform best in each city?
-- Why: Provides location-based insights for targeted promotions and stocking decisions.
SELECT 
    city,
    category,
    ROUND(SUM(total), 2) AS category_revenue
FROM Walmart
GROUP BY city, category
ORDER BY city, category_revenue DESC;
