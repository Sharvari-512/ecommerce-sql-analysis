CREATE DATABASE my_databases;
USE my_databases;

# 1. Get customers from Asia
select * from customers where region='asia';

# 2. Get all transactions in 2024 sorted by latest first
Select * from transactions where year(transactiondate)=2024 order by transactiondate desc;

# 3. Total revenue generated
select sum(totalvalue) as Total_Revenue from transactions;

# 4. Average order value
select avg(totalvalue) as Avg_Order_Value from transactions;

# 5. Total quantity sold per product
select productID, sum(Quantity) as Total_Quantity_Sold from transactions group by productID;

# 6. Get transaction details with customer and product info
SELECT t.TransactionID, c.CustomerName, p.ProductName, p.Category, t.Quantity, t.TotalValue, t.TransactionDate FROM Transactions t
INNER JOIN Customers c ON t.CustomerID = c.CustomerID
INNER JOIN Products p ON t.ProductID = p.ProductID
ORDER BY t.TransactionDate DESC;

# 7. Revenue by Category (JOIN + GROUP BY)
SELECT p.Category, SUM(t.TotalValue) AS Total_Revenue
FROM Transactions t
INNER JOIN Products p ON t.ProductID = p.ProductID
GROUP BY p.Category
ORDER BY Total_Revenue DESC;

# 8. Revenue by Region
SELECT c.Region, SUM(t.TotalValue) AS Total_Revenue
FROM Transactions t
INNER JOIN Customers c ON t.CustomerID = c.CustomerID
GROUP BY c.Region
ORDER BY Total_Revenue DESC;

# 9. Top 5 Customers by Spending
SELECT c.CustomerName, SUM(t.TotalValue) AS Total_Spent
FROM Transactions t
INNER JOIN Customers c ON t.CustomerID = c.CustomerID
GROUP BY c.CustomerName
ORDER BY Total_Spent DESC
LIMIT 5;

# 10. Subquery Example (Above Average Spending Customers)
SELECT CustomerID, SUM(TotalValue) AS Total_Spent
FROM Transactions
GROUP BY CustomerID
HAVING SUM(TotalValue) > (
    SELECT AVG(TotalValue)
    FROM Transactions
);

# 11. LEFT JOIN (Customers With No Transactions)
SELECT c.CustomerID, c.CustomerName, t.TransactionID
FROM Customers c
LEFT JOIN Transactions t 
ON c.CustomerID = t.CustomerID
WHERE t.TransactionID IS NULL;

# 12. Create a View (For Analysis)
# View: Customer Revenue Summary
CREATE VIEW Customer_Revenue AS
SELECT c.CustomerID, c.CustomerName, c.Region, SUM(t.TotalValue) AS Total_Revenue
FROM Transactions t
INNER JOIN Customers c 
ON t.CustomerID = c.CustomerID
GROUP BY c.CustomerID, c.CustomerName, c.Region;
SELECT * FROM Customer_Revenue ORDER BY Total_Revenue DESC;

# 13. Index Optimization
CREATE INDEX idx_customerid ON Transactions(CustomerID);
CREATE INDEX idx_productid ON Transactions(ProductID);
CREATE INDEX idx_transactiondate ON Transactions(TransactionDate);