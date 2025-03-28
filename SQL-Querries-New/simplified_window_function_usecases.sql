-- WINDOW FUNCTIONS
-- ROW_NUMBER() OVER()
-- Assigning a Unique Sequential Integer to Each Row Within Partitions Defined by the 'Color' Column, Ordered by the 'Color' Column.
SELECT Name,Color,
   ROW_NUMBER() OVER(PARTITION BY Color ORDER BY Color) AS row_number
FROM [AdventureWorksLT2008R2].[SalesLT].[Product];

-- SUM() 
-- Calculating a Running Total of Unit Prices within Each Sales Order.
-- RANK() 
-- Assigning a Rank to Each Sales Order Detail Item Based on its Unit Price within its Respective Sales Order.
SELECT SalesOrderId,UnitPrice,
    SUM(UnitPrice) OVER(PARTITION BY SalesOrderId ORDER BY UnitPrice) AS total_revenue,
	RANK() OVER(PARTITION BY SalesOrderId ORDER BY UnitPrice)
FROM [AdventureWorksLT2008R2].[SalesLT].[SalesOrderDetail];

-- LAG()
-- LAG(ListPrice, 1, 0) OVER (PARTITION BY SellStartDate ORDER BY SellStartDate)
-- LAG(column, offset, default):
--   - Salary: The column from which to retrieve the previous value.
--   - 1: The offset, meaning we want the value from the row immediately preceding the current row.
--   - 0: The default value to return if there is no preceding row within the partition (e.g., for the first employee in each department).
-- OVER (PARTITION BY date ORDER BY date):
--   - PARTITION BY date3: Divides the rows into partitions based on the 'date' column. The LAG() function will operate independently within each date.
--   - ORDER BY date: Orders the rows within each partition by the 'date' column. This determines which row is considered the "previous" row.
SELECT ProductId,Name,ListPrice,SellStartDate,
      LAG(ListPrice,1,0) OVER(PARTITION BY SellStartDate ORDER BY SellStartDate) AS lag_test,
	  ListPrice - LAG(ListPrice) OVER(PARTITION BY SellStartDate ORDER BY SellStartDate)
FROM [AdventureWorksLT2008R2].[SalesLT].[Product];

