Use AdventureWorksLT2008R2;
SELECT * FROM SalesLT.Product;
SELECT DISTINCT(Name) FROM SalesLT.Product;
SELECT COUNT(DISTINCT Name) AS ProductNameCount FROM SalesLT.Product;

SELECT * FROM SalesLT.Product WHERE Color = 'Black' AND ListPrice > 34.99;
SELECT COUNT(*) FROM SalesLT.Product WHERE Color = 'Black' AND ListPrice > 34.99;

SELECT * FROM SalesLT.Product WHERE Color = 'Red' AND ListPrice > 34.99;
SELECT COUNT(*) FROM SalesLT.Product WHERE Color = 'Red' AND ListPrice > 34.99;

SELECT * FROM SalesLT.Product WHERE Color = 'Blue' AND ListPrice > 34.99;
SELECT COUNT(*) FROM SalesLT.Product WHERE Color = 'Blue' AND ListPrice > 34.99;
