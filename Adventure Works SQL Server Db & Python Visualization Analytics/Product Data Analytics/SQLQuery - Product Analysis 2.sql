USE AdventureWorksLT2008R2;
/***SELECT-QUERY***/
SELECT * FROM SalesLT.Product;

/***AGGREGATE-FUNCTIONS***/
/***STANDARD-COST-PRODUCT-ANALYSIS***/
SELECT COUNT(StandardCost) AS [StandardCost Total Count], MIN(StandardCost) AS [StandardCost Min Value], 
MAX(StandardCost) AS [Standard Cost Max Value],AVG(StandardCost) AS [Standard Cost Average] FROM SalesLT.Product;

/***LIST-PRICE-PRODUCT-ANALYSIS***/
SELECT COUNT(ListPrice) AS [ListPrice Total Count],MIN(ListPrice) AS [ListPrice Min Value], 
MAX(ListPrice) AS [ListPrice Max Value],AVG(ListPrice) AS [ListPrice Average] FROM SalesLT.Product;

/***COLOR-PRODUCT-ANALYSIS***/
SELECT DISTINCT(Color) AS [Product Distinct Colors] FROM SalesLT.Product;
SELECT COUNT(DISTINCT(Color)) AS [Product Distinct Color Count] FROM SalesLT.Product;
SELECT Color AS [Product Color Group], AVG(StandardCost) AS [Average Standard Cost], AVG(ListPrice) AS [Average List Price] FROM SalesLT.Product GROUP BY Color;

/***Weight-NULL-VALUE-ANALYSIS***/
SELECT COUNT(Weight) AS [Weight Total Count] FROM SalesLT.Product;
SELECT * FROM SalesLT.Product WHERE Weight IS NULL;
SELECT COUNT(*) AS [Null-Val-Count] FROM SalesLT.Product WHERE Weight IS NULL;