-- total rows
SELECT COUNT(*) FROM orders;


-- primary key check
SELECT COUNT(DISTINCT Row_ID) FROM orders;


-- Check for missing financial values
SELECT COUNT(*) 
FROM orders
WHERE Sales IS NULL
OR Profit IS NULL
OR Discount IS NULL;


-- ship date check
SELECT * FROM orders
WHERE Ship_Date < Order_Date;


-- discount range check
SELECT MIN(Discount), MAX(Discount)
FROM orders;


-- Check minimum and maximum sales and profit values
SELECT
MIN(Sales), MAX(Sales), 
MIN(Profit), MAX(Profit)
FROM orders;