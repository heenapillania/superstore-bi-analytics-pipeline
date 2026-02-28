-- Overall business performance metrics
SELECT 
SUM(Sales) AS Total_Sales,
SUM(Profit) AS Total_Profit,
SUM(Quantity) AS Total_Quantity
FROM orders;


-- Analyze sales and profit by category
SELECT
Category,
SUM(Sales) AS Sales, 
SUM(Profit) AS Profit
FROM orders
GROUP BY Category
ORDER BY Profit DESC; 


-- Analyze sales and profit by region
SELECT
Region,
SUM(Sales) AS Sales,
SUM(Profit) AS Profit
FROM orders
GROUP BY Region
ORDER BY Profit DESC;


-- Analyze sales and profit by Sub-Category
SELECT
Sub_Category,
SUM(Sales) AS Sales,
SUM(Profit) AS Profit
FROM orders
GROUP BY Sub_Category
ORDER BY Profit ASC;


-- ==============================
-- Analyze monthly sales trend
-- ==============================
SELECT
YEAR(Order_Date) AS Year,
MONTH(Order_Date) AS Month,
SUM(Sales) AS Sales
FROM orders
GROUP BY YEAR(Order_Date), MONTH(Order_Date)
ORDER BY YEAR, Month;


-- =========================================
-- Calculate month-over-month sales growth
-- =========================================
SELECT
	Year,
    Month,
    Sales,
    Sales - Prev_Sales AS Monthly_Growth
FROM(
	SELECT
		YEAR(Order_Date) AS Year,
		MONTH(Order_Date) AS Month,
		SUM(Sales) AS Sales,
		LAG(SUM(Sales)) OVER (ORDER BY YEAR(Order_Date), MONTH(Order_Date)) AS Prev_Sales
	FROM orders
	GROUP BY YEAR(Order_Date), MONTH(Order_Date)
)t
WHERE Prev_Sales IS NOT NULL
ORDER BY Year, Month;


-- ====================================================
-- Calculate month-over-month sales growth percentage
-- ====================================================
SELECT
	Year,
	Month, 
	Sales,
	ROUND(
    (Sales-Prev_Sales)/Prev_Sales*100, 
    2
    ) AS Growth_Percentage
FROM(
	SELECT
		YEAR(Order_Date) AS Year,
        MONTH(Order_Date) AS Month,
        SUM(Sales) AS Sales,
        LAG(SUM(SALES)) OVER (ORDER BY YEAR(Order_Date), MONTH(Order_Date)) AS Prev_Sales
	FROM orders
    GROUP BY YEAR(Order_Date), MONTH(Order_Date)
)t
WHERE Prev_Sales IS NOT NULL
ORDER BY Year, Month;