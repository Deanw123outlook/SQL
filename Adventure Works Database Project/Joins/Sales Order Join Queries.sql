USE AdventureWorksLT2008R2;
SELECT * FROM SalesLT.SalesOrderDetail;
SELECT * FROM SalesLT.SalesOrderHeader;
SELECT * FROM SalesLt.ProductModel;
SELECT * FROM SalesLT.ProductModelProductDescription;

/***DB-Table-Analysis***/
SELECT DISTINCT(OrderQty) AS [Order Quanitity Distinct] FROM SalesLT.SalesOrderDetail;
SELECT MIN(UnitPrice) AS [Min Price], MAX(UnitPrice) AS [Max Price], SUM(UnitPrice) AS [Sum Price],
AVG(UnitPrice) AS [Average Price] FROM SalesLt.SalesOrderDetail;

/***LEFT-JOIN***/
SELECT x.SalesOrderID, x.OrderQty, x.ProductID, x.UnitPrice, y.Status, y.SalesOrderNumber, y.AccountNumber AS [Bank Account Number] 
FROM SalesLT.SalesOrderDetail AS x LEFT JOIN SalesLT.SalesOrderHeader AS y 
ON x.SalesOrderID = y.SalesOrderID WHERE UnitPrice > 382.87;

/***LEFT-JOIN***/
SELECT t1.ProductModelID, t1.Name, t2.ProductDescriptionID, t2.Culture FROM SalesLT.ProductModel 
AS t1 LEFT JOIN SalesLT.ProductModelProductDescription AS t2 ON t1.ProductModelID = t2.ProductModelID;