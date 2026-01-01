-- Retail Sales & Profitability Analysis
-- Author: Kalogerakis Emmanouel 
-- Description: SQL-based analysis to evaluate sales,profit,customer segments
-- regions, and discount impact using retail transaction data.


USE retail_analysis;

-- ====================================
-- STEP 1: Overall Business Performance
-- ====================================

SELECT
    COUNT(*) AS total_orders,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM orders;

-- =====================================
-- STEP 2: Profit margin
-- =====================================

SELECT 
	ROUND(SUM(profit) / SUM(sales) * 100, 2) AS profit_margin_percentage
FROM orders;

-- =====================================
-- STEP 3: Category Performance 
-- =====================================

SELECT
	category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM orders
GROUP BY category
ORDER BY total_profit DESC; 

-- ======================================
-- STEP 4: Customer Segment Profitability
-- ======================================

SELECT
	segment,
    COUNT(*) AS total_orders,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM orders
GROUP BY segment
ORDER BY total_profit DESC;

-- =====================================
-- STEP 5: Regional Profitability
-- =====================================

SELECT
    region,
    COUNT(*) AS total_orders,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM orders
GROUP BY region
ORDER BY total_profit ASC;

-- =====================================
-- State-Level Profitability
-- =====================================

SELECT
	state,
    ROUND(SUM(profit), 2) AS total_profit
FROM orders
GROUP BY state
ORDER BY total_profit ASC
LIMIT 10;

-- =====================================
-- Impact of Discounts on Profitability
-- =====================================

SELECT
	discount,
    COUNT(*) AS total_orders,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM orders
GROUP BY discount
ORDER BY discount;

-- ====================================
-- Profit Margin by Category
-- ====================================

SELECT
    category,
    ROUND(SUM(profit) / SUM(sales) * 100, 2) AS profit_margin_percentage
FROM orders
GROUP BY category
ORDER BY profit_margin_percentage DESC;



