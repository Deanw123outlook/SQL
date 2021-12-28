Use AdventureWorksLT2008R2;
SELECT * FROM SalesLT.Product;
SELECT * FROM SalesLT.SalesOrderDetail;

SELECT a1.ProductID AS ProductIdentificationNumberProductTable, a1.Name, a2.ProductID AS 
ProductIdentificationNumberSalesOrderDetailsTable 
FROM SalesLT.Product AS a1
INNER JOIN SalesLT.SalesOrderDetail AS a2
ON a1.ProductID = a2.ProductID;