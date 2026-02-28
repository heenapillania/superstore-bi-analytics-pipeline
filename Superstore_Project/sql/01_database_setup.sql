-- Create Database
CREATE DATABASE IF NOT EXISTS superstore_db;
USE superstore_db;

-- Create orders table
CREATE TABLE orders(
	Row_ID INT PRIMARY KEY,
	Order_ID VARCHAR(50),
    Order_Date DATE,
    Ship_Date DATE,
    Ship_Mode VARCHAR(50),
    Customer_ID VARCHAR(50),
    Customer_Name VARCHAR(100),
    Segment VARCHAR(50),
    Country VARCHAR(50),
	City VARCHAR(50),
	State VARCHAR(50),
    Postal_Code VARCHAR(20),
	Region VARCHAR(50),
	Product_ID VARCHAR(50),
	Category VARCHAR(50),
	Sub_Category VARCHAR(50),
	Product_Name VARCHAR(255),
    Sales DECIMAL(10, 4),
    Quantity INT,
    Discount DECIMAL(6, 4),
    Profit DECIMAL(10, 4)
);
