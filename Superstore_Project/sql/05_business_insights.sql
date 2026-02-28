-- Top 5 products by Profit Margin
SELECT 
	Product_Name,
    SUM(Sales) AS Total_Sales,
	SUM(Profit) AS Total_Profit,
    ROUND(SUM(Profit)/SUM(Sales)*100, 2) AS Profit_Margin_Percentage
FROM orders
GROUP BY Product_Name
HAVING SUM(Sales) > 10000
ORDER BY Profit_Margin_Percentage DESC
LIMIT 5;


-- Bottom 5 loss making Product
SELECT 
	Product_Name, 
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM orders
GROUP BY Product_Name
HAVING SUM(Profit) < 0
ORDER BY Total_Profit ASC
LIMIT 5;



-- Category VS Profit Margin
SELECT 
	Category,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND(SUM(Profit)/SUM(Sales)*100, 2) AS Profit_Margin_Percentage
FROM orders
GROUP BY Category
ORDER BY Profit_Margin_Percentage DESC;


-- Impact of Discount and Profitability
SELECT 
	Discount,
    COUNT(*) AS Total_orders,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND(SUM(Profit)/SUM(Sales)*100, 2) AS Profit_Margin_Percentage
FROM orders
GROUP BY Discount
ORDER BY Discount;


-- Region-wise Profitability Analysis
SELECT
	Region,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND(SUM(Profit)/SUM(Sales)*100, 2) AS Profit_Margin_Percentage
FROM orders
GROUP BY Region
ORDER BY Profit_Margin_Percentage DESC;


-- Customer Segment Performance
SELECT
	Segment,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND(SUM(Profit)/SUM(Sales)*100, 2) AS Profit_Margin_Percentage
FROM orders
GROUP BY Segment
ORDER BY Profit_Margin_Percentage DESC;


-- Orders with Discount Greater than 30%
SELECT
	COUNT(*) AS High_Discount_Orders,
    SUM(Profit) AS Total_Profit
FROM orders
WHERE Discount > 0.3;


-- Top 5 most profitable customers
SELECT
	Customer_Name,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM orders
GROUP BY Customer_Name
ORDER BY Total_Profit DESC
LIMIT 5;


-- Yearly sales and profit growth
SELECT 
	YEAR(Order_Date) AS Year,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM orders
GROUP BY YEAR(Order_Date)
ORDER BY Year;


-- Profit Margin by Category and Discount Level
SELECT
	Category,
    Discount,
    ROUND(SUM(Profit)/SUM(Sales)*100, 2) AS Profit_Margin
FROM orders
GROUP BY Category, Discount
ORDER BY Category, Discount;
