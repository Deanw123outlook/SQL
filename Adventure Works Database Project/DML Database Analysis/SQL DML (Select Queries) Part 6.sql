Use AdventureWorksLT2008R2;
/***SELECT-STATEMENT***/
SELECT * FROM SalesLT.SalesOrderDetail;
SELECT * FROM SalesLT.SalesOrderHeader;
SELECT * FROM SalesLT.Product;
SELECT * FROM SalesLT.Address;

/***SELECT-DISTINCT-UNIQUE**/
SELECT DISTINCT ProductID FROM SalesLT.SalesOrderDetail;
SELECT COUNT(DISTINCT ProductID) AS [DISTINCT PRODUCT ID COUNT] FROM SalesLT.SalesOrderDetail;

SELECT DISTINCT CountryRegion FROM SalesLT.Address;
SELECT COUNT(DISTINCT CountryRegion) AS [DISTINCT COUNTRY/REGION COUNT] FROM SalesLT.Address;

SELECT DISTINCT City FROM SalesLT.Address;
SELECT COUNT(DISTINCT City) AS [DISTINCT CITY COUNT] FROM SalesLT.Address;

SELECT DISTINCT StateProvince FROM SalesLT.Address;
SELECT COUNT(DISTINCT StateProvince) AS [DISTINCT STATE/PROVINCE COUNT] FROM SalesLT.Address;

SELECT City, COUNT(City) AS [CITY SPECIFIC COUNT] FROM  SalesLT.Address GROUP BY City ORDER BY [CITY SPECIFIC COUNT] DESC;
SELECT StateProvince, COUNT(StateProvince) AS [State/Province SPECIFIC COUNT] FROM  SalesLT.Address GROUP BY StateProvince ORDER BY [State/Province SPECIFIC COUNT] DESC;

/***GROUP-BY-CLAUS***/
SELECT Color, COUNT(Color) AS [Color Count], AVG(StandardCost) AS [Average Standard Cost] FROM SalesLT.Product GROUP BY Color;

/***WHERE-AND-CLAUS***/
SELECT * FROM SalesLT.Product WHERE Color = 'White' AND ListPrice <= 15.00;

/***BETWEEN-CLAUS***/
SELECT * FROM SalesLT.Product WHERE Color = 'White' AND ListPrice BETWEEN 5.00 AND 20.00;

/***AND/OR/BETWEEN***/
SELECT * FROM SalesLT.Product WHERE ListPrice BETWEEN 0.00 AND 50.00 AND (Color = 'White' OR Color = 'Black')

/***ORDER-BY-CLAUS***/
SELECT * FROM SalesLT.Product ORDER BY Name DESC;
SELECT * FROM SalesLT.Product ORDER BY Name ASC;

/***Group-By-&-Aggregate-Functions***/
SELECT OrderQty, COUNT(OrderQty) AS [OrderQty Count], MAX(UnitPrice) AS [Max Unit Price], MIN(UnitPrice) AS [Minimum Unit Price],AVG(UnitPrice) AS [Avergae Unit Price]  FROM SalesLt.SalesOrderDetail GROUP BY OrderQty ORDER BY OrderQty DESC;

/***Checking-DB-Tables-for-specific-Data-via-(WILDCARD-%)***/
SELECT * FROM SalesLT.SalesOrderDetail WHERE rowguid LIKE 'E3A1994C-7A68-4CE8-96A3-77FDD3BBD730';
SELECT * FROM SalesLT.Product WHERE Name LIKE 'A%';

