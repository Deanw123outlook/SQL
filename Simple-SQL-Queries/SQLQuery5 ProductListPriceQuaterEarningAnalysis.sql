Use AdventureWorksLT2008R2;
SELECT * FROM SalesLT.Product;
SELECT COUNT(*) AS ObservationTotalProducts FROM SalesLT.Product;

SELECT Min(ListPrice) AS MinimumListPriceQuaterEarnings FROM SalesLT.Product;
SELECT Max(ListPrice) AS MaximumListPriceQuaterEarnings FROM SalesLT.Product;
SELECT Avg(ListPrice) AS AverageListPriceQuaterEarnings FROM SalesLT.Product;
SELECT Sum(ListPrice) AS SumTotalListPriceQuaterEarnings FROM SalesLT.Product;
